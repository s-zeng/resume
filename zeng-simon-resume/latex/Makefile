Zeng_Simon_Resume.pdf: altacv.cls resume.tex sidebar.tex
	xelatex resume.tex
	mv resume.pdf Zeng_Simon_Resume.pdf

altacv.cls: altacv.dhall ../cv.dhall
	dhall text < altacv.dhall > altacv.cls

resume.tex: resume.dhall ../cv.dhall
	dhall text < resume.dhall > resume.tex

sidebar.tex: sidebar.dhall ../cv.dhall
	dhall text < sidebar.dhall > sidebar.tex

.PHONY: clean

clean:
	latexmk -C
	rm -f altacv.cls
	rm -f resume.tex
	rm -f sidebar.tex
	rm -f Zeng_Simon_Resume.pdf
