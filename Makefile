precommit:
	reek
	rubocop
	rake
install:
	bundle install
	rake db:create
	rake db:migrate
startdev:
	rails server
start:
	heroku ps:scale web=1
stop:
	heroku ps:scale web=0
clean:
	rm -rf tmp
