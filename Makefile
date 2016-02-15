ROOT = $(shell pwd)

PHONY: emacs screen bash ditaa

emacs: submodule sunrise ditaa wl
	echo $(ROOT)
	ln -fs $(ROOT)/.emacs ~/
	mkdir -p ~/.emacs.d

submodule:
	git submodule init
	git submodule update sunrise-commander
	mkdir -p ~/.emacs.d/lisp

sunrise:
	git submodule update sunrise-commander
	cd sunrise-commander && emacs -Q --batch -L . -f batch-byte-compile *.el
	ln -fs $(ROOT)/sunrise-commander ~/.emacs.d/lisp/

ditaa:
	wget --no-http-keep-alive -O ditaa.zip "http://downloads.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fditaa%2Ffiles%2Fditaa%2F0.9%2F&ts=1453301598&use_mirror=skylink"
	unzip ditaa.zip -d ditaa/
	mkdir -p ~/.emacs.d/elpa/contrib/scripts
	cp ditaa/ditaa0_9.jar ~/.emacs.d/elpa/contrib/scripts/ditaa.jar

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

clean:
	rm -rf ditaa.zip ditaa
