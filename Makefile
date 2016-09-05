ROOT = $(shell pwd)

.PHONY: emacs screen bash ditaa sunrise deskel org-gcal.el sbt

all: emacs bash git screen

emacs: submodule sunrise wl deskel org-gcal.el sbt
	echo $(ROOT)
	ln -fs $(ROOT)/.emacs ~/
	mkdir -p ~/.emacs.d

submodule:
	git submodule init
	git submodule update sunrise-commander deskel 
	mkdir -p ~/.emacs.d/lisp

sunrise:
	git submodule update sunrise-commander
	cd sunrise-commander && emacs -Q --batch -L . -f batch-byte-compile *.el
	ln -fs $(ROOT)/sunrise-commander ~/.emacs.d/lisp/

deskel:
	git submodule update deskel
	cd deskel && emacs -Q --batch -L . -f batch-byte-compile *.el
	ln -fs $(ROOT)/deskel ~/.emacs.d/lisp/


org-gcal.el:
	git submodule update org-gcal.el
	mkdir -p ~/.emacs.d/lisp/org-gcal
	ln -fs $(ROOT)/org-gcal.el/org-gcal.el ~/.emacs.d/lisp/org-gcal/

ditaa:
	git submodule update ditaa
	cd ditaa/build && ant
	ln -fs $(ROOT)/ditaa/releases/ditaa0_10.jar ~/.emacs.d/ditaa.jar

screen:
	ln -fs $(ROOT)/.screenrc ~/

bash:
	ln -fs $(ROOT)/.bash_aliases ~/
	ln -fs $(ROOT)/.bashrc ~/


git:
	ln -fs $(ROOT)/.gitconfig ~/

wl:
	ln -fs $(ROOT)/.wl ~/
	ln -fs $(ROOT)/.folders ~/

sbt:
	mkdir -p ~/.sbt/0.13/plugins
	cp -fr .sbt ~/
