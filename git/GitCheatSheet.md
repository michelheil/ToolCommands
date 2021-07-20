Using git / cheat sheet

# figure out which version is installed
git --version

# figure out where bin/git is located
which git

# figure out where your .gitconfig (global git configuration) is located
# simply open the config with 
git config --global --edit
# and check the path of the file in the editor
# in my case it is located at /home/michael/.gitconfig

# ensure that git knows your name (and your email address)
git config --global user.name "Michael"
git config --global user.email "michelheil@gmx.de"

# for better and faster handling you can define alias
# the following alias "st" allows you to use "git st" instead of "git status"
git config --global alias.st status

# other useful aliases
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.co diff
git config --global alias.he help
git config --global alias.cl clone

# change color when working with git on command line
git config --global color.ui auto

# setting up end-of-line format to unix "lf". Other options are "crlf" (used in Windows) or "native" (system default value)
git config --global core.eol lf
# there are some more config settings availabe when working with Windows-edited files. However, this is quite a big hussle. So keep on Linux :-)

# define standard editor for commit messages
git config --global core.editor vim


# global configuration of ignoring files
git config --global core.excludefile ~/.gitignore

# local configuration within the actual local repository of ignoring files
echo "*.tmp" >> .gitignore

# check origin url
git remote -v

# change origin url
git remote set-url origin https://github.com/apache/hbase.git

#  get the git root directory
git rev-parse --show-toplevel



###########################################################################
# Tips vom Buch "Git -Verteilte Versionsverwaltung für Code und Dokumente"
###########################################################################

git add -p
git config --global interactive.singlekey true

git diff -staged

## Add current staging are to latest commit within the branch
git commit --amend

git rm
git mv

git log -4
git log --follow -- <datei>
git log --after='Tue Feb 1st, 2011'
git log --since='2011-01-01'
git log --since='100 weeks ago' --before='one week ago'
git log --since='yesterday'
git log --since='yesterday' --author='Michael Heil'

## Search in commit messages
git log -i --grep=<searchString>

## Search in Diff
git log -p -S<searchString>
