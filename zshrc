# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="my_muse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOCONNECT=false
plugins=(git tmux)

if [ -z "$TMUX" ]; then
  tmux
fi

# User configuration

#export PATH="/Users/thomas/.rvm/gems/ruby-2.2.1/bin:/Users/thomas/.rvm/gems/ruby-2.2.1@global/bin:/Users/thomas/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/thomas/bin:/Users/thomas/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/java/jre1.8.0_201/bin
export PATH=$PATH:/home/tpei/Documents/wskdeploy
export PATH=$PATH:/home/tpei/Code/thesis_app_store/cli
export PATH=$PATH:/home/tpei/Code/tools/bin
export PATH=$PATH:/home/tpei/.gem/ruby/2.5.0/bin
# export PATH=$PATH:/usr/local/share/wemux

source $ZSH/oh-my-zsh.sh
source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

for dir in "/home/tpei/Code"; do
  if [[ -d "$dir/tools/bin" ]]; then
    export PATH=$dir/tools/bin:$PATH
    source $dir/tools/zsh/aliases
  fi
done

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# general stuff
alias gf='cd ~/Code/gapfish'
alias gp='cd ~/Code/gapfish_prophet'
alias zconf='vim ~/.zshrc'
alias dcr='docker-compose run --service-ports web rvm-shell'
alias vimconf='vim ~/.vimrc'
alias rspec='bundle exec rspec'
alias rubo='bundle exec rubocop'
alias plog='vim /Users/thomas/Code/gapfish_prophet/.elasticbeanstalk/logs/latest/i-5af273e6/var/log/puma/puma.log'
alias hmigrate='heroku run rake db:migrate'
alias hconsole='heroku run rails console'
alias enkey='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias diskey='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
alias prepush='bundle exec rubocop && bundle exec rspec'
alias av='source env/bin/activate'
alias dv='deactivate'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dce='docker-compose exec'
alias docker-rdi="docker images -q --filter dangling=true | xargs docker rmi"
alias docker-rsc="docker ps -aq --no-trunc | xargs docker rm"
alias docker-rui='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias jupyter="/Users/thomas/anaconda3/bin/jupyter_mac.command"
alias wtf="~/Code/wtfutil/wtfutil"

# git
alias pull='git pull'
alias co='git checkout'
alias merge='git merge'
alias commit='git commit'
alias push='git push'
alias status='git status'
alias add='git add'
alias diff='git diff'
alias stash='git stash'
alias gsa='git stash apply'
alias hpush='git push heroku master'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'
alias gfp='git push --force-with-lease'
alias gl='git log --graph --abbrev-commit --decorate --date=relative --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias deploytostaging='git checkout staging && git pull && git merge @{-1} && git push && git checkout @{-1}'
alias deployprod='git checkout master && git pull && git checkout production && git pull && git merge master && git push && git checkout master'
alias ci='hub ci-status -v'

# docker swarm, openFaaS and such
alias gfaas='cd ~/Code/open_faas'
alias -g -- -s="service" # as in docker service ls -> docker -s ls
alias -g -- -gf="-g http://127.0.0.1:1337"

# OpenWhisk
alias wsk='bx wsk'
alias wskdp='/home/tpei/Documents/wskdeploy/wskdeploy'

# kubernetes
alias k=kubectl
alias kg='k get'
alias kl='k logs --tail=50 --follow=true'
alias ke='k edit'
alias kd='k describe'
alias kdel='k delete'
alias kaf='k apply -f'
alias keti='k exec -ti'
alias kcuc='k config use-context'
alias kccc='k config current-context'
#alias kgp="k get pods"
alias kgp="k get pods --field-selector='status.phase!=Succeeded,status.phase!=Failed'"
alias kep='k edit pods'
alias kdp='k describe pods'
alias kdelp='k delete pods'
alias kgs='k get svc'
alias kes='k edit svc'
alias kds='k describe svc'
alias kdels='k delete svc'
alias kgsec='k get secret'
alias kdsec='k describe secret'
alias kdelsec='k delete secret'
alias kgd='k get deployment'
alias ked='k edit deployment'
alias kdd='k describe deployment'
alias kdeld='k delete deployment'
alias ksd='k scale deployment'
alias krsd='k rollout status deployment'
alias kgrs='k get rs'
alias krh='k rollout history'
alias kru='k rollout undo'
alias kgn='k get pods'
alias kdn='k describe pods'

alias -g -- -lo='--selector app=operations'
alias -g -- -lus='--selector app=user-and-support'
alias -g -- -lust='--selector app=user-and-support'
alias -g -- -lp='--selector app=prophet'
alias -g -- -lor='--selector app=oreo'
alias -g -- -ldep='--selector app=deployer'
alias -g -- -lrc='--selector app=redis-cluster'
alias -g -- -lda='--selector app=dashboard'
alias -g -- -ll='--selector app=gapfish-login'
alias -g -- -lrs='--selector app=rewe-sftp'
alias -g -- -lm='--selector app=mongo'
alias -g -- -lgu='--selector app=gem-updater'
alias -g -- -ngs='--namespace gapfish-system'
alias -g -- -nf='--namespace openfaas'
alias -g -- -nfn='--namespace openfaas-fn'

# workaround for ssh key unlock bug
SSH_ENV=$HOME/.ssh/environment

function init_push {
  git push --set-upstream origin $(current_branch)
}

# start the ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  # spawn ssh-agent
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add
}

# required for vpn ssh to work correctly
function set_mtu {
  echo "setting mtu on wifi interface to 1480"
  sudo ifconfig wlp3s0 mtu 1480
}

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
  start_agent;
}
else
  start_agent;
  # since this is only done on first startup:
  set_mtu;
fi

devops() {
  who=${1:-tba}
  secrets=$(kubectl get secret --context gapfish dashboard-env -o json | jq -r '.data[".env"]' | base64 -d)
  (
    eval $secrets
    curl -d "{ \"auth_token\": \"${DASHING_AUTH_TOKEN}\", \"text\": \"${who}\" }" \
      https://auth_token:${BASIC_AUTH_TOKEN}@${DASHBOARD_URL}/widgets/devops
  )
}

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/Code/k8s/bin"
export NODE_PATH="/usr/local/lib/node_modules"
eval "$(rbenv init -)"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
eval "$("$BASE16_SHELL/profile_helper.sh")"

# added by travis gem
[ -f /Users/thomas/.travis/travis.sh ] && source /Users/thomas/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thomas/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/thomas/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/thomas/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/thomas/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
