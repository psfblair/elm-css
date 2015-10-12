module Css.Border (
  -- * Stroke type, used for border-style and outline-style.
    Stroke
  , solid, dotted, dashed, double, wavy, groove, ridge, inset, outset

  -- * Border properties.

  , border, borderTop, borderLeft, borderBottom, borderRight
  , borderColor, borderLeftColor, borderRightColor, borderTopColor, borderBottomColor, borderColor4
  , borderStyle, borderLeftStyle, borderRightStyle, borderTopStyle, borderBottomStyle, borderStyle4
  , borderWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderBottomWidth, borderWidth4

  -- * Outline properties.

  , outline, outlineTop, outlineLeft, outlineBottom, outlineRight
  , outlineColor, outlineLeftColor, outlineRightColor, outlineTopColor, outlineBottomColor, outlineColor4
  , outlineStyle, outlineLeftStyle, outlineRightStyle, outlineTopStyle, outlineBottomStyle, outlineStyle4
  , outlineWidth, outlineLeftWidth, outlineRightWidth, outlineTopWidth, outlineBottomWidth, outlineWidth4
  , outlineOffset

  -- * Border radius.

  , borderRadius
  , borderTopLeftRadius, borderTopRightRadius
  , borderBottomLeftRadius, borderBottomRightRadius

  -- * Collapsing borders model for a table
  , borderCollapse
  , borderSpacing, borderSpacing2

  -- * Used by other modules
  , StrokeDescriptor

  ) where

import Css.Internal.Property exposing
  ( Value, ValueFactory, stringKey
  , stringValueFactory, spacePairValueFactory
  , spaceTripleValueFactory, spaceQuadrupleValueFactory
  )
import Css.Internal.Stylesheet exposing (PropertyRuleAppender, key)

import Css.Common exposing (
  Other, Inherit, Auto, None
  , otherValueFactory, inheritValueFactory, autoValueFactory, noneValueFactory
  )
import Css.Size exposing (Size, Abs, SizeDescriptor, sizeFactory, sizeValueFactory)
import Css.Color exposing (Color, colorValueFactory)
import Css.Display exposing
  ( Visibility, VisibilityDescriptor
  , visibilityFactory, visibilityValueFactory
  )

-------------------------------------------------------------------------------

type Stroke
  = Stroke String
  | NoStroke
  | InheritStroke
  | AutoStroke
  | OtherStroke Value

-- See bottom of this file for the additional boilerplate types
type alias StrokeDescriptor = StrokeFactory -> Stroke

solid : StrokeDescriptor
solid factory = factory.stroke "solid"

dotted : StrokeDescriptor
dotted factory = factory.stroke "dotted"

dashed : StrokeDescriptor
dashed factory = factory.stroke "dashed"

double : StrokeDescriptor
double factory = factory.stroke "double"

wavy : StrokeDescriptor
wavy factory = factory.stroke "wavy"

groove : StrokeDescriptor
groove factory = factory.stroke "groove"

ridge : StrokeDescriptor
ridge factory = factory.stroke "ridge"

inset : StrokeDescriptor
inset factory = factory.stroke "inset"

outset : StrokeDescriptor
outset factory = factory.stroke "outset"

-------------------------------------------------------------------------------

border : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
border strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      size = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "border") (stroke, size, color) valueFactory

borderTop : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
borderTop strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      width = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "border-top") (stroke, width, color) valueFactory

borderLeft : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
borderLeft strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      width = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "border-left") (stroke, width, color) valueFactory

borderBottom : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
borderBottom strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      width = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "border-bottom") (stroke, width, color) valueFactory

borderRight : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
borderRight strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      width = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "border-right") (stroke, width, color) valueFactory

-------------------------------------------------------------------------------

borderColor : Color -> PropertyRuleAppender
borderColor color = key (stringKey "border-color") color colorValueFactory

borderLeftColor : Color -> PropertyRuleAppender
borderLeftColor color = key (stringKey "border-left-color") color colorValueFactory

borderRightColor : Color -> PropertyRuleAppender
borderRightColor color = key (stringKey "border-right-color") color colorValueFactory

