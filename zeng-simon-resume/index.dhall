let cv = ./cv.dhall

let dhallResume = ./dhallResume.dhall

let Prelude = dhallResume.Prelude

let helpers = dhallResume.helpers

let markdown = dhallResume.markdown

let baseURL = "https://simonzeng.com/resume"

let resumeName = "Zeng_Simon_Resume"

let source =
      env:GITHUB_REF as Text ? "commit ${env:GITHUB_SHA as Text}" ? "source"

let aboutBlurb =
      ''
      This resume, in all the formats it is available in, was generated
      automatically from a single configuration file. To see more about my
      process, take a look at the repo [here](https://github.com/s-zeng/resume).

      This version of the resume is built from ${source}.
      ''

let projects
    : List helpers.Project.Type
    = [ cv.projects.dhall-python
      , cv.projects.board-to-latex
      , cv.projects.rag-shenanigann
      ]

let contribs
    : List helpers.Contrib.Type
    = [ cv.contribs.nvim-tree
      , cv.contribs.dhall-lang
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
    # Resume formats

    My resume is available to download in the following formats:

    - [PDF](${baseURL}/${resumeName}.pdf)
    - [PNG](${baseURL}/${resumeName}.png)
    - [Word Document (DOCX)](${baseURL}/${resumeName}.docx)
    - [Markdown](${baseURL}/index.md)

    Or consumable in the following machine-readable formats:

    - [Json](${baseURL}/${resumeName}.json)
    - [Yaml](${baseURL}/${resumeName}.yaml)
    - [Dhall](${baseURL}/${resumeName}.dhall)
    - [ATS-readable pdf](${baseURL}/${resumeName}.minimal.pdf)

    Alternatively, keep on reading for my full resume in web and picture form.

    # About this resume

    ${aboutBlurb}

    # Contact Info

    - Email: [${cv.info.email}](mailto:${cv.info.email})
    - Phone: ${cv.info.phone}
    - Github: [${cv.socials.github.userName}](${cv.socials.github.baseUrl}/${cv.socials.github.userName})
    - LinkedIn: [${cv.socials.linkedin.userName}](${cv.socials.linkedin.baseUrl}/${cv.socials.linkedin.userName})
    - Website: [${cv.info.site}](https://${cv.info.site})

    # About me

    ${markdown.toBulletPoints 0 cv.summary}

    # Work Experience

    ${Prelude.Text.concatMapSep "\n\n" helpers.Job.Type markdown.makeJob cv.chronological_jobs}

    # Projects

    ${Prelude.Text.concatMapSep
        "\n"
        helpers.Project.Type
        markdown.makeProject
        projects}

    # Open Source Contributions

    ${Prelude.Text.concatMap helpers.Contrib.Type markdown.makeContrib contribs}

    # Misc Experience

    ${Prelude.Text.concatMapSep
        "\n"
        helpers.IconHighlight.Type
        markdown.makeHighlight
        miscExperience}

    # Education

    ${Prelude.Text.concatMapSep
        "\n"
        helpers.Education.Type
        markdown.makeEducation
        cv.education}

    # Coursework

    ${markdown.toBulletPoints 0 cv.coursework}
    
    # One page resume
    
    ![Rendered PNG of PDF resume](${baseURL}/${resumeName}.png)

    ''
