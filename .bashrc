# Aliases 
source ~/.bash_aliases

# Term
TERM=xterm-256color

# Prompt
PS1="[\u \w]$"

# Texlive
TL=/home/andrej/env/texlive/i386-linux
PATH=/home/andrej/env/bin:$TL:$PATH

PDFLATEX="pdflatex --shell-escape"
export PDFLATEX
