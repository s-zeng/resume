RESUME_NAME=Zeng_Simon_Resume
OUTPUT_TYPES=json yaml pdf docx md dhall minimal.pdf
ARTIFACTS=$(foreach type,$(OUTPUT_TYPES),target/$(RESUME_NAME).$(type)) target/index.md target/_config.yml
DEPENDS=cv.dhall dhallResume.dhall | target/

.PHONY: all
all: $(ARTIFACTS) bullets

.PHONY: github
github: $(ARTIFACTS)
	rm target/$(RESUME_NAME).md

.PHONY: bullets
bullets: target/copiable_bulletpoints.txt

target/copiable_bulletpoints.txt: justJobs.dhall $(DEPENDS)
	dhall text < justJobs.dhall > $@

target/$(RESUME_NAME).json: $(DEPENDS)
	dhall-to-json < cv.dhall > $@

target/$(RESUME_NAME).yaml: $(DEPENDS)
	dhall-to-yaml < cv.dhall > $@

target/$(RESUME_NAME).dhall: $(DEPENDS)
	dhall < cv.dhall > $@

target/index.md: index.dhall $(DEPENDS)
	dhall text < index.dhall > $@

target/$(RESUME_NAME).md: markdown.dhall $(DEPENDS)
	dhall text < markdown.dhall > $@

target/_config.yml: jenkins.dhall $(DEPENDS)
	dhall text < jenkins.dhall > $@

target/$(RESUME_NAME).pdf: latex/Makefile $(wildcard latex/*.dhall) $(DEPENDS)
	cd latex/ && make
	cp latex/$(RESUME_NAME).pdf target/

target/$(RESUME_NAME).minimal.pdf: target/$(RESUME_NAME).md
	pandoc -o $@ target/$(RESUME_NAME).md

target/$(RESUME_NAME).docx: target/$(RESUME_NAME).md
	pandoc -o $@ target/$(RESUME_NAME).md

target/:
	mkdir -p target

.PHONY: clean
clean:
	rm -rf target/
	cd latex/ && make clean
