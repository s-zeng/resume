let cv = ../cv.dhall

let makeResume = ../dhallResume.dhall

let latex = makeResume.latex

let sidebar
    : Text
    = latex.sidebar.makeSidebar
        [ latex.sidebar.makeProjects
            latex.skips.smallDivider
            [ cv.projects.dhall-python
            , cv.projects.board-to-latex
            , cv.projects.rag-shenanigann
            ]
        , latex.skips.small
        , latex.sidebar.makeOSS
            latex.skips.smallDivider
            [ cv.contribs.dhall-kubernetes
            , cv.contribs.`telescope.nvim`
            , cv.contribs.`repl.vim`
            ]
        , latex.skips.small
        , latex.sidebar.makeIcons
            "Misc Experience"
            [ cv.miscExperience.swim
            , cv.miscExperience.accordion
            , cv.miscExperience.counsellor
            ]
        , latex.sidebar.makeEducation cv.education
        ]

in  sidebar
