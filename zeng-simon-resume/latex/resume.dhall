let cv = ../cv.dhall

let makeResume = ../dhallResume.dhall

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
      ,     experience.Tesla
        //  { bulletPoints =
              [ "Developed and maintained large Haskell code base responsible for automated firmware documentation, code, and signal generation"
              , "Improved Haskell products' performance and runtimes by over 20\\% by identifying laziness-related space leaks and rewriting hot code paths"
              , "Responsible for design and implementation of firmware verification infrastructure employed by entire organization"
              , "Designed and developed robust firmware signal inspection architecture with Java and modern statically typed Python"
              ]
            }
      , experience.`University of Waterloo`
      , experience.Ericsson
      , experience.CENX
      , experience.`inBay Technologies`
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
