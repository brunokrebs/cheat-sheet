alias git_poc="git push origin HEAD"
alias git_wip="git add . && git commit -m $1"
alias git_cap="git_wip $1"
alias refresh_hosts="sudo killall -HUP mDNSResponder"
alias refresh_bash="source ~/.bash_profile"
alias ll="ls -la"
alias blog="(cd ~/git/blog && bundle exec jekyll serve --watch --limit_posts 1 &)"
alias new_post="create_new_post"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
eval "$(rbenv init -)"

# git completion
source ~/bin/completion-git.bash

# google cloud
export PATH="/usr/local/bin/google-cloud-sdk/bin":$PATH
source /usr/local/bin/google-cloud-sdk/completion.bash.inc

function create_new_post {
  # are we are on blog's root dir?
  ls | grep Rakefile &> /dev/null \
    && ls | grep _posts &> /dev/null
  if [ $? -gt 0 ]; then
    echo "not on blog's root directory"
    return 1
  fi

  # have we set upstream properly?
  git remote -v \
    | grep upstream \
    | grep "github.com:auth0/blog.git" \
    &> /dev/null
  if [ $? -gt 0 ]; then
    echo "no upstream found"
    return 1
  fi

  # check if new branch was informed
  if [ "$#" -ne 2 ]; then
    echo "Please, inform a branch and a title to the new post."
    return 1
  fi

  # have we chose a name that was not taken before?
  git branch | grep -w $1 &> /dev/null
  if [ $? -eq 0 ]; then
    echo "this branch already exists"
    return 1
  fi

  # is the current branch clean?
  git status | grep "working tree clean" &> /dev/null
  if [ $? -gt 1 ]; then
    echo "your current branch is not clean"
    return 1
  fi

  # then update references to upstream/master
  git fetch upstream

  # and merge it on our local master
  git checkout master
  git merge upstream/master

  # to create a brand new branch
  git checkout -b $1

  # with a brand new post
  rake new_post["$2"]
}
