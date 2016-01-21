ROOT = $(shell pwd)

PHONY: emacs screen bash ditaa

emacs: submodule sunrise org ditaa
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

ditaa:
	wget --no-http-keep-alive -O ditaa.zip "http://downloads.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fditaa%2Ffiles%2Fditaa%2F0.9%2F&ts=1453301598&use_mirror=skylink"
	unzip ditaa.zip -d ditaa/
	rm -rf ditaa.zip
	mkdir -p ~/.emacs.d/lisp/contrib/scripts
	cp ditaa/ditaa0_9.jar ~/.emacs.d/lisp/contrib/scripts/ditaa.jar

screen:
	ln -fs $(ROOT)/.screenrc ~/

bash:
	ln -fs $(ROOT)/.bash_aliases ~/
	ln -fs $(ROOT)/.bashrc ~/

texlive:
	wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
	mkdir -p texlive
	tar xzvf install-tl-unx.tar.gz -C texlive --strip-components=1
	texlive/install-tl
	rm install-tl-unx.tar.gz
