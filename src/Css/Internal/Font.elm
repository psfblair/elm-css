module Css.Internal.Font
  ( FontDescriptor, ComposedFontDescriptor
  , FontAlternative (..), FontComponents (..), fontFactory, fontValueFactory
  , GenericFontFamily, GenericFontFamilyDescriptor
  , genericFontFamilyFactory, genericFontFamilyValueFactory
  , FontSize, FontSizeDescriptor, fontSizeFactory, fontSizeValueFactory
  , FontStyle, FontStyleDescriptor, fontStyleFactory, fontStyleValueFactory
  , FontVariant, FontVariantDescriptor, fontVariantFactory, fontVariantValueFactory
  , FontWeight, FontWeightDescriptor, fontWeightFactory, fontWeightValueFactory
  ) where

import Css.Internal.Common exposing 
  (inheritValue, initialValue, normalValue, otherValue)
import Css.Internal.Property exposing 
  ( Value, ValueFactory, Literal (..)
  , stringValueFactory, literalValueFactory, valueValueFactory, maybeValueFactory
  , commaListValueFactory, spaceListValueFactory
  , intersperse
  )
import Css.Size exposing (Size, sizeValueFactory)

-------------------------------------------------------------------------------

{- We implement the `font` property to accept multiple value types. This lets 
us combine different font aspects into a shorthand syntax. According to the spec,
fonts have a mandatory part and an optional part.

font: font-style font-variant font-weight font-size/line-height font-family
      |caption|icon|menu|message-box|small-caption|status-bar|initial|inherit;
where in the first part, font-style font-variant font-weight are optional.

See <http://www.w3.org/TR/css3-fonts/#font-prop>

So we accommodate:
  font <| baseFont (px 15) ["Arial"] [sansSerif] 
        => font: 15px arial, sans-serif;
        
  baseFont (px 12) ["Georgia"] [Serif] 
    |> withLineHeight (px 30) 
    |> withWeight bold 
    |> withStyle italic 
    |> font
        => font: italic bold 12px/30px "Georgia", serif;
        
  font caption 
        => font: caption;
        
  font initial 
        => font: initial;
-}
type alias FontDescriptor a sz = FontFactory sz -> Font a sz

type alias Font a sz = { a | font : FontAlternative sz }
type alias WithComponents sz = { fontComponents : FontComponents sz }
type alias ComposedFont sz = Font (WithComponents sz) sz

type FontAlternative sz
  = NamedFont String
  | CompositeFont (FontComponents sz)
  | InitialFont
  | InheritFont

-- Font sizes can be absolute or relative
type FontComponents sz
  = BaseComponent (Size sz) (List String) (List GenericFontFamily)
  -- Line height case needs to be a second kind of leaf, to ease rendering
  | WithLineHeight (Size sz) (Size sz) (List String) (List GenericFontFamily)
  | WithWeight FontWeight (ComposedFont sz)
  | WithVariant FontVariant (ComposedFont sz)
  | WithStyle FontStyle (ComposedFont sz)

type alias FontFactory sz =
  { leaf : Size sz -> List String -> List GenericFontFamily -> ComposedFont sz
  , composite : (ComposedFont sz -> FontComponents sz) -> ComposedFont sz -> ComposedFont sz 
  , named : String -> Font {} sz
  , initial_ : Font {} sz
  , inherit_ : Font {} sz
  }

fontFactory : FontFactory sz
fontFactory =
  { leaf size customFonts genericFonts = 
      let baseComponent = BaseComponent size customFonts genericFonts 
      in { font = CompositeFont baseComponent, fontComponents = baseComponent }
  , composite composer innerComposedFont =
      let newComponents = composer innerComposedFont
      in { font = CompositeFont newComponents, fontComponents = newComponents } 
  , named str  = { font = NamedFont str}
  , initial_   = { font = InitialFont }
  , inherit_   = { font = InheritFont }
  }
    
type alias ComposedFontDescriptor sz = FontFactory sz -> ComposedFont sz

fontValueFactory : ValueFactory (Font a sz)
fontValueFactory =
  { value font = 
      case font.font of
        NamedFont str -> stringValueFactory.value str
        InitialFont -> initialValue
        InheritFont -> inheritValue
        CompositeFont fontComponents -> componentsToValue fontComponents
  }

componentsToValue : FontComponents sz -> Value
componentsToValue fontComponents = 
  componentsToValueRecursive fontComponents Nothing Nothing Nothing


