module Css.Selector where

newtype Fix f = In { out : f (Fix f) }
-- instance Show (f (Fix f)) => Show (Fix f)

type Path f
  = Star
  | Elem      Text
  | Child     f f
  | Deep      f f
  | Adjacent  f f
  | Combined  f f
  deriving Show

data SelectorF a = SelectorF Refinement (Path a)
  -- deriving Show
  
type Selector = Fix SelectorF
  -- instance IsString (Fix SelectorF) where fromString = text . fromString

text : String -> Selector
text str = In $
  case Text.uncons str of
    Just ('#', s) -> SelectorF (Refinement [Id s]) Star
    Just ('.', s) -> SelectorF (Refinement [Class s]) Star
    _             -> SelectorF (Refinement []) (Elem t)

instance Monoid (Fix SelectorF) where
  mempty      = error "Selector is a semigroup"
  mappend a b = In (SelectorF (Refinement []) (Combined a b))

-------------------------------------------------------------------------------

data Predicate
  = Id           String
  | Class        String
  | Attr         String
  | AttrVal      String String
  | AttrBegins   String String
  | AttrEnds     String String
  | AttrContains String String
  | AttrSpace    String String
  | AttrHyph     String String
  | Pseudo       String
  | PseudoFunc   String [String]

newtype Refinement = Refinement { unFilter : [Predicate] }
  deriving Show

instance IsString Refinement where
  fromString = filterFromText . fromString

filterFromText : Text -> Refinement
filterFromText t = Refinement $
  case Text.uncons t of
    Just ('#', s) -> [Id     s]
    Just ('.', s) -> [Class  s]
    Just (':', s) -> [Pseudo s]
    Just ('@', s) -> [Attr   s]
    _             -> [Attr   t]

-------------------------------------------------------------------------------

{-| The star selector applies to all elements. Maps to @*@ in CSS. -}

star : Selector
star = In (SelectorF (Refinement []) Star)

-- | Select elements by name. The preferred syntax is to enable
-- @OverloadedStrings@ and actually just use @\"element-name\"@ or use one of
-- the predefined elements from "Clay.Elements".

element : Text -> Selector
element e = In (SelectorF (Refinement []) (Elem e))

-- | Named alias for `**`.

deep : Selector -> Selector -> Selector
deep a b = In (SelectorF (Refinement []) (Deep a b))

-- | The deep selector composer. Maps to @sel1 sel2@ in CSS.

(**) : Selector -> Selector -> Selector
(**) = deep

-- | Named alias for `|>`.

child : Selector -> Selector -> Selector
child a b = In (SelectorF (Refinement []) (Child a b))

-- | The child selector composer. Maps to @sel1 > sel2@ in CSS.

(|>) : Selector -> Selector -> Selector
(|>) = child

-- | The adjacent selector composer. Maps to @sel1 + sel2@ in CSS.

(|+) : Selector -> Selector -> Selector
(|+) a b = In (SelectorF (Refinement []) (Adjacent a b))

-- | Named alias for `#`.

with : Selector -> Refinement -> Selector
with (In (SelectorF (Refinement fs) e)) (Refinement ps) = In (SelectorF (Refinement (fs ++ ps)) e)

-- | The filter selector composer, adds a filter to a selector. Maps to
-- something like @sel#filter@ or @sel.filter@ in CSS, depending on the filter.

(#) : Selector -> Refinement -> Selector
(#) = with

-- | Filter elements by id. The preferred syntax is to enable
-- @OverloadedStrings@ and use @\"#id-name\"@.

byId : Text -> Refinement
byId = Refinement . pure . Id

-- | Filter elements by class. The preferred syntax is to enable
-- @OverloadedStrings@ and use @\".class-name\"@.

byClass : Text -> Refinement
byClass = Refinement . pure . Class

-- | Filter elements by pseudo selector or pseudo class. The preferred syntax
-- is to enable @OverloadedStrings@ and use @\":pseudo-selector\"@ or use one
-- of the predefined ones from "Clay.Pseudo".

pseudo : Text -> Refinement
pseudo = Refinement . pure . Pseudo

-- | Filter elements by pseudo selector functions. The preferred way is to use
-- one of the predefined functions from "Clay.Pseudo".

func : Text -> [Text] -> Refinement
func f = Refinement . pure . PseudoFunc f

-- | Filter elements based on the presence of a certain attribute. The
-- preferred syntax is to enable @OverloadedStrings@ and use
-- @\"\@attr\"@ or use one of the predefined ones from "Clay.Attributes".

attr : Text -> Refinement
attr = Refinement . pure . Attr

-- | Filter elements based on the presence of a certain attribute with the
-- specified value.

(@=) : Text -> Text -> Refinement
(@=) a = Refinement . pure . AttrVal a

-- | Filter elements based on the presence of a certain attribute that begins
-- with the selected value.

(^=) : Text -> Text -> Refinement
(^=) a = Refinement . pure . AttrBegins a

-- | Filter elements based on the presence of a certain attribute that ends
-- with the specified value.

($=) : Text -> Text -> Refinement
($=) a = Refinement . pure . AttrEnds a

-- | Filter elements based on the presence of a certain attribute that contains
-- the specified value as a substring.

(*=) : Text -> Text -> Refinement
(*=) a = Refinement . pure . AttrContains a

-- | Filter elements based on the presence of a certain attribute that have the
-- specified value contained in a space separated list.

(~=) : Text -> Text -> Refinement
(~=) a = Refinement . pure . AttrSpace a

-- | Filter elements based on the presence of a certain attribute that have the
-- specified value contained in a hyphen separated list.

(|=) : Text -> Text -> Refinement
(|=) a = Refinement . pure . AttrHyph a
