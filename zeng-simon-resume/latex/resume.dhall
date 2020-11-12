let cv = ../cv.dhall

let makeResume = cv.makeResume

let latex = makeResume.latex

let experience = cv.workExperience

let options =
      latex.Options::{
      , fontSize = 10
      , paperType = "a4paper"
      , documentClassName = "altacv"
      , margins = latex.Margins::{
        , left = 1.0
        , right = 7.1
        , top = 1.0
        , bottom = 1.0
        , marginParWidth = 5.6
        , marginParSep = 0.5
        , unit = "cm"
        }
      }

let jobs
    : List makeResume.helpers.Job.Type
    = [ experience.`TQ Tezos`
      , experience.Tesla
      , experience.`University of Waterloo`
      , experience.Ericsson
      , experience.CENX
      , experience.`inBay Technologies`
      ]

let resume
    : Text
    = latex.makeResume options cv.info jobs

in  resume
