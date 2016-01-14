ROOT = $(shell pwd)

PHONY: emacs screen bash

emacs: submodule sunrise org
	echo $(ROOT)
	ln -fs $(ROOT)/.emacs ~/

submodule:
	git submodule init
	git submodule update sunrise-commander org-mode
	mkdir -p ~/.emacs.d/lisp

sunrise:
	git submodule update sunrise-commander
	cd sunrise-commander && emacs -Q --batch -L . -f batch-byte-compile *.el
	ln -fs $(ROOT)/sunrise-commander ~/.emacs.d/lisp/

org:
	git submodule update org-mode
	cd org-mode && make
	ln -fs $(ROOT)/org-mode/lisp ~/.emacs.d/lisp/org-mode
	ln -fs $(ROOT)/org-mode/contrib/lisp ~/.emacs.d/lisp/org-mode/contrib

screen:
	ln -fs $(ROOT)/.screenrc ~/

bash:
	ln -fs $(ROOT)/.bash_aliases ~/
	ln -fs $(ROOT)/.bashrc ~/