componentsToValueRecursive : FontComponents sz -> 
                             Maybe FontWeight ->
                             Maybe FontVariant -> 
                             Maybe FontStyle -> 
                             Value
componentsToValueRecursive components maybeWeight maybeVariant maybeStyle =
  case components of
      -- If the FontComponents combinators are called more than once,
      -- the last (outer) one wins. So if it's already set we don't reset it.
      WithWeight weight innerComposedFont ->
        let inner = innerComposedFont.fontComponents
        in case maybeWeight of
          Just weight -> 
            componentsToValueRecursive inner maybeWeight maybeVariant maybeStyle
          Nothing -> 
            componentsToValueRecursive inner (Just weight) maybeVariant maybeStyle
      WithVariant variant innerComposedFont ->
        let inner = innerComposedFont.fontComponents
        in case maybeVariant of
          Just variant -> 
            componentsToValueRecursive inner maybeWeight maybeVariant maybeStyle
          Nothing -> 
            componentsToValueRecursive inner maybeWeight (Just variant) maybeStyle
      WithStyle style innerComposedFont ->
        let inner = innerComposedFont.fontComponents
        in case maybeStyle of
          Just style -> 
            componentsToValueRecursive inner maybeWeight maybeVariant maybeStyle
          Nothing -> 
            componentsToValueRecursive inner maybeWeight maybeVariant (Just style)
      BaseComponent fontSize customFamilies genericFamilies -> 
        -- should go to "italic bold 15px arial, sans-serif"
        let fontSizeValue = sizeValueFactory.value fontSize
        in componentsLeafToValue fontSizeValue
                                 customFamilies 
                                 genericFamilies 
                                 maybeWeight 
                                 maybeVariant 
                                 maybeStyle
      WithLineHeight fontSize lineHeight customFamilies genericFamilies -> 
        -- should go to "italic bold 12px/30px Georgia, serif"
        let fontSizeValue = sizeValueFactory.value lineHeight
            lineHeightValue = sizeValueFactory.value fontSize
            sizes = intersperse "/" [ fontSizeValue, lineHeightValue ]
        in componentsLeafToValue fontSizeValue
                                 customFamilies 
                                 genericFamilies 
                                 maybeWeight 
                                 maybeVariant 
                                 maybeStyle

{- font-style font-variant font-weight font-size font-family
or
   font-style font-variant font-weight font-size/line-height font-family
where font-family is comma-separated
-}
componentsLeafToValue : Value -> 
                        List String ->
                        List GenericFontFamily ->
                        Maybe FontWeight ->
                        Maybe FontVariant -> 
                        Maybe FontStyle -> 
                        Value 
componentsLeafToValue sizeValue
                      customFamilies 
                      genericFamilies 
                      maybeWeight 
                      maybeVariant 
                      maybeStyle =
        let customFamilyValues = 
              customFamilies |> List.map Literal |> List.map literalValueFactory.value
            genericFamilyValues = 
              genericFamilies |> List.map genericFontFamilyValueFactory.value
            familyValues = customFamilyValues ++ genericFamilyValues
            familiesValue = 
              (commaListValueFactory valueValueFactory).value familyValues
            fontStyleValue = 
              (maybeValueFactory fontStyleValueFactory).value maybeStyle
            fontVariantValue =
              (maybeValueFactory fontVariantValueFactory).value maybeVariant
            fontWeightValue =   
              (maybeValueFactory fontWeightValueFactory).value maybeWeight
        in (spaceListValueFactory valueValueFactory).value 
            [ fontStyleValue
            , fontVariantValue
            , fontWeightValue
            , sizeValue
            , familiesValue] 

-------------------------------------------------------------------------------

-- The five generic font families.
-- <http://www.w3.org/TR/css3-fonts/#generic-font-families>.

type alias GenericFontFamilyDescriptor = 
  GenericFontFamilyFactory -> GenericFontFamily

type GenericFontFamily 
  = GenericFontFamily String
  | InitialGenericFontFamily
  | InheritGenericFontFamily
  | OtherGenericFontFamily String

type alias GenericFontFamilyFactory =
  {
    family: String -> GenericFontFamily
  , initial: GenericFontFamily
  , inherit: GenericFontFamily
  , other: String -> GenericFontFamily
  }


genericFontFamilyFactory : GenericFontFamilyFactory
genericFontFamilyFactory =
  {
    family str = GenericFontFamily str
  , initial = InitialGenericFontFamily
  , inherit = InheritGenericFontFamily
  , other str = OtherGenericFontFamily str
  }


