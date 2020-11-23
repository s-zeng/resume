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

let projects
    : List helpers.Project.Type
    = [ cv.projects.dhall-python
      , cv.projects.board-to-latex
      , cv.projects.rag-shenanigann
      ]

let contribs
    : List helpers.Contrib.Type
    = [ cv.contribs.dhall-lang
      , cv.contribs.dhall-kubernetes
      , cv.contribs.`telescope.nvim`
      , cv.contribs.`repl.vim`
      ]

let miscExperience
    : List helpers.IconHighlight.Type
    = [ cv.miscExperience.swim
      , cv.miscExperience.accordion
      , cv.miscExperience.counsellor
      ]

in  ''
    ---
    title: Resume
    author: ${cv.info.name}
    date: \today
    ---

    ## Contact Info

    - Email: [${cv.info.email}](mailto:${cv.info.email})
    - Phone: ${cv.info.phone}
    - Github: [${cv.socials.github.userName}](${cv.socials.github.baseUrl}/${cv.socials.github.userName})
    - LinkedIn: [${cv.socials.linkedin.userName}](${cv.socials.linkedin.baseUrl}/${cv.socials.linkedin.userName})
    - Website: [${cv.info.site}](https://${cv.info.site})

    ## Work Experience

    ${Prelude.Text.concatMapSep "\n\n" helpers.Job.Type markdown.makeJob jobs}

    ## Projects

    ${Prelude.Text.concatMapSep
        "\n"
        helpers.Project.Type
        markdown.makeProject
        projects}

    ## Open Source Contributions

    ${Prelude.Text.concatMap helpers.Contrib.Type markdown.makeContrib contribs}

    ## Misc Experience

    ${Prelude.Text.concatMapSep
        "\n"
        helpers.IconHighlight.Type
        markdown.makeHighlight
        miscExperience}

    ## Education

    ${Prelude.Text.concatMapSep
        "\n"
        helpers.Education.Type
        markdown.makeEducation
        cv.education}

    ## Coursework

    ${markdown.toBulletPoints 0 cv.coursework}

    ''
