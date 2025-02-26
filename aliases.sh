# SETUP UTILS

export PATH="/usr/local/bin:${PATH}";
#export NVM_DIR="$HOME/.nvm"
#. "$(brew --prefix nvm)/nvm.sh"

# red-colored terminal prompt with current dir and git branch (if applicable)
# export PS1="\[\033[1;91m\]\w\[\033[0m\]\[\033[97m\]\$(parse_git_branch)\[\033[00m\]\[\033[0;91m\] $ \[\033[0m\]";
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%F{white}%b%F{red})'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{red}%d ${vcs_info_msg_0_} $%F{white}'

#ulimit -n 10000;
#source ~/.git-completion.bash

parse_git_branch() {
    # current branch in parentheses
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_branch_name() {
    # current branch w/o parentheses
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# ALIASES

## git
alias gaa='git add -A';
alias gp='git push 2> /dev/null || firstpush'; # pushes current commits and makes a new remote if none exists
alias gpl='git pull';
alias pulldev='git pull origin develop'; # pulls from remote develop branch
alias gc='git clone';
alias gcl='git clone';
alias g='git';
alias go="git checkout";
alias gco="git checkout";
alias tossh="git remote set-url origin";
alias todev="git checkout develop";

gclssh() {
    git clone git@"$1":"$2";
}

runflask() {
    FLASK_APP="$1" FLASK_ENV=development flask run;
}

newbranch() {
  git checkout -b "$1";
}

tobranch() {
    git checkout "$1";
}

gbranch() {
    # goes to named new branch and makes it if none exists
    git checkout "$1" 2>/dev/null || git checkout -b "$1"
}

dbranch() {
    git checkout develop;
    git pull;
    git checkout -b "$1";
}

gcom() {
    # adds current branch before commit message and then commits it
    local branch_name=$(git_branch_name);
    git commit -m "$branch_name $1";
}

killbranch() {
    git branch -d "$1";
}

gpo() {
  git push origin "$1";
}

firstpush() {
    # makes new origin branch and then pushes
    local branch_name=$(git_branch_name);
    git push --set-upstream origin $branch_name;
}

## bash profile
# reloads terminal with aliases
alias bshr='source ~/.aliases';
alias bashr='source ~/.aliases';
# opens bash_profile in code
alias bshed='code ~/.aliases';
alias bashed='code ~/.aliases';

##npm
alias npmi="npm install";
alias npms="npm start";
alias npmno="npm run no-server";
alias npmrb="npm run build";
alias node10="nvm use 10.13.0";
alias node6="nvm use 6";
alias node012="nvm use 0.12";

## utilities
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app";
# alias chrome="open -a \"Google Chrome\"";
alias c="clear";
alias lsa="ls -a";
alias ngrok="~/Documents/ngrok"
alias lsgrp="lsgrep";
alias toc="cd /mnt/c";
alias toproj="cd /mnt/c/Projects";
alias linproj="cd ~/projects";
alias todesk="cd /mnt/c/Users/13236/Desktop/";
alias mountd="sudo mount -t drvfs D: /mnt/d";

mountdr() {
    sudo mount -t drvfs "$1": /mnt/"$1"
}

mkcd() {
    # makes a new directory and immediatly goes into it
    mkdir "$1";
    cd "$1";
}

lsgrep() {
    # greps through all files in current dir
    ls -a | grep "$1";
}

mvfromdown() {
    mv /mnt/c/Users/13236/Downloads/"$1" "$2"
}

mvfromdesk() {
    mv /mnt/c/Users/13236/Desktop/"$1" "$2"
}

mvtodesk() {
    mv "$1" /mnt/c/Users/13236/Desktop/"$2"
}

cptodesk() {
    cp "$1" /mnt/c/Users/13236/Desktop/"$2"
}

## conda
alias newconda="conda create --name";
alias useconda="conda activate";
alias killconda="conda deactivate";
alias listconda="conda info --envs";
alias python="python3";

alias newvenv="python3 -m venv env";

## postgres
alias winpsql="psql -h winhost -p 5432 -U postgres";
alias opsql="sudo -u postgres psql";

## glpk
modsol() {
    /mnt/c/Projects/computational-microeconomics/glpk/examples/glpsol --math $1 --output $2
}

lpsol() {
    /mnt/c/Projects/computational-microeconomics/glpk/examples/glpsol --cpxlp $1 --output $2
}

## fun stuff
alias starwars="telnet towel.blinkenlights.nl";
alias fbm="fb-messenger-cli";

alias open="explorer.exe";
alias chrome="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe";

## obsidian
alias obpre="code /mnt/c/Users/13236/Documents/Zettelkasten/preamble.sty"

## haskell
alias haskell="stack ghci"
alias cabal="stack cabal"
