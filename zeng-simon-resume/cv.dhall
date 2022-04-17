let makeResume = ./dhallResume.dhall

let resume = makeResume.helpers

let socials =
      { github = resume.socialHelpers.github::{ userName = "s-zeng" }
      , linkedin = resume.socialHelpers.linkedin::{ userName = "s-zeng1" }
      }

let info =
      resume.PersonalInfo::{
      , name = "Simon Zeng"
      , title = "Software Engineer"
      , email = "contact@simonzeng.com"
      , phone = "1 (613) 983-9079"
      , site = "simonzeng.com"
      , socials = toMap socials
      }

let workExperience =
      { `TQ Tezos` = resume.Job::{
        , company = "TQ Tezos"
        , title = resume.sweIntern "Blockchain"
        , location = "New York, New York"
        , dates =
          { start = { year = 2020, month = resume.Month.September }
          , end =
              resume.EndDate.Date { year = 2020, month = resume.Month.December }
          }
        , skills = [ "Blockchain", "Haskell" ]
        , bulletPoints =
          [ "Converted fragmented Python-based Tezos Kubernetes deployment script to idiomatic Dhall, greatly improving readability and maintainability"
          , "Authored Tezos smart contracts in a Haskell EDSL to automate proprietary applications for permissioned blockchains"
          , "Constructed peer-to-peer staking topology monitoring and visualization infrastructure with Python"
          ]
        }
      , `Jane Street` = resume.Job::{
        , company = "Jane Street"
        , title = "Software Engineering Intern"
        , location = "New York, New York"
        , dates =
          { start = { year = 2022, month = resume.Month.January }
          , end =
              resume.EndDate.Date { year = 2022, month = resume.Month.April }
          }
        , skills = [ "OCaml", "Code Generation" ]
        , bulletPoints =
          [ "Designed and developed an original implementation of the XML XSD specification, including code generation of OCaml types and applicative-parser- combinator-based (de)serializers"
          , "Created a from-scratch API-compatible implementation of Confluent's Schema Registry in OCaml"
          , "Contributed better high level code output to Jane Street's soon-to-be open-sourced Chromium API bindings generator"
          ]
        }
      , Tesla2 = resume.Job::{
        , company = "Tesla"
        , title = resume.sweIntern "Firmware Tooling"
        , location = "Remote"
        , dates =
          { start = { year = 2021, month = resume.Month.May }
          , end =
              resume.EndDate.Date { year = 2021, month = resume.Month.August }
          }
        , skills = [ "Haskell", "Firmware", "C" ]
        , bulletPoints =
          [ "Continued development work on Haskell firmware tooling code base"
          , "Implemented network scheduler for custom Cybertruck communications protocols in Haskell using novel functional techniques"
          , "Designed and implemented C API code generation tools for embedded real-time vehicle transmissions in the Cybertruck"
          ]
        }
      , Tesla = resume.Job::{
        , company = "Tesla"
        , title = resume.sweIntern "Firmware Tooling"
        , location = "Palo Alto, California"
        , dates =
          { start = { year = 2020, month = resume.Month.January }
          , end =
              resume.EndDate.Date { year = 2020, month = resume.Month.August }
          }
        , skills = [ "Haskell", "Python", "Java" ]
        , bulletPoints =
          [ "Developed and maintained large Haskell code base responsible for automated firmware documentation, code, and signal generation"
          , "Improved Haskell products' performance and runtimes by over 20% by identifying laziness-related space leaks and rewriting hot code paths"
          , "Responsible for design and implementation of firmware verification infrastructure employed by entire organization"
          ]
        }
      , `University of Waterloo` = resume.Job::{
        , company = "University of Waterloo"
        , title = "Teaching Assistant (Algebra)"
        , location = "Waterloo, Ontario"
        , dates =
          { start = { year = 2019, month = resume.Month.September }
          , end =
              resume.EndDate.Date { year = 2019, month = resume.Month.December }
          }
        , skills = [ "Pure Math", "Teaching" ]
        , bulletPoints =
          [ "Tutored classes of over 1000 students in number theory and abstract algebra"
          , "Prepared individual tutoring lesson plans to ameliorate understanding in advanced topics such as quadratic reciprocity or interactive theorem proving"
          ]
        }
      , Ericsson = resume.Job::{
        , title = resume.sweIntern "Performance"
        , location = "Kanata, Ontario"
        , company = "Ericsson"
        , dates =
          { start = { year = 2019, month = resume.Month.May }
          , end =
              resume.EndDate.Date { year = 2019, month = resume.Month.August }
          }
        , skills = [ "Clojure", "Python" ]
        , bulletPoints =
          [ "Developed pure functional Clojure metrics infrastructure to monitor complex JVM architectures, allowing for discovery of multiple performance issues"
          , "Implemented a parser and interpreter for an internally designed performance-testing DSL"
          ]
        }
      , CENX = resume.Job::{
        , company = "CENX"
        , title = resume.sweIntern "Test Automation"
        , location = "Ottawa, Ontario"
        , dates =
          { start = { year = 2017, month = resume.Month.July }
          , end =
              resume.EndDate.Date
                { year = 2017, month = resume.Month.September }
          }
        , skills = [ "Python", "Systems" ]
        , bulletPoints =
          [ "Developed robust automated Python framework for load-testing web apps"
          , "Created custom implementation of IETF RFC socket protocols to debug non-standard network stacks"
          ]
        }
      , `inBay Technologies` = resume.Job::{
        , company = "inBay Technologies"
        , title = resume.sweIntern "Full Stack"
        , location = "Kanata, Ontario"
        , dates =
          { start = { year = 2016, month = resume.Month.July }
          , end =
              resume.EndDate.Date { year = 2016, month = resume.Month.August }
          }
        , skills = [ "Ruby", "Rails", "Javascript" ]
        , bulletPoints =
          [ "Created internal use development tools backed by Ruby on Rails and Javascript to monitor and debug specialized production systems"
          ]
        }
      }

