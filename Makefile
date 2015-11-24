ROOT = $(shell pwd)

PHONY: emacs screen bash

emacs: sunrise
	echo $(ROOT)
	ln -fs $(ROOT)/.emacs ~/

sunrise:
	git submodule init
	git submodule update sunrise-commander
	mkdir -p ~/.emacs.d/lisp
	cd sunrise-commander && emacs -Q --batch -L . -f batch-byte-compile *.el
	ln -fs $(ROOT)/sunrise-commander ~/.emacs.d/lisp/

screen:
	ln -fs $(ROOT)/.screenrc ~/

bash:
	ln -fs $(ROOT)/.bash_aliases ~/
	ln -fs $(ROOT)/.bashrc ~/
