########################################################################
# Creating your first repository and link it to GitHub
########################################################################

# Follow these steps:
### Create a repository in GitHub, for example called "gitCheatSheet". This will be your remote repository
### Save this file where you want to have your local repository, e.g. /home/michael/git-repositories/gitCheatSheet

# Add a README file
echo "# gitCheatSheet" >> README.md

# Initialize git repository 
cd ~/git-repositories/gitCheatSheet
git init
# respone:
# Initialized empty Git repository in /home/michael/git-repositories/gitCheatSheet/.git/

# Add this file and the README.md to the repository
git status

git add README.md
git add git_cheat_sheet.sh 

git status

# Do a commit and push to remote repository
git commit -m "first commit"

# Create a new GitHub repository (DO NOT INITIALIZE) and copy URL into next command
git remote add origin https://github.com/michelheil/gitCheatSheet.git
git push -u origin master

# type in GitHub username and password


########################################################################
# Synching a fork (Web)
########################################################################
https://help.github.com/en/articles/syncing-a-fork


########################################################################
# Synching a fork (Local)
########################################################################
[...Project auf GitHub forken...]
git clone https://github.com/USERNAME/REPONAME.git
cd REPONAME

git remote add upstream https://github.com/ANDERER_USER/ORIGINALREPO.git
git fetch upstream
git branch -u upstream/master

[...Neue Änderungen auf dem Originalprojekt auf GitHub...]
git fetch upstream
git merge


########################################################################
# Preparing a Pull Request
########################################################################
[...Fork synchronisieren, wie in Synching a fork (Local) beschrieben...]

[...Datei lokal ändern...]
git add DATEI
git commit -m "NACHRICHT"
git push origin master
[...Erstelle Pull Request auf GitHub...]