let chronological_jobs
    : List resume.Job.Type
    = [ workExperience.`Jane Street`
      , workExperience.Tesla2
      , workExperience.`TQ Tezos`
      , workExperience.Tesla
      , workExperience.`University of Waterloo`
      , workExperience.Ericsson
      , workExperience.CENX
      , workExperience.`inBay Technologies`
      ]

let summary
    : List Text
    = [ "Professional experience in functional programming (Haskell, OCaml, Clojure)"
      , "Competent core development skills (Python, Java, Ruby, Javascript)"
      , "Avid user and contributor of free, libre, and open source software"
      , "Strong background in mathematics"
      ]

let projects =
      { board-to-latex = resume.Project::{
        , author = "s-zeng"
        , title = "board-to-latex"
        , skills = [ "Flask", "OCR", "Latex" ]
        , blurb = "Turn pictures of math into latex"
        }
      , rag-shenanigann = resume.Project::{
        , author = "s-zeng"
        , title = "rag-shenanigann"
        , skills = [ "Python", "Torch", "MIDI" ]
        , blurb = "Generate ragtime music with AI"
        }
      , dhall-python = resume.Project::{
        , author = "s-zeng"
        , title = "dhall-python"
        , skills = [ "Rust", "Python", "Dhall" ]
        , blurb =
            "Python bindings for Dhall, a functional configuration language"
        }
      }