genericFontFamilyValueFactory : ValueFactory GenericFontFamily
genericFontFamilyValueFactory =
  { value fontFamily =
      case fontFamily of
        GenericFontFamily str -> stringValueFactory.value str
        InitialGenericFontFamily -> initialValue
        InheritGenericFontFamily -> inheritValue
        OtherGenericFontFamily str -> otherValue str
  }
-------------------------------------------------------------------------------

type alias FontSizeDescriptor = FontSizeFactory -> FontSize

type FontSize 
  = FontSize String
  | InitialFontSize
  | InheritFontSize
  | OtherFontSize String

type alias FontSizeFactory =
  {
    size: String -> FontSize
  , initial: FontSize
  , inherit: FontSize
  , other: String -> FontSize
  }


fontSizeFactory : FontSizeFactory
fontSizeFactory =
  {
    size str = FontSize str
  , initial = InitialFontSize
  , inherit = InheritFontSize
  , other str = OtherFontSize str
  }


fontSizeValueFactory : ValueFactory FontSize
fontSizeValueFactory =
  { value fontSize =
      case fontSize of
        FontSize str -> stringValueFactory.value str
        InitialFontSize -> initialValue
        InheritFontSize -> inheritValue
        OtherFontSize str -> otherValue str
  }

-------------------------------------------------------------------------------

type alias FontStyleDescriptor = FontStyleFactory -> FontStyle

type FontStyle 
  = FontStyle String
  | NormalFontStyle
  | InheritFontStyle
  | InitialFontStyle
  | OtherFontStyle String

type alias FontStyleFactory =
  {
    style: String -> FontStyle
  , initial: FontStyle
  , inherit: FontStyle
  , other: String -> FontStyle
  }


fontStyleFactory : FontStyleFactory
fontStyleFactory =
  {
    style str = FontStyle str
  , initial = InitialFontStyle
  , inherit = InheritFontStyle
  , other str = OtherFontStyle str
  }


fontStyleValueFactory : ValueFactory FontStyle
fontStyleValueFactory =
  { value fontStyle =
      case fontStyle of
        FontStyle str -> stringValueFactory.value str
        InitialFontStyle -> initialValue
        InheritFontStyle -> inheritValue
        OtherFontStyle str -> otherValue str
  }

-------------------------------------------------------------------------------

type alias FontVariantDescriptor = FontVariantFactory -> FontVariant

type FontVariant 
  = FontVariant String
  | NormalFontVariant
  | InheritFontVariant
  | InitialFontVariant
  | OtherFontVariant String

type alias FontVariantFactory =
  {
    variant: String -> FontVariant
  , normal: FontVariant
  , initial: FontVariant
  , inherit: FontVariant
  , other: String -> FontVariant
  }


fontVariantFactory : FontVariantFactory
fontVariantFactory =
  {
    variant str = FontVariant str
  , normal = NormalFontVariant
  , initial = InitialFontVariant
  , inherit = InheritFontVariant
  , other str = OtherFontVariant str
  }


fontVariantValueFactory : ValueFactory FontVariant
fontVariantValueFactory =
  { value fontVariant =
      case fontVariant of
        FontVariant str -> stringValueFactory.value str
        NormalFontVariant -> normalValue
        InitialFontVariant -> initialValue
        InheritFontVariant -> inheritValue
        OtherFontVariant str -> otherValue str
  }

-------------------------------------------------------------------------------

type alias FontWeightDescriptor = FontWeightFactory -> FontWeight

type FontWeight 
  = FontWeight String
  | NormalFontWeight
  | InheritFontWeight
  | InitialFontWeight
  | OtherFontWeight String


type alias FontWeightFactory =
  {
    weight: String -> FontWeight
  , normal: FontWeight
  , initial: FontWeight
  , inherit: FontWeight
  , other: String -> FontWeight
  }


fontWeightFactory : FontWeightFactory
fontWeightFactory =
  {
    weight str = FontWeight str
  , normal = NormalFontWeight
  , initial = InitialFontWeight
  , inherit = InheritFontWeight
  , other str = OtherFontWeight str
  }


fontWeightValueFactory : ValueFactory FontWeight
fontWeightValueFactory =
  { value fontWeight =
      case fontWeight of
        FontWeight str -> stringValueFactory.value str
        NormalFontWeight -> normalValue
        InitialFontWeight -> initialValue
        InheritFontWeight -> inheritValue
        OtherFontWeight str -> otherValue str
  }

-------------------------------------------------------------------------------