borderTopColor : Color -> PropertyRuleAppender
borderTopColor color = key (stringKey "border-top-color") color colorValueFactory

borderBottomColor : Color -> PropertyRuleAppender
borderBottomColor color = key (stringKey "border-bottom-color") color colorValueFactory

borderColor4 : Color -> Color -> Color -> Color -> PropertyRuleAppender
borderColor4 colorA colorB colorC colorD =
  let valueFactory =
    spaceQuadrupleValueFactory colorValueFactory colorValueFactory colorValueFactory colorValueFactory
  in key (stringKey "border-color") (colorA, colorB, colorC, colorD) valueFactory

-------------------------------------------------------------------------------

borderStyle : StrokeDescriptor -> PropertyRuleAppender
borderStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "border-style") style strokeValueFactory

borderLeftStyle : StrokeDescriptor -> PropertyRuleAppender
borderLeftStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "border-left-style") style strokeValueFactory

borderRightStyle : StrokeDescriptor -> PropertyRuleAppender
borderRightStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "border-right-style") style strokeValueFactory

borderTopStyle : StrokeDescriptor -> PropertyRuleAppender
borderTopStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "border-top-style") style strokeValueFactory

borderBottomStyle : StrokeDescriptor -> PropertyRuleAppender
borderBottomStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "border-bottom-style") style strokeValueFactory

borderStyle4 : StrokeDescriptor ->
               StrokeDescriptor ->
               StrokeDescriptor ->
               StrokeDescriptor ->
               PropertyRuleAppender
borderStyle4 strokeDescriptorA strokeDescriptorB strokeDescriptorC strokeDescriptorD =
  let strokeA = strokeDescriptorA strokeFactory
      strokeB = strokeDescriptorB strokeFactory
      strokeC = strokeDescriptorC strokeFactory
      strokeD = strokeDescriptorD strokeFactory
      svf = strokeValueFactory
      valueFactory = spaceQuadrupleValueFactory svf svf svf svf
  in key (stringKey "border-style") (strokeA, strokeB, strokeC, strokeD) valueFactory

-------------------------------------------------------------------------------

borderWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
borderWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "border-width") size sizeValueFactory

borderLeftWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
borderLeftWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "border-left-width") size sizeValueFactory

borderRightWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
borderRightWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "border-right-width") size sizeValueFactory

borderTopWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
borderTopWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "border-top-width") size sizeValueFactory

borderBottomWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
borderBottomWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "border-bottom-width") size sizeValueFactory

borderWidth4 : SizeDescriptor (Size Abs) Abs ->
               SizeDescriptor (Size Abs) Abs ->
               SizeDescriptor (Size Abs) Abs ->
               SizeDescriptor (Size Abs) Abs ->
               PropertyRuleAppender
borderWidth4 sizeDescriptorA sizeDescriptorB sizeDescriptorC sizeDescriptorD =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      sizeC = sizeDescriptorC sizeFactory
      sizeD = sizeDescriptorD sizeFactory
      valueFactory =
        spaceQuadrupleValueFactory sizeValueFactory sizeValueFactory sizeValueFactory sizeValueFactory
  in key (stringKey "border-width") (sizeA, sizeB, sizeC, sizeD) valueFactory

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

outline : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
outline strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      size = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "outline") (stroke, size, color) valueFactory

outlineTop : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
outlineTop strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      size = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "outline-top") (stroke, size, color) valueFactory

outlineLeft : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
outlineLeft strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      size = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "outline-left") (stroke, size, color) valueFactory

outlineBottom : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
outlineBottom strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      size = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "outline-bottom") (stroke, size, color) valueFactory

outlineRight : StrokeDescriptor -> SizeDescriptor (Size Abs) Abs -> Color -> PropertyRuleAppender
outlineRight strokeDescriptor sizeDescriptor color =
  let stroke = strokeDescriptor strokeFactory
      size = sizeDescriptor sizeFactory
      valueFactory =
        spaceTripleValueFactory strokeValueFactory sizeValueFactory colorValueFactory
  in key (stringKey "outline-right") (stroke, size, color) valueFactory

