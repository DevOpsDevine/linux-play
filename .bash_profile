
export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH:/opt/chef/embedded/bin
export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
export SOURCEDIR=~/src
export PRIVATESOURCEDIR=~/DevOpsDevinesrc
export OPSCODE_USER=mdevine-daptiv

source /usr/local/bin/git-completion.sh
source /usr/local/bin/git-prompt.sh

PS1='\e[0;32m\w\e[m\e[0;33m$(__git_ps1 " (%s)")\e[0;32m\n\$\e[m '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
tabname () { printf "\e]1;$1\a"; }

#navigation
alias src="cd ${SOURCEDIR}"
alias psrc="cd ${PRIVATESOURCEDIR}"
alias ppm="cd ${SOURCEDIR}/Ppm"
alias osx="cd ${SOURCEDIR}/OS-X-Workstation"
alias ppmlib="cd ${SOURCEDIR}/PpmLib"
alias site="cd ${SOURCEDIR}/daptiv_site"
alias winsetup="cd ${SOURCEDIR}/daptiv_winsetup"
alias ppmapp="cd ${SOURCEDIR}/PpmApp"
alias chefrepo="cd ${SOURCEDIR}/chef-repo"
alias cookbooks="cd ${SOURCEDIR}/chef-repo/cookbooks"
alias berkshelf="cd ${HOME}/.berkshelf/cookbooks"

#execution shortcuts
alias be="bundle exec"
alias bslv="be berks update&&be berks install --path ${SOURCEDIR}/chef-repo/cookbooks"
alias bsv="chefrepo&&bslv&&cd -"

alias gstat="git status"
alias gdiff="git diff"
alias gcom="git commit -m"
alias gmas="git checkout master"
alias gadd="git add ."
alias gpush="git push origin head"
alias gpull="git pull"
alias gprune="git fetch -p"

alias vstat="vagrant status"
alias vup="vagrant up"
alias vpro="vagrant provision"
alias vdown="vagrant halt"
alias vhalt="vagrant halt"
alias vsusp="vagrant suspend"
alias vrel="vagrant reload"
alias vlist="vagrant box list"
alias exterminate="vagrant destroy -f"

#change to source directory, clone a repo, then get oouuuut
clone() { src&&git clone git@github.com:daptiv/"$@".git&&cd -; }
pclone() { psrc&&git clone git@github.com:DevOpsDevine/"$@".git&&cd -; }

#remove a vagrant box
vremove() { vagrant box remove "$@" virtualbox; }

#make these shell functions available to child processes, like in an xargs call
export -f clone
export -f pclone
export -f vremove

#speaking of which...
#vagrant box remove all base boxes
alias vlistcol="vlist | cut -d' ' -f 1" 
alias vnuke='vlist | cut -d" " -f 1 | xargs -n 1 bash -c '"'"'vremove '"\"\$@\"'"' _ ;'
