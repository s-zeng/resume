-- Helpers to write a latex resume
-- Intended to be used with the AltaCV template
let helpers = ./helpers.dhall

let documentClass = ./altacv.cls as Text

let Prelude = helpers.Prelude

let Margins =
      { Type =
          { left : Double
          , right : Double
          , top : Double
          , bottom : Double
          , marginParWidth : Double
          , marginParSep : Double
          , unit : Text
          }
      , default = {=}
      }

let Options =
      { Type =
          { fontSize : Natural
          , paperType : Text
          , documentClassName : Text
          , margins : Margins.Type
          }
      , default.margins = Margins.default
      }

let skips =
      { small =
          ''

          \smallskip

          ''
      , med =
          ''

          \medskip

          ''
      , big =
          ''

          \bigskip

          ''
      , divider =
          ''

          \divider

          ''
      , smallDivider =
          ''

          \smalldivider

          ''
      }

let makeItems =
      Prelude.Text.concatMapSep "\n" Text (λ(d : Text) → "\\item ${d}")

let makeSkills =
      λ(skills : List Text) →
        let wrapped =
              Prelude.Text.concatMapSep
                "\n"
                Text
                (λ(s : Text) → "\\cvtag{${s}}")
                skills

        in  "\\textrm{\\textcolor{body}{\\normalfont \\hspace{-0.6em} ${wrapped}}}"

let formatJob =
      λ(job : helpers.Job.Type) →
        let jobBody =
              if    Prelude.List.null Text job.bulletPoints
              then  "\\vspace{-\\topsep}"
              else  ''
                    \begin{tightitemize}
                        ${makeItems job.bulletPoints}
                    \end{tightitemize}
                    ''

        in  ''
            \job{${job.company}}
                {${job.title}}
                {${makeSkills job.skills}}
                {${helpers.makeDates job.dates}}
                {${job.location}}

            ${jobBody}
            ''

let makeHeader =
      λ(options : Options.Type) →
        ''
        % Credits to AltaCV template
        \PassOptionsToPackage{dvipsnames}{xcolor}
        \documentclass[${Natural/show
                           options.fontSize}pt,${options.paperType}]{${options.documentClassName}}
        \geometry{
          left=${Double/show options.margins.left}${options.margins.unit},
          right=${Double/show options.margins.right}${options.margins.unit},
          marginparwidth=${Double/show
                             options.margins.marginParWidth}${options.margins.unit},
          marginparsep=${Double/show
                           options.margins.marginParSep}${options.margins.unit},
          top=${Double/show options.margins.top}${options.margins.unit},
          bottom=${Double/show options.margins.bottom}${options.margins.unit}
        }

        \usepackage[utf8]{inputenc}
        \usepackage{amssymb}
        \usepackage[T1]{fontenc}
        \usepackage{hyperref}
        \usepackage{fancybox}
        \setmainfont{Lato}

        \definecolor{Mulberry}{HTML}{92243D}
        \definecolor{Cool}{HTML}{E2243D}
        \definecolor{SlateGrey}{HTML}{2E2E2E}
        \definecolor{LightGrey}{HTML}{666666}
        \colorlet{heading}{Cool}
        \colorlet{accent}{Mulberry}
        \colorlet{emphasis}{SlateGrey}
        \colorlet{body}{LightGrey}
          ''

