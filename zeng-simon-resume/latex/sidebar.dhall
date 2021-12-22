let cv = ../cv.dhall

let makeResume = ../dhallResume.dhall

let latex = makeResume.latex

let sidebar
    : Text
    = latex.sidebar.makeSidebar
        [ latex.sidebar.makeProjects
            latex.skips.smallDivider
            [ cv.projects.dhall-python
            ,     cv.projects.board-to-latex
              //  { blurb = "Turn pictures of math into \\LaTeX" }
            , cv.projects.rag-shenanigann
            ]
        , latex.skips.small
        , latex.sidebar.makeOSS
            latex.skips.smallDivider
            [ cv.contribs.parinfer-rust
            , cv.contribs.`telescope.nvim`
            , cv.contribs.nvim-tree
            ]
        , latex.skips.small
        , latex.sidebar.makeIcons
            "Misc Experience"
            [ cv.miscExperience.ta
            , cv.miscExperience.counsellor
            , cv.miscExperience.accordion
            ]
        , latex.sidebar.makeEducation cv.education
        ]

in  sidebar