let contribs =
      { dhall-kubernetes = resume.Contrib::{
        , project = resume.Project::{
          , author = "dhall-lang"
          , title = "dhall-kubernetes"
          , skills = [ "Kubernetes", "Dhall" ]
          , blurb = "Dhall bindings to kubernetes"
          }
        , commits =
          [ resume.Commit::{
            , longHash = "3367b683fa6ba3658719d6c1ac0cc043fd82f650"
            , shortHash = "3367b68"
            , blurb = "Remove declaration of deprecated python script"
            }
          ]
        }
      , `telescope.nvim` = resume.Contrib::{
        , project = resume.Project::{
          , author = "nvim-lua"
          , title = "telescope.nvim"
          , skills = [ "Lua", "Vim Script" ]
          , blurb = "Neovim fuzzy finder in pure lua"
          }
        , commits =
          [ resume.Commit::{
            , longHash = "59ef37ded43a77a4c0f35be434f1ea72a407ce84"
            , shortHash = "59ef37d"
            , blurb = "Implement shortcut to dynamically use other telescopes"
            }
          ]
        }
      , parinfer-rust = resume.Contrib::{
        , project = resume.Project::{
          , author = "eraserhd"
          , title = "parinfer-rust"
          , skills = [ "Rust", "Vim" ]
          , blurb = "Infer Lisp parenthesis placement from indentation"
          }
        , commits =
          [ resume.Commit::{
            , longHash = "835541eb3de66d06db2ffd2694375090e1221902"
            , shortHash = "835541e"
            , blurb = "Add support for Dune"
            }
          ]
        }
      , `repl.vim` = resume.Contrib::{
        , project = resume.Project::{
          , author = "ujihisa"
          , title = "repl.vim"
          , skills = [ "Vim Script", "Racket" ]
          , blurb = "Run REPLs right inside vim"
          }
        , commits =
          [ resume.Commit::{
            , longHash = "4910aa7d7b0c7abda92dcfdb4cde030fb839091d"
            , shortHash = "4910aa7"
            , blurb = "Add support for Racket"
            }
          ]
        }
      , dhall-lang = resume.Contrib::{
        , project = resume.Project::{
          , author = "dhall-lang"
          , title = "dhall-lang"
          , skills = [ "Dhall", "Haskell" ]
          , blurb = "Maintainable configuration files"
          }
        , commits =
          [ resume.Commit::{
            , longHash = "b22cce186791bc3f4bd6b6808033adf86f30af6d"
            , shortHash = "b22cce1"
            , blurb = "Add support for Dhall v19"
            }
          ]
        }
      , nvim-tree = resume.Contrib::{
        , project = resume.Project::{
          , author = "kyazdani42"
          , title = "nvim-tree.lua"
          , skills = [ "Lua", "Vim Script" ]
          , blurb = "A fast file explorer tree for neovim"
          }
        , commits =
          [ resume.Commit::{
            , longHash = "9aa8be639d4daad4f80552bc48a412efae7fbe4e"
            , shortHash = "9aa8be6"
            , blurb = "Fix crash from glibc bug"
            }
          ]
        }
      }

let miscExperience =
      { swim = resume.IconHighlight::{
        , icon = "\\faLifeSaver"
        , title = "Swim Instructor"
        , blurb = "Certified by Red Cross and Life Saving Society"
        }
      , accordion = resume.IconHighlight::{
        , icon = "\\faMusic"
        , title = "Accordion Teacher"
        , blurb = "Offering private lessons"
        }
      , counsellor = resume.IconHighlight::{
        , icon = "\\faBinoculars"
        , title = "Camp Counsellor"
        , blurb = "For youth robotics camps"
        }
      , ta = resume.IconHighlight::{
        , icon = "\\faGraduationCap"
        , title = "Teaching Assistant"
        , blurb = "Number theory and algebra"
        }
      , fullstack = resume.IconHighlight::{
        , icon = "\\faCode"
        , title = "Full Stack SWE Intern"
        , blurb = "inBay Technologies (2016)"
        }
      }

let coursework
    : List Text
    = [ "Functional Programming (Haskell, Scala, Scheme)"
      , "OOP Programming (C++)"
      , "Formal Logic and Interactive Theorem Proving (Coq)"
      , "Compilers and Interpreters"
      ]

let education
    : List resume.Education.Type
    = [ resume.Education::{
        , school = "University of Waterloo"
        , degree = "Bachelor's degree"
        , major = "Computer Science"
        , gradDate = resume.ResumeDate::{
          , month = resume.Month.May
          , year = 2023
          }
        }
      ]

in  { info
    , workExperience
    , summary
    , projects
    , contribs
    , miscExperience
    , coursework
    , education
    , socials
    , chronological_jobs
    }
