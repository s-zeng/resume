let cv = ./cv.dhall

let blurb = "Haskell Software Engineer"

in  ''
    title: ${cv.info.name} - Resume
    author: ${cv.info.name}
    description: ${blurb}
    email: ${cv.info.email}
    url: "https://${cv.info.site}"

    plugins:
      - jekyll-feed
    ''