-------------------------------------------------------------------------------

outlineColor : Color -> PropertyRuleAppender
outlineColor color = key (stringKey "outline-color") color colorValueFactory

outlineLeftColor : Color -> PropertyRuleAppender
outlineLeftColor color = key (stringKey "outline-left-color") color colorValueFactory

outlineRightColor : Color -> PropertyRuleAppender
outlineRightColor color = key (stringKey "outline-right-color") color colorValueFactory

outlineTopColor : Color -> PropertyRuleAppender
outlineTopColor color = key (stringKey "outline-top-color") color colorValueFactory

outlineBottomColor : Color -> PropertyRuleAppender
outlineBottomColor color = key (stringKey "outline-bottom-color") color colorValueFactory

outlineColor4 : Color -> Color -> Color -> Color -> PropertyRuleAppender
outlineColor4 colorA colorB colorC colorD =
  let valueFactory =
    spaceQuadrupleValueFactory colorValueFactory colorValueFactory colorValueFactory colorValueFactory
  in key (stringKey "outline-color") (colorA, colorB, colorC, colorD) valueFactory

-------------------------------------------------------------------------------

outlineStyle : StrokeDescriptor -> PropertyRuleAppender
outlineStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "outline-style") style strokeValueFactory

outlineLeftStyle : StrokeDescriptor -> PropertyRuleAppender
outlineLeftStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "outline-left-style") style strokeValueFactory

outlineRightStyle : StrokeDescriptor -> PropertyRuleAppender
outlineRightStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "outline-right-style") style strokeValueFactory

outlineTopStyle : StrokeDescriptor -> PropertyRuleAppender
outlineTopStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "outline-top-style") style strokeValueFactory

outlineBottomStyle : StrokeDescriptor -> PropertyRuleAppender
outlineBottomStyle strokeDescriptor =
  let style = strokeDescriptor strokeFactory
  in key (stringKey "outline-bottom-style") style strokeValueFactory

outlineStyle4 : StrokeDescriptor ->
                StrokeDescriptor ->
                StrokeDescriptor ->
                StrokeDescriptor ->
                PropertyRuleAppender
outlineStyle4 strokeDescriptorA strokeDescriptorB strokeDescriptorC strokeDescriptorD =
  let strokeA = strokeDescriptorA strokeFactory
      strokeB = strokeDescriptorB strokeFactory
      strokeC = strokeDescriptorC strokeFactory
      strokeD = strokeDescriptorD strokeFactory
      valueFactory =
        spaceQuadrupleValueFactory strokeValueFactory strokeValueFactory strokeValueFactory strokeValueFactory
  in key (stringKey "outline-style") (strokeA, strokeB, strokeC, strokeD) valueFactory

-------------------------------------------------------------------------------

outlineWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
outlineWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "outline-width") size sizeValueFactory

outlineLeftWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
outlineLeftWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "outline-left-width") size sizeValueFactory

outlineRightWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
outlineRightWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "outline-right-width") size sizeValueFactory

outlineTopWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
outlineTopWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "outline-top-width") size sizeValueFactory

outlineBottomWidth : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
outlineBottomWidth sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "outline-bottom-width") size sizeValueFactory

outlineOffset : SizeDescriptor (Size Abs) Abs -> PropertyRuleAppender
outlineOffset sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "outline-offset") size sizeValueFactory

outlineWidth4 : SizeDescriptor (Size Abs) Abs ->
                SizeDescriptor (Size Abs) Abs ->
                SizeDescriptor (Size Abs) Abs ->
                SizeDescriptor (Size Abs) Abs ->
                PropertyRuleAppender
outlineWidth4 sizeDescriptorA sizeDescriptorB sizeDescriptorC sizeDescriptorD =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      sizeC = sizeDescriptorC sizeFactory
      sizeD = sizeDescriptorD sizeFactory
      valueFactory =
        spaceQuadrupleValueFactory sizeValueFactory sizeValueFactory sizeValueFactory sizeValueFactory
  in key (stringKey "outline-width") (sizeA, sizeB, sizeC, sizeD) valueFactory

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

