let Prelude =
      https://prelude.dhall-lang.org/v19.0.0/package.dhall sha256:eb693342eb769f782174157eba9b5924cf8ac6793897fc36a31ccbd6f56dafe2

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

-- TODO: use the new dhall builtin date type, and implement pretty printing for that
let ResumeDate = { Type = { year : Natural, month : Month }, default = {=} }

let EndDate = < Date : ResumeDate.Type | Current >

let makeDate =
      λ(date : ResumeDate.Type) →
        "${monthToShortText date.month} ${Natural/show date.year}"

let makeDates =
      λ(jobDates : { start : ResumeDate.Type, end : EndDate }) →
        let endDate =
              merge { Date = makeDate, Current = "Present" } jobDates.end

        in  "${makeDate jobDates.start} -- ${endDate}"

let SocialLink = { Type = { userName : Text, baseUrl : Text }, default = {=} }

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

let Job =
      { Type =
          { title : Text
          , location : Text
          , company : Text
          , dates : { start : ResumeDate.Type, end : EndDate }
          , skills : List Text
          , bulletPoints : List Text
          }
      , default = { skills = [] : List Text, bulletPoints = [] : List Text }
      }

let sweIntern = λ(type : Text) → "Software Engineering Intern (${type})"

let IconHighlight =
      { Type = { icon : Text, title : Text, blurb : Text }, default = {=} }

let Project =
      { Type = { author : Text, title : Text, skills : List Text, blurb : Text }
      , default = {=}
      }

let Commit =
      { Type = { longHash : Text, shortHash : Text, blurb : Text }
      , default = {=}
      }

let Contrib =
      { Type = { project : Project.Type, commits : List Commit.Type }
      , default.commits = [] : List Commit.Type
      }

let Education =
      { Type =
          { school : Text, degree : Text, major : Text, gradDate : ResumeDate.Type }
      , default.gradDate = ResumeDate.default
      }

in  { Commit
    , Contrib
    , ResumeDate
    , Education
    , EndDate
    , IconHighlight
    , Job
    , Month
    , PersonalInfo
    , Prelude
    , Project
    , SocialLink
    , makeDate
    , makeDates
    , makeSocialURL
    , monthToShortText
    , socialHelpers
    , sweIntern
    }
