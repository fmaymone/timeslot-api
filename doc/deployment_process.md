##Deployment Proccess

## Hotfix (bug on master branch)
			git branch							heroku app

		(timeslotinc/master)
				|
				|	(create feature branch)
				V
		origin/hotfix/<name>			-->		developer heroku account
				|
				|	(pull request)
				V
		timeslotinc/master				-->		production
				|
				|	(merge down)
				V
			   ...

## Bug Fix (bug on development)
			git branch							heroku app

		(timeslotinc/develop)
				|
				|	(create feature branch)
				V
		origin/feature/<name>_fix		-->		developer heroku account
				|
				|	(pull request)
				V
		timeslotinc/develop				-->		staging
				|
				|	(merge down)
				V
			   ...

## New Feature
			git branch							heroku app

		(timeslotinc/develop)
				|
				|	(create feature branch)
				V
		origin/feature/<name>			-->		developer heroku account
				|
				|	(pull request)
				V
		timeslotinc/develop				-->		staging
				|
				|	(merge down)
				V
			   ...

## Release
			git branch							heroku app

		(timeslotinc/develop)
				|
				|	(create release branch)
				V
		origin/release/v<number>		-->		developer heroku account
				|
				|
				V
		timeslotinc/master				-->		production

###Naming Policy
	feature: feature/<name> (e.g. feature/medialist)
	bug fix: feature/<name>_fix (feature/location_fix)
	hotfix: hotfix/<name> (hotfix/location)
	release: release/v<number> (e.g. release/v1.0.1)

###Code Modification Policy
- In case there is a bug but all tests pass, before writing any code write a test that checks this bug and fails. write code until this test (and all other tests) passes.
- The above apply for any feature written (i.e before you write any code write a test that will test it).


###Heroku Instances
- Production
	- Git: git@heroku.com:tsinc-pro.git
	- Git Remote: production
	- Host: tsinc-pro.herokuapp.com
	- Cloudinary Name: dtmb2xpyv
- Stage
	- Git: git@heroku.com:tsinc-stage.git
	- Git Remote: staging
	- Host: tsinc-stage.herokuapp.com
	- Cloudinary Name: dtmb2xpyv
- Develop 1
	- Git: git@heroku.com:tsinc-dev1.git
	- Git Remote: dev1
	- Host: tsinc-dev1.herokuapp.com
	- Cloudinary Name: dtmb2xpyv
- Develop 2
	- Git: git@heroku.com:tsinc-dev2.git
	- Git Remote: dev2
	- Host: tsinc-dev2.herokuapp.com
	- Cloudinary Name: dtmb2xpyv


####TODO
- Think whether or not releases need a review via pull requests