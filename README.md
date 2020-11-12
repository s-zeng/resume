# resume

This repo contains two components:

- dhall-resume: A standard library of helper functions to write and template a 
  resume in Dhall. Includes data types and constructors for various resume 
  constructs like work experience entries, side projects, etc. Also includes 
  template helpers for generating markdown and latex from the dhall-resume types
- zeng-simon-resume: My resume, built using dhall-resume.

# Releases

Everytime I update my resume, I tag a release. You can check the releases on the 
right-hand side of this github page to view my latest resume. Alternatively, 
each release also pushes my latest resumes to 
[https://simonzeng.com/resume](https://simonzeng.com/resume)

Currently, this repo produces the following human readable resume artifacts:

- [Markdown](https://simonzeng.com/resume/Zeng_Simon_Resume.md) (this is what 
  gets pushed to the website)
- [Pretty pdf](https://simonzeng.com/resume/Zeng_Simon_Resume.pdf)
- [Pdf for ATS](https://simonzeng.com/resume/Zeng_Simon_Resume.minimal.pdf)

As well as the following machine readable formats:

- [Json](https://simonzeng.com/resume/Zeng_Simon_Resume.json)
- [Yaml](https://simonzeng.com/resume/Zeng_Simon_Resume.yaml)
- [Dhall](https://simonzeng.com/resume/Zeng_Simon_Resume.dhall)

# License

All code here is licensed under the Affero GPL3.