let makePersonalInfo =
      λ(info : helpers.PersonalInfo.Type) →
        let makeSocial =
              λ(socialEntry : Prelude.Map.Entry Text helpers.SocialLink.Type) →
                let value = socialEntry.mapValue

                in  "\\${socialEntry.mapKey}{\\href{${helpers.makeSocialURL
                                                        value}}{${value.userName}}}"

        let makeSocials =
              Prelude.Text.concatMapSep
                "\n"
                (Prelude.Map.Entry Text helpers.SocialLink.Type)
                makeSocial

        in  ''
            \hypersetup{
                pdfauthor={${info.name}},
                pdftitle={${info.name} - Resume},
                colorlinks = false,
                allbordercolors=white
            }

            \begin{document}
            \name{${info.name}}
            \tagline{${info.title}}
            \personalinfo{%
              \email{\href{mailto:${info.email}}{${info.email}}}
              \phone{${info.phone}}
              \homepage{\href{https://${info.site}}{${info.site}}}
              ${makeSocials info.socials}
            }

            \begin{fullwidth}
            \makecvheader
            \end{fullwidth}
            ''

let makeExperience =
      λ(experience : List helpers.Job.Type) →
      λ(sep : Text) →
        let makeJobs = Prelude.Text.concatMapSep sep helpers.Job.Type formatJob

        in  ''
            %% Depending on your tastes, you may want to make fonts of itemize environments slightly smaller
            % \AtBeginEnvironment{itemize}{\small}

            \cvsection[sidebar]{Experience}

            \smallskip

            ${makeJobs experience}
                  ''

let makeResume =
      λ(info : helpers.PersonalInfo.Type) →
      λ(options : Options.Type) →
      λ(experience : List helpers.Job.Type) →
      λ(sep : Text) →
        ''
        ${makeHeader options}
        ${makePersonalInfo info}
        ${makeExperience experience sep}
        \end{document}
        ''

let makeListSection =
      λ(name : Text) →
      λ(points : List Text) →
        ''
        \cvsection{${name}}

        \begin{tightitemize}
        ${makeItems points}
        \end{tightitemize}
        ''

let makeSummary = makeListSection "Summary"

let makeCoursework = makeListSection "Coursework"

let makeProjects =
      λ(sep : Text) →
      λ(projects : List helpers.Project.Type) →
        let makeProject =
              λ(project : helpers.Project.Type) →
                ''
                \project{${project.author}/${project.title}}{${makeSkills
                                                                 project.skills}}{}{}
                ${project.blurb}
                ''

        let projectText =
              Prelude.Text.concatMapSep
                sep
                helpers.Project.Type
                makeProject
                projects

        in  ''
            \cvsection{Projects}

            ${projectText}
            ''

let makeOSS =
      λ(sep : Text) →
      λ(contribs : List helpers.Contrib.Type) →
        let makeContrib =
              λ(contrib : helpers.Contrib.Type) →
                let makeCommit =
                      λ(commit : helpers.Commit.Type) →
                        ''
                        \href{https://github.com/${contrib.project.author}/${contrib.project.title}/commit/${commit.longHash}}{\texttt{${commit.shortHash}}}
                        ${commit.blurb}
                        ''

                let commits =
                      Prelude.Text.concatMapSep
                        "\n\n"
                        helpers.Commit.Type
                        makeCommit
                        contrib.commits

                in  ''
                    \project{${contrib.project.author}/${contrib.project.title}}{${makeSkills
                                                                                     contrib.project.skills}}{}{}
                    ${commits}
                    ''

        let textContribs =
              Prelude.Text.concatMapSep
                sep
                helpers.Contrib.Type
                makeContrib
                contribs

        in  ''
            \cvsection{Open Source}

            ${textContribs}
            ''

let makeIcons =
      λ(title : Text) →
      λ(icons : List helpers.IconHighlight.Type) →
        let makeIcon =
              λ(icon : helpers.IconHighlight.Type) →
                ''
                \cvachievement{${icon.icon}}{${icon.title}}{${icon.blurb}}
                ''

        let iconText =
              Prelude.Text.concatMapSep
                skips.smallDivider
                helpers.IconHighlight.Type
                makeIcon
                icons

        in  ''
            \cvsection{${title}}

            ${iconText}
            ''

let makeEducation =
      λ(educationList : List helpers.Education.Type) →
        let makeSingleEducation =
              λ(education : helpers.Education.Type) →
                ''
                \cvevent{${education.degree}, ${education.major}}{}{${Natural/show
                                                                        education.gradDate.year}}{${education.school}}{}
                ''

        let educations =
              Prelude.Text.concatMapSep
                skips.smallDivider
                helpers.Education.Type
                makeSingleEducation
                educationList

        in  ''
            \cvsection{Education}

            ${educations}
            ''

let makeSidebar = Prelude.Text.concat

let sidebar =
      { makeSummary
      , makeProjects
      , makeOSS
      , makeIcons
      , makeCoursework
      , makeEducation
      , makeSidebar
      }

in  { Margins, Options, makeResume, documentClass, sidebar, skips }
