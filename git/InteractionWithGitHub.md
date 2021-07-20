# working with GitHub

## Synching a fork (Web)
https://help.github.com/en/articles/syncing-a-fork

## Synching a fork (Local)
[...Project auf GitHub forken...]
git clone https://github.com/USERNAME/REPONAME.git
cd REPONAME

git remote add upstream https://github.com/ANDERER_USER/ORIGINALREPO.git
git fetch upstream
git branch -u upstream/master

[...Neue Änderungen auf dem Originalprojekt auf GitHub...]
git fetch upstream
git merge


## Preparing a Pull Request
[...Fork synchronisieren, wie oben beschrieben...]

[...Datei lokal ändern...]
git add DATEI
git commit -m "NACHRICHT"
git push origin master
[...Erstelle Pull Request auf GitHub...]