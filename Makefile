PHONY: all sunrise-commander

all:
	cp -f .emacs .screenrc .bash_aliases .Xresources .gitconfig .bashrc ~/
	mkdir -p ~/.emacs.d/lisp
	cp -rf sunrise-commander ~/.emacs.d/lisp/
