# Simon Zeng's Resume

## Download

You can use the following links to download my resume in a format of your 
choice:

- [PDF](https://simonzeng.com/resume/Zeng_Simon_Resume.pdf)
- [Word Document (DOCX)](https://simonzeng.com/resume/Zeng_Simon_Resume.docx)
- [Markdown](https://simonzeng.com/resume/index.md)

In addition, my resume is available in a number of machine readable formats:

- [ATS-readable PDF](https://simonzeng.com/resume/Zeng_Simon_Resume.minimal.pdf)
- [Json](https://simonzeng.com/resume/Zeng_Simon_Resume.json)
- [Yaml](https://simonzeng.com/resume/Zeng_Simon_Resume.yaml)
- [Dhall](https://simonzeng.com/resume/Zeng_Simon_Resume.dhall)

## About this repo

This repo contains two components:

- dhall-resume: A standard library of helper functions to write and template a 
  resume in Dhall. Includes data types and constructors for various resume 
  constructs like work experience entries, side projects, etc. Also includes 
  template helpers for generating markdown and latex from the dhall-resume types
- zeng-simon-resume: My resume, built using dhall-resume. I specify all my 
  resume information in [zeng-simon-resume/cv.dhall](zeng-simon-resume/cv.dhall),
  where it then gets converted to the various output formats via the utilities 
  from dhall-resume

## Releases

Everytime I update my resume, I tag a release. You can check the releases on the 
right-hand side of this github page to view my latest resume. Alternatively, 
each release also pushes my latest resumes to 
[https://simonzeng.com/resume](https://simonzeng.com/resume)

# License

All code here is licensed under the Affero GPLv3.
