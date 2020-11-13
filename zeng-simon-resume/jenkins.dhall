let cv = ./cv.dhall

let blurb = "3rd-year Computer Science student seeking summer 2021 internship"

in  ''
    title: ${cv.info.name} - Resume
    author: ${cv.info.name}
    description: ${blurb}
    email: ${cv.info.email}
    url: "https://${cv.info.site}/resume"

    plugins:
      - jekyll-feed
    ''
