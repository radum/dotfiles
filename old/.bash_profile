# This is to save the bash history in `.bash_history` file. Make sure the file exists
#PROMPT_COMMAND='history -a'

if [ -f ~/bashrc ]; then
	. ~/bashrc   # --> Read ~/bashrc, if present.
fi
