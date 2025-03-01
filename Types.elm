module Types exposing (Flags, LanguageExtension(..), Model, Msg(..), Page(..), SubstitutionKind(..))

import Bootstrap.Modal as Modal
import Http
import JsonResult exposing (JsonMatchResult)
import Navigation exposing (Location)


type alias Flags =
    {}


type Page
    = SourcePage
    | NotFound


type LanguageExtension
    = Generic
    | Assembly
    | Bash
    | Cpp
    | Clojure
    | CSS
    | Dart
    | Elm
    | Erlang
    | Elixir
    | Html
    | Haskell
    | Go
    | Java
    | Javascript
    | Json
    | Latex
    | OCaml
    | Php
    | Python
    | Ruby
    | Rust
    | Scala
    | SQL
    | Swift
    | XML


type SubstitutionKind
    = InPlace
    | NewlineSeparated


type alias Model =
    { page : Page
    , matchResult : JsonResult.JsonMatchResult
    , matchTemplateInput : String
    , ruleInput : String
    , ruleSyntaxErrors : String
    , rewriteTemplateInput : String
    , sourceInput : String
    , rewriteResult : JsonResult.JsonRewriteResult
    , debug : Bool
    , url : String
    , prettyUrl : String
    , serverConnected : Bool
    , language : LanguageExtension
    , substitutionKind : SubstitutionKind
    , copyButtonLinkText : String
    , copyButtonTerminalText : String
    , copyButtonTextInPlace : String
    , currentRewriteResultId : Int
    , currentMatchResultId : Int
    , modalTerminalVisibility : Modal.Visibility
    , modalText : String
    , modalAboutVisibility : Modal.Visibility
    }


type Msg
    = OnLocationChange Location
    | MatchTemplateInputUpdated String
    | SourceInputUpdated String
    | RuleInputUpdated String
    | RewriteTemplateInputUpdated String
    | LanguageInputUpdated LanguageExtension
    | SubstitutionKindInputUpdated SubstitutionKind
    | RewriteResult (Result Http.Error JsonResult.JsonRewriteResult)
    | MatchesResult (Result Http.Error JsonResult.JsonMatchResult)
    | ShareLinkClicked
    | CopyShareLinkClicked
    | ShortenUrlResult (Result Http.Error String)
    | CloseTerminalModal
    | ShowTerminalModal
    | CloseAboutModal
    | ShowAboutModal
    | CopyTerminalCommandClicked
    | CopyTerminalCommandInPlaceClicked
