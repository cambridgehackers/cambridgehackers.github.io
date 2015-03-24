
all:
	echo "need target"

misc:
	#apt-cache search bundler
	#sudo apt-get install ruby-bundler
	#bundle exec jekyll serve
	#apt-cache search jekyll
	#sudo apt-get install ruby1.9.1-dev
	#gem install jekyll
	#sudo gem install jekyll
	#bundle exec jekyll serve
	#apt-cache search rubygems
	#sudo apt-get install rubygems
	#bundle exec jekyll serve
	#which jekyll
	#apt-cache search gemfile
	#apt-cache search gem
	#sudo apt-get install bundler
	#bundle install
	#bundle exec jekyll serve

ruby:
	wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.1.tar.gz
	tar xzf ruby-2.2.1.tar.gz 
	cd ruby-2.2.1/
	CFLAGS=-fPIC ./configure
	make
	sudo make install
	ruby --version

afterruby:
	gem install bundler
	sudo gem install bundler
	sudo apt-get install nodejs nodejs-dbg nodejs-dev

gbundler:
	gem install bundler

binstall:
	bundle install

run:
	echo "server running at port 4000"
	bundle exec jekyll serve
