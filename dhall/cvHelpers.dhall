let Prelude =
      https://prelude.dhall-lang.org/package.dhall sha256:eb693342eb769f782174157eba9b5924cf8ac6793897fc36a31ccbd6f56dafe2

let Month =
      < January
      | February
      | March
      | April
      | May
      | June
      | July
      | August
      | September
      | October
      | November
      | December
      >

let monthToShortText =
      λ(m : Month) →
        merge
          { January = "Jan"
          , February = "Feb"
          , March = "Mar"
          , April = "Apr"
          , May = "May"
          , June = "Jun"
          , July = "Jul"
          , August = "Aug"
          , September = "Sep"
          , October = "Oct"
          , November = "Nov"
          , December = "Dec"
          }
          m

let Date = { Type = { year : Natural, month : Month }, default = {} }

let EndDate = < Date : Date.Type | Current >

let SocialLink = { Type = { userName : Text, baseUrl : Text }, default = {} }

let socialHelpers =
      { github =
        { Type = SocialLink.Type, default.baseUrl = "https://github.com" }
      , linkedin =
        { Type = SocialLink.Type, default.baseUrl = "https://linkedin.com/in" }
      }

let makeSocialURL =
      λ(social : SocialLink.Type) → "${social.baseUrl}/${social.userName}"

let PersonalInfo =
      { Type =
          { name : Text
          , title : Text
          , email : Text
          , phone : Text
          , site : Text
          , socials : List { mapKey : Text, mapValue : SocialLink.Type }
          }
      , default = {=}
      }

let JobDescription =
      { Type =
          { title : Text
          , location : Text
          , dates : { start : Date.Type, end : EndDate }
          , skills : List Text
          , bulletPoints : List Text
          }
      , default = { skills = [] : List Text, bulletPoints = [] : List Text }
      }

let Job =
      { Type = { company : Text, description : JobDescription.Type }
      , default = {}
      }

let jobEntryToJob =
      λ(jobEntry : { mapKey : Text, mapValue : JobDescription.Type }) →
        { company = jobEntry.mapKey, description = jobEntry.mapValue }

let sweIntern = λ(type : Text) → "Software Engineering Intern (${type})"

in  { Job
    , JobDescription
    , Date
    , EndDate
    , jobEntryToJob
    , sweIntern
    , PersonalInfo
    , SocialLink
    , socialHelpers
    , makeSocialURL
    , Prelude
    , monthToShortText
    , Month
    }
