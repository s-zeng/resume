let helpers = ./cvHelpers.dhall

let month = helpers.Month

let Job = helpers.JobDescription

let EndDate = helpers.EndDate

let sweIntern = helpers.sweIntern

let socials = helpers.socialHelpers

let PersonalInfo = helpers.PersonalInfo

let info =
      PersonalInfo::{
      , name = "Simon Zeng"
      , title = "Software Engineer"
      , email = "contact@simonzeng.com"
      , phone = "1 (613) 983-9079"
      , site = "simonzeng.com"
      , socials = toMap
          { github = socials.github::{ userName = "s-zeng" }
          , linkedin = socials.linkedin::{ userName = "s-zeng1" }
          }
      }

let workExperience =
      { `TQ Tezos` = Job::{
        , title = sweIntern "Blockchain"
        , location = "New York, New York"
        , dates =
          { start = { year = 2020, month = month.September }
          , end = EndDate.Date { year = 2020, month = month.December }
          }
        , skills = [ "Blockchain", "Haskell" ]
        , bulletPoints =
          [ "Authored Tezos smart contracts in a Haskell EDSL to automate proprietary applications for permissioned blockchains"
          , "Converted large and fragmented Python-based Tezos Kubernetes deployment to idiomatic Dhall, greatly improving readability and maintainability"
          , "Constructed peer-to-peer staking topology monitoring and visualization infrastructure with Python"
          ]
        }
      , Tesla = Job::{
        , title = sweIntern "Firmware Tooling"
        , location = "Palo Alto, California"
        , dates =
          { start = { year = 2020, month = month.January }
          , end = EndDate.Date { year = 2020, month = month.October }
          }
        , skills = [ "Haskell", "Python", "Java" ]
        , bulletPoints =
          [ "Developed and maintained large Haskell code base responsible for automated firmware documentation, code, and signal generation"
          , "Improved Haskell products' performance and runtimes by over 20% by identifying laziness-related space leaks and rewriting hot code paths"
          , "Responsible for design and implementation of firmware verification infrastructure employed by entire organization"
          , "Designed and developed robust firmware signal inspection architecture with Java and modern statically typed Python"
          ]
        }
      , `University of Waterloo` = Job::{
        , title = "Teaching Assistant (Algebra)"
        , location = "Waterloo, Ontario"
        , dates =
          { start = { year = 2019, month = month.September }
          , end = EndDate.Date { year = 2019, month = month.December }
          }
        , skills = [ "Pure Math", "Teaching" ]
        , bulletPoints =
          [ "Tutored classes of over 1000 students in number theory and abstract algebra"
          , "Prepared individual tutoring lesson plans to ameliorate understanding in advanced topics such as quadratic reciprocity or interactive theorem proving"
          ]
        }
      , Ericsson = Job::{
        , title = sweIntern "Performance"
        , location = "Kanata, Ontario"
        , dates =
          { start = { year = 2019, month = month.May }
          , end = EndDate.Date { year = 2019, month = month.August }
          }
        , skills = [ "Clojure", "Python" ]
        , bulletPoints =
          [ "Developed pure functional Clojure metrics infrastructure to monitor complex JVM architectures, allowing for discovery of multiple performance issues"
          , "Implemented a parser and interpreter for an internally designed performance-testing DSL"
          ]
        }
      , CENX = Job::{
        , title = sweIntern "Test Automation"
        , location = "Ottawa, Ontario"
        , dates =
          { start = { year = 2017, month = month.July }
          , end = EndDate.Date { year = 2017, month = month.September }
          }
        , skills = [ "Python", "Systems" ]
        , bulletPoints =
          [ "Developed robust automated Python framework for load-testing web apps"
          , "Created custom implementation of IETF RFC socket protocols to debug non-standard network stacks"
          , "Discovered and provided patches for multiple security issues, including cryptography weaknesses, via automated fuzzing"
          ]
        }
      , `inBay Technologies` = Job::{
        , title = sweIntern "Full Stack"
        , location = "Kanata, Ontario"
        , dates =
          { start = { year = 2016, month = month.July }
          , end = EndDate.Date { year = 2016, month = month.August }
          }
        , skills = [ "Ruby", "Rails", "Javascript" ]
        , bulletPoints =
          [ "Created internal use development tools backed by Ruby on Rails and Javascript to monitor and debug specialized production systems"
          ]
        }
      }

in  { info, workExperience }
