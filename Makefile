PHONY: all sunrise-commander

all:
	cp -f .emacs .screenrc .bash_aliases .Xresources .gitconfig .bashrc ~/
	mkdir -p ~/.emacs.d/lisp
	cd sunrise-commander && emacs -Q --batch -L . -f batch-byte-compile *.el
	cp -rf sunrise-commander ~/.emacs.d/lisp/
