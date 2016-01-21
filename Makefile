ROOT = $(shell pwd)

PHONY: emacs screen bash

emacs: submodule sunrise org
	echo $(ROOT)
	ln -fs $(ROOT)/.emacs ~/

submodule:
	git submodule init
	git submodule update sunrise-commander
	mkdir -p ~/.emacs.d/lisp

sunrise:
	cd sunrise-commander && emacs -Q --batch -L . -f batch-byte-compile *.el
	ln -fs $(ROOT)/sunrise-commander ~/.emacs.d/lisp/

org:
	cd org-mode && make
	ln -fs $(ROOT)/org-mode/lisp ~/.emacs.d/lisp/org-mode

screen:
	ln -fs $(ROOT)/.screenrc ~/

bash:
	ln -fs $(ROOT)/.bash_aliases ~/
	ln -fs $(ROOT)/.bashrc ~/
