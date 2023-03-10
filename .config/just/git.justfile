set dotenv-load := true
set shell := ["zsh", "-uc"]

init:
  git init
  git branch -M ${branch}
  git remote add origin ${remote}
  git remote -v

add file:
  git add {{file}}

commit comment:
  git commit -m "{{comment}}"

push:
  git push -u origin ${branch}

@log:
  git log 

force-push:
  just add 
  just commit "initial commit"
  just push