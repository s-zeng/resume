let cv = ../cv.dhall

let makeResume = ../dhallResume.dhall

let Prelude = makeResume.Prelude

let latex = makeResume.latex

let experience = cv.workExperience

let Job = makeResume.helpers.Job

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
    : List Job.Type
    = let dropPoints =
            λ(n : Natural) →
            λ(job : Job.Type) →
              job ⫽ { bulletPoints = Prelude.List.drop n Text job.bulletPoints }

      in  [ experience.`Jane Street`
          , experience.Tesla2
          , dropPoints 1 experience.`TQ Tezos`
          ,   experience.Tesla
            ⫽ { bulletPoints =
                [ "Developed and maintained large Haskell code base responsible for automated firmware documentation, code, and signal generation"
                , "Improved Haskell products' performance and runtimes by over 20\\% by identifying laziness-related space leaks and rewriting hot code paths"
                ]
              }
          , experience.Ericsson
          , dropPoints 1 experience.CENX
          ]

let sep =
      ''

      \medskip
      \divider
      \smallskip

      ''

let resume
    : Text
    = latex.makeResume cv.info options jobs sep

in  resume
