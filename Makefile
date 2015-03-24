
all:
	echo "need target"

gbundler:
	gem install bundler

binstall:
	bundle install

run:
	echo "server running at port 4000"
	bundle exec jekyll serve
