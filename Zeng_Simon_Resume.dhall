{ contribs =
  { dhall-kubernetes =
    { commits =
      [ { blurb = "Remove declaration of deprecated python script"
        , longHash = "06ddc2d375b29ffb7fde1f47fca5c7c362347d2c"
        , shortHash = "06ddc2d"
        }
      ]
    , project =
      { author = "dhall-lang"
      , blurb = "Dhall bindings to kubernetes"
      , skills = [ "Kubernetes", "Dhall" ]
      , title = "dhall-kubernetes"
      }
    }
  , `repl.vim` =
    { commits =
      [ { blurb = "Add support for Racket"
        , longHash = "4910aa7d7b0c7abda92dcfdb4cde030fb839091d"
        , shortHash = "4910aa7"
        }
      ]
    , project =
      { author = "ujihisa"
      , blurb = "Run REPLs right inside vim"
      , skills = [ "Vim Script", "Racket" ]
      , title = "repl.vim"
      }
    }
  , `telescope.nvim` =
    { commits =
      [ { blurb = "Implement shortcut to dynamically use other telescopes"
        , longHash = "59ef37ded43a77a4c0f35be434f1ea72a407ce84"
        , shortHash = "59ef37d"
        }
      ]
    , project =
      { author = "nvim-lua"
      , blurb = "Neovim fuzzy finder in pure lua"
      , skills = [ "Lua", "Vim Script" ]
      , title = "telescope-nvim"
      }
    }
  }
, coursework =
  [ "Functional Programming (Haskell, Scala, Scheme)"
  , "OOP Programming (C++)"
  , "Formal Logic and Interactive Theorem Proving (Coq)"
  , "Compilers and Interpreters"
  ]
, education =
  [ { degree = "Bachelor's degree"
    , gradDate =
      { month =
          < April
          | August
          | December
          | February
          | January
          | July
          | June
          | March
          | May
          | November
          | October
          | September
          >.May
      , year = 2022
      }
    , major = "Computer Science"
    , school = "University of Waterloo"
    }
  ]
, info =
  { email = "contact@simonzeng.com"
  , name = "Simon Zeng"
  , phone = "1 (613) 983-9079"
  , site = "simonzeng.com"
  , socials =
    [ { mapKey = "github"
      , mapValue = { baseUrl = "https://github.com", userName = "s-zeng" }
      }
    , { mapKey = "linkedin"
      , mapValue = { baseUrl = "https://linkedin.com/in", userName = "s-zeng1" }
      }
    ]
  , title = "Software Engineer"
  }
, miscExperience =
  { accordion =
    { blurb = "Offering private lessons"
    , icon = "\\faMusic"
    , title = "Accordion Teacher"
    }
  , counsellor =
    { blurb = "For youth robotics camps"
    , icon = "\\faBinoculars"
    , title = "Camp Counsellor"
    }
  , swim =
    { blurb = "Certified by Red Cross and Life Saving Society"
    , icon = "\\faLifeSaver"
    , title = "Swim Instructor"
    }
  }
, projects =
  { board-to-latex =
    { author = "s-zeng"
    , blurb = "Turn pictures of math into latex"
    , skills = [ "Flask", "OCR", "Latex" ]
    , title = "board-to-latex"
    }
  , dhall-python =
    { author = "s-zeng"
    , blurb = "Python bindings for the Dhall configuration language"
    , skills = [ "Rust", "Python", "Dhall" ]
    , title = "dhall-python"
    }
  , rag-shenanigann =
    { author = "s-zeng"
    , blurb = "Generate ragtime music with AI"
    , skills = [ "Python", "Torch", "MIDI" ]
    , title = "rag-shenanigann"
    }
  }
, socials =
  { github = { baseUrl = "https://github.com", userName = "s-zeng" }
  , linkedin = { baseUrl = "https://linkedin.com/in", userName = "s-zeng1" }
  }
, summary =
  [ "Professional experience in functional programming (Haskell, Clojure)"
  , "Competent core development skills (Python, Java, Ruby, Javascript)"
  , "Avid user and contributor of free, libre, and open source software"
  , "Strong background in mathematics"
  ]
, workExperience =
  { CENX =
    { bulletPoints =
      [ "Developed robust automated Python framework for load-testing web apps"
      , "Created custom implementation of IETF RFC socket protocols to debug non-standard network stacks"
      , "Discovered and provided patches for multiple security issues, including cryptography weaknesses, via automated fuzzing"
      ]
    , company = "CENX"
    , dates =
      { end =
          < Current
          | Date :
              { month :
                  < April
                  | August
                  | December
                  | February
                  | January
                  | July
                  | June
                  | March
                  | May
                  | November
                  | October
                  | September
                  >
              , year : Natural
              }
          >.Date
            { month =
                < April
                | August
                | December
                | February
                | January
                | July
                | June
                | March
                | May
                | November
                | October
                | September
                >.September
            , year = 2017
            }
      , start =
        { month =
            < April
            | August
            | December
            | February
            | January
            | July
            | June
            | March
            | May
            | November
            | October
            | September
            >.July
        , year = 2017
        }
      }
    , location = "Ottawa, Ontario"
    , skills = [ "Python", "Systems" ]
    , title = "Software Engineering Intern (Test Automation)"
    }
  , Ericsson =
    { bulletPoints =
      [ "Developed pure functional Clojure metrics infrastructure to monitor complex JVM architectures, allowing for discovery of multiple performance issues"
      , "Implemented a parser and interpreter for an internally designed performance-testing DSL"
      ]
    , company = "Ericsson"
    , dates =
      { end =
          < Current
          | Date :
              { month :
                  < April
                  | August
                  | December
                  | February
                  | January
                  | July
                  | June
                  | March
                  | May
                  | November
                  | October
                  | September
                  >
              , year : Natural
              }
          >.Date
            { month =
                < April
                | August
                | December
                | February
                | January
                | July
                | June
                | March
                | May
                | November
                | October
                | September
                >.August
            , year = 2019
            }
      , start =
        { month =
            < April
            | August
            | December
            | February
            | January
            | July
            | June
            | March
            | May
            | November
            | October
            | September
            >.May
        , year = 2019
        }
      }
    , location = "Kanata, Ontario"
    , skills = [ "Clojure", "Python" ]
    , title = "Software Engineering Intern (Performance)"
    }
  , `TQ Tezos` =
    { bulletPoints =
      [ "Authored Tezos smart contracts in a Haskell EDSL to automate proprietary applications for permissioned blockchains"
      , "Converted large and fragmented Python-based Tezos Kubernetes deployment to idiomatic Dhall, greatly improving readability and maintainability"
      , "Constructed peer-to-peer staking topology monitoring and visualization infrastructure with Python"
      ]
    , company = "TQ Tezos"
    , dates =
      { end =
          < Current
          | Date :
              { month :
                  < April
                  | August
                  | December
                  | February
                  | January
                  | July
                  | June
                  | March
                  | May
                  | November
                  | October
                  | September
                  >
              , year : Natural
              }
          >.Date
            { month =
                < April
                | August
                | December
                | February
                | January
                | July
                | June
                | March
                | May
                | November
                | October
                | September
                >.December
            , year = 2020
            }
      , start =
        { month =
            < April
            | August
            | December
            | February
            | January
            | July
            | June
            | March
            | May
            | November
            | October
            | September
            >.September
        , year = 2020
        }
      }
    , location = "New York, New York"
    , skills = [ "Blockchain", "Haskell" ]
    , title = "Software Engineering Intern (Blockchain)"
    }
  , Tesla =
    { bulletPoints =
      [ "Developed and maintained large Haskell code base responsible for automated firmware documentation, code, and signal generation"
      , "Improved Haskell products' performance and runtimes by over 20% by identifying laziness-related space leaks and rewriting hot code paths"
      , "Responsible for design and implementation of firmware verification infrastructure employed by entire organization"
      , "Designed and developed robust firmware signal inspection architecture with Java and modern statically typed Python"
      ]
    , company = "Tesla"
    , dates =
      { end =
          < Current
          | Date :
              { month :
                  < April
                  | August
                  | December
                  | February
                  | January
                  | July
                  | June
                  | March
                  | May
                  | November
                  | October
                  | September
                  >
              , year : Natural
              }
          >.Date
            { month =
                < April
                | August
                | December
                | February
                | January
                | July
                | June
                | March
                | May
                | November
                | October
                | September
                >.October
            , year = 2020
            }
      , start =
        { month =
            < April
            | August
            | December
            | February
            | January
            | July
            | June
            | March
            | May
            | November
            | October
            | September
            >.January
        , year = 2020
        }
      }
    , location = "Palo Alto, California"
    , skills = [ "Haskell", "Python", "Java" ]
    , title = "Software Engineering Intern (Firmware Tooling)"
    }
  , `University of Waterloo` =
    { bulletPoints =
      [ "Tutored classes of over 1000 students in number theory and abstract algebra"
      , "Prepared individual tutoring lesson plans to ameliorate understanding in advanced topics such as quadratic reciprocity or interactive theorem proving"
      ]
    , company = "University of Waterloo"
    , dates =
      { end =
          < Current
          | Date :
              { month :
                  < April
                  | August
                  | December
                  | February
                  | January
                  | July
                  | June
                  | March
                  | May
                  | November
                  | October
                  | September
                  >
              , year : Natural
              }
          >.Date
            { month =
                < April
                | August
                | December
                | February
                | January
                | July
                | June
                | March
                | May
                | November
                | October
                | September
                >.December
            , year = 2019
            }
      , start =
        { month =
            < April
            | August
            | December
            | February
            | January
            | July
            | June
            | March
            | May
            | November
            | October
            | September
            >.September
        , year = 2019
        }
      }
    , location = "Waterloo, Ontario"
    , skills = [ "Pure Math", "Teaching" ]
    , title = "Teaching Assistant (Algebra)"
    }
  , `inBay Technologies` =
    { bulletPoints =
      [ "Created internal use development tools backed by Ruby on Rails and Javascript to monitor and debug specialized production systems"
      ]
    , company = "inBay Technologies"
    , dates =
      { end =
          < Current
          | Date :
              { month :
                  < April
                  | August
                  | December
                  | February
                  | January
                  | July
                  | June
                  | March
                  | May
                  | November
                  | October
                  | September
                  >
              , year : Natural
              }
          >.Date
            { month =
                < April
                | August
                | December
                | February
                | January
                | July
                | June
                | March
                | May
                | November
                | October
                | September
                >.August
            , year = 2016
            }
      , start =
        { month =
            < April
            | August
            | December
            | February
            | January
            | July
            | June
            | March
            | May
            | November
            | October
            | September
            >.July
        , year = 2016
        }
      }
    , location = "Kanata, Ontario"
    , skills = [ "Ruby", "Rails", "Javascript" ]
    , title = "Software Engineering Intern (Full Stack)"
    }
  }
}
