
# Set up backend repo

* Configure ssh

    1. Create key pair in ~/.ssh/ with ssh-keygen

            $ ssh-keygen -b <BIT_SIZE> -t <TYPE> -f <FILE_PATH>

    2. Define a ssh host named 'github' in ~/.ssh/config

            Host github
                User git
                HostName github.com
                IdentityFile ~/.ssh/<KEY_NAME>
                Compression yes
                Port 22
 
* Create fork on github

        https://github.com/timeslotinc/TS_RAILS_BACKEND > Fork

* Clone repo

        $ git clone github:<developer>/TS_RAILS_BACKEND.git

* Create remote for main repo

        $ git remote add main github:timeslotinc/TS_RAILS_BACKEND.git


# Develop new feature

* Create branch from "develop" branch

        $ git checkout -b feature/<feature_name> timeslotinc/develop

* Do work

* Get updates from main repo

        $ git fetch timeslotinc
        $ git checkout feature/<feature_name>
        $ git merge timeslotinc/feature    
        $ git push origin feature/<feature_name>
    
* Do more work 

* Push to personal fork

        $ git push origin feature/<feature_name>

* Send pull request via github

        base branch: timeslotinc/develop
        head branch: <developer>/feature/<feature_name>


# Do a hotfix

* Create branch from "develop" branch

        $ git checkout -b hotfix/<name_of_hotfix> timeslotinc/master

* Do work

* Push to personal fork

        $ git push origin hotfix/<name_of_hotfix>

* Send pull request via github


# Get updates from timeslotinc repo

* Resync remote tracking branches

        $ git fetch timeslotinc

* Update local "master" branch

        $ git checkout master
        $ git merge timeslotinc/master

* Update local "develop" branch

        $ git checkout develop
        $ git merge timeslotinc/master

