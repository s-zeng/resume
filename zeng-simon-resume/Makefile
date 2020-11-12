RESUME_NAME=Zeng_Simon_Resume
OUTPUT_TYPES=json yaml pdf dhall minimal.pdf
ARTIFACTS=$(foreach type,$(OUTPUT_TYPES),target/$(RESUME_NAME).$(type)) target/index.md
DEPENDS=$(wildcard *.dhall) target/

all: $(ARTIFACTS)

target/$(RESUME_NAME).json: $(DEPENDS)
	dhall < cv.dhall --explain
	dhall-to-json < cv.dhall > $@

target/$(RESUME_NAME).yaml: $(DEPENDS)
	dhall-to-yaml-ng < cv.dhall > $@

target/$(RESUME_NAME).dhall: $(DEPENDS)
	dhall < cv.dhall > $@

target/index.md: markdown.dhall $(DEPENDS)
	dhall text < markdown.dhall > $@

target/$(RESUME_NAME).pdf: $(DEPENDS) latex/Makefile $(wildcard latex/*.dhall)
	cd latex/ && make
	cp latex/$(RESUME_NAME).pdf target/

target/$(RESUME_NAME).minimal.pdf: lightPdf.dhall $(DEPENDS)
	dhall text < lightPdf.dhall | pandoc -o $@ -

target/:
	mkdir -p target

.PHONY: clean
clean:
	rm -rf target/
	cd latex/ && make clean
