# set username and default branch
git config --global user.name "neutral00"
git config --global user.email "to.arvmail@gmail.com"
git config --global init.defaultBranch main

# set aliases
git config --global alias.s status
git config --global alias.p pull
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm "commit -m"
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.graph "log --graph --decorate --oneline --all"
git config --global alias.stl "stash list"
git config --global alias.stpum "stash push -m "
git config --global alias.stpo "stash pop"
git config --global alias.stdo "stash drop"
git config --global alias.sta "stash apply"
git config --global alias.sts "stash show"
git config --global alias.stsp "stash show -p"