borderRadius : SizeDescriptor (Size a) a ->
               SizeDescriptor (Size b) b ->
               SizeDescriptor (Size c) c ->
               SizeDescriptor (Size d) d ->
               PropertyRuleAppender
borderRadius sizeDescriptorA sizeDescriptorB sizeDescriptorC sizeDescriptorD =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      sizeC = sizeDescriptorC sizeFactory
      sizeD = sizeDescriptorD sizeFactory
      szf = sizeValueFactory
      valueFactory = spaceQuadrupleValueFactory szf szf szf szf
  in key (stringKey "border-radius") (sizeA, sizeB, sizeC, sizeD) valueFactory

borderTopLeftRadius : SizeDescriptor (Size a) a ->
                      SizeDescriptor (Size b) b ->
                      PropertyRuleAppender
borderTopLeftRadius sizeDescriptorA sizeDescriptorB =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      valueFactory = spacePairValueFactory sizeValueFactory sizeValueFactory
  in key (stringKey "border-top-left-radius") (sizeA, sizeB) valueFactory

borderTopRightRadius : SizeDescriptor (Size a) a ->
                       SizeDescriptor (Size b) b ->
                       PropertyRuleAppender
borderTopRightRadius sizeDescriptorA sizeDescriptorB =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      valueFactory = spacePairValueFactory sizeValueFactory sizeValueFactory
  in key (stringKey "border-top-right-radius") (sizeA, sizeB) valueFactory

borderBottomLeftRadius : SizeDescriptor (Size a) a ->
                         SizeDescriptor (Size b) b ->
                         PropertyRuleAppender
borderBottomLeftRadius sizeDescriptorA sizeDescriptorB =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      valueFactory = spacePairValueFactory sizeValueFactory sizeValueFactory
  in key (stringKey "border-bottom-left-radius") (sizeA, sizeB) valueFactory

borderBottomRightRadius : SizeDescriptor (Size a) a ->
                          SizeDescriptor (Size b) b ->
                          PropertyRuleAppender
borderBottomRightRadius sizeDescriptorA sizeDescriptorB =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      valueFactory = spacePairValueFactory sizeValueFactory sizeValueFactory
  in key (stringKey "border-bottom-right-radius") (sizeA, sizeB) valueFactory

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

borderCollapse : VisibilityDescriptor -> PropertyRuleAppender
borderCollapse visibilityDescriptor =
  let visibility = visibilityDescriptor visibilityFactory
  in key (stringKey "border-collapse") visibility visibilityValueFactory

borderSpacing : SizeDescriptor (Size a) a -> PropertyRuleAppender
borderSpacing sizeDescriptor =
  let size = sizeDescriptor sizeFactory
  in key (stringKey "border-spacing") size sizeValueFactory

borderSpacing2 : SizeDescriptor (Size a) a ->
                 SizeDescriptor (Size b) b ->
                 PropertyRuleAppender
borderSpacing2 sizeDescriptorA sizeDescriptorB =
  let sizeA = sizeDescriptorA sizeFactory
      sizeB = sizeDescriptorB sizeFactory
      valueFactory = spacePairValueFactory sizeValueFactory sizeValueFactory
  in key (stringKey "border-spacing") (sizeA, sizeB) valueFactory

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- Ancillary types used for implementation. These substitute for Clay's typeclasses.

type alias StrokeFactory =
  {
    stroke: String -> Stroke
  , none: Stroke
  , inherit: Stroke
  , auto: Stroke
  , other: Value -> Stroke
  }

strokeFactory : StrokeFactory
strokeFactory =
  {
    stroke str = Stroke str
  , none = NoStroke
  , inherit = InheritStroke
  , auto = AutoStroke
  , other val = OtherStroke val
  }

strokeValueFactory : ValueFactory Stroke
strokeValueFactory =
  { value stroke =
      case stroke of
        Stroke str -> stringValueFactory.value str
        NoStroke -> noneValueFactory.none
        InheritStroke -> inheritValueFactory.inherit
        AutoStroke -> autoValueFactory.auto
        OtherStroke val -> otherValueFactory.other val
  }
