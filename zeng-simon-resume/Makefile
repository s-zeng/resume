RESUME_NAME=Zeng_Simon_Resume
OUTPUT_TYPES=json yaml pdf dhall
ARTIFACTS=$(foreach type,$(OUTPUT_TYPES),$(RESUME_NAME).$(type))
DEPENDS=$(wildcard *.dhall)

all: $(ARTIFACTS)

$(RESUME_NAME).json: $(DEPENDS)
	dhall-to-json < cv.dhall > $(RESUME_NAME).json

$(RESUME_NAME).yaml: $(DEPENDS)
	dhall-to-yaml-ng < cv.dhall > Zeng_Simon_Resume.yaml

$(RESUME_NAME).dhall: $(DEPENDS)
	dhall < cv.dhall > Zeng_Simon_Resume.dhall

$(RESUME_NAME).pdf: $(DEPENDS) latex/Makefile $(wildcard latex/*.dhall)
	cd latex/ && make
	cp latex/$(RESUME_NAME).pdf .

.PHONY: clean
clean:
	rm -f $(ARTIFACTS)
	cd latex/ && make clean
