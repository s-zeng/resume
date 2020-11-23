-- This file makes plain text copiable bullet points for each job
-- Useful for copying into job applications q_q
let cv = ./cv.dhall

let dhallResume = ./dhallResume.dhall

let Prelude = dhallResume.Prelude

let helpers = dhallResume.helpers

let markdown = dhallResume.markdown

let jobs
    : List helpers.Job.Type
    = [ cv.workExperience.`TQ Tezos`
      , cv.workExperience.Tesla
      , cv.workExperience.`University of Waterloo`
      , cv.workExperience.Ericsson
      , cv.workExperience.CENX
      , cv.workExperience.`inBay Technologies`
      ]

let makeJob =
      λ(job : helpers.Job.Type) →
        ''
        ## ${job.company}

        ${markdown.toBulletPoints 0 job.bulletPoints}
        ''

in  ''
    # Work Experience

    ${Prelude.Text.concatMapSep "\n\n" helpers.Job.Type makeJob jobs}
    ''
