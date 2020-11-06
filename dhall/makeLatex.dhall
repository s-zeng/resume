let helpers = ./cvHelpers.dhall

let Prelude = helpers.Prelude

let Options =
      { Type =
          { fontSize : Natural
          , paperType : Text
          , margins :
              { left : Double
              , right : Double
              , top : Double
              , bottom : Double
              , marginParWidth : Double
              , marginParSep : Double
              , unit : Text
              }
          }
      , default = {}
      }

let formatJob =
      λ(job : helpers.Job.Type) →
        let makeDate =
              λ(date : helpers.Date.Type) →
                "${helpers.monthToShortText date.month} ${Natural/show
                                                            date.year}"

        let makeDates =
              λ ( jobDates
                : { start : helpers.Date.Type, end : helpers.EndDate }
                ) →
                let endDate =
                      merge
                        { Date = makeDate, Current = "Present" }
                        jobDates.end

                in  "${makeDate jobDates.start} -- ${endDate}"

        let makeSkills =
              λ(skills : List Text) →
                let wrapped =
                      Prelude.Text.concatMap
                        Text
                        (λ(s : Text) → "\\cvtag{${s}}")
                        skills

                in  "\\textrm{\\textcolor{body}{\\normalfont \\hspace{-0.6em} ${wrapped}}}"

        let description = job.description

        let makeItems =
              Prelude.Text.concatMapSep "\n" Text (λ(d : Text) → "\\item ${d}")

        in  ''
            \job{${job.company}}
                {${description.title}}
                {${makeSkills description.skills}}
                {${makeDates description.dates}}
                {${description.location}}
            \begin{tightitemize}
                ${makeItems description.bulletPoints}
            \end{tightitemize}
            ''

let makeHeader =
      λ(options : Options.Type) →
        ''
        % Credits to AltaCV template
        \PassOptionsToPackage{dvipsnames}{xcolor}
        \documentclass[${Natural/show
                           options.fontSize}pt,${options.paperType}]{altacv}
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
                "\\${socialEntry.mapKey}{\\href{${socialEntry.mapValue.baseUrl}/${socialEntry.mapValue.userName}}}"

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
              \homepage{\href{${info.site}}{${info.site}}}
              ${makeSocials info.socials}
            }

            \begin{fullwidth}
            \makecvheader
            \end{fullwidth}
            ''

let makeExperience =
      λ(experience : Prelude.Map.Type Text helpers.JobDescription.Type) →
        let jobs =
              Prelude.List.map
                (Prelude.Map.Entry Text helpers.JobDescription.Type)
                helpers.Job.Type
                helpers.jobEntryToJob
                experience

        let makeJobs =
              Prelude.Text.concatMapSep
                ''

                \smallskip\divider
                ''
                helpers.Job.Type
                formatJob

        in  ''
            %% Depending on your tastes, you may want to make fonts of itemize environments slightly smaller
            % \AtBeginEnvironment{itemize}{\small}

            \cvsection[sidebar]{Experience}

            ${makeJobs jobs}
                  ''

let makeResume =
      λ(options : Options.Type) →
      λ(info : helpers.PersonalInfo.Type) →
      λ(experience : Prelude.Map.Type Text helpers.JobDescription.Type) →
        ''
        ${makeHeader options}
        \\begin{document}
        ${makePersonalInfo info}
        ${makeExperience experience}
        \\end{document}
        ''

in  { Options, makeResume }
