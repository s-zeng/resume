-- Helpers to write a markdown resume
let helpers = ./helpers.dhall

let Prelude = helpers.Prelude

let toBulletPoint =
      λ(indent : Natural) →
      λ(b : Text) →
        "${Prelude.Text.replicate indent " "}- ${b}"

let toBulletPoints =
      λ(indent : Natural) →
        Prelude.Text.concatMapSep "\n" Text (toBulletPoint indent)

let makeJob =
      λ(job : helpers.Job.Type) →
        let description =
              if    Prelude.List.null Text job.bulletPoints
              then  ""
              else  ''
                    - Description:
                    ${toBulletPoints 2 job.bulletPoints}
                    ''

        in  ''
            ### ${job.company} -- ${job.title}

            - Date: ${helpers.makeDates job.dates}
            - Location: ${job.location}
            - Skills: ${Prelude.Text.concatSep ", " job.skills}
            ${description}
            ''

let makeProject =
      λ(project : helpers.Project.Type) →
        "- [${project.title}](https://github.com/${project.author}/${project.title}/): ${project.blurb}"

let makeContrib =
      λ(contrib : helpers.Contrib.Type) →
        let makeCommit =
              λ(commit : helpers.Commit.Type) →
                "`${commit.shortHash}` ${commit.blurb}"

        in  ''
            - [${contrib.project.author}/${contrib.project.title}](https://github.com/${contrib.project.author}/${contrib.project.title}/)
            ${toBulletPoints
                2
                ( Prelude.List.map
                    helpers.Commit.Type
                    Text
                    makeCommit
                    contrib.commits
                )}
            ''

let makeHighlight =
      λ(highlight : helpers.IconHighlight.Type) →
        "- ${highlight.title}: ${highlight.blurb}"

let makeEducation =
      λ(education : helpers.Education.Type) →
        "- ${education.school} (${helpers.makeDate
                                    education.gradDate}): ${education.degree}, ${education.major}"

in  { toBulletPoint
    , toBulletPoints
    , makeJob
    , makeProject
    , makeContrib
    , makeHighlight
    , makeEducation
    }
