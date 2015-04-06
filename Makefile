
all:
	echo "need target"

misc:
	#sudo apt-get install ruby-bundler
	#sudo apt-get install ruby1.9.1-dev
	#gem install jekyll
	#sudo gem install jekyll
	#sudo apt-get install rubygems
	#sudo apt-get install bundler
	#binstall
	#run

ruby:
	sudo apt-get install libssl-dev
	wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.1.tar.gz
	tar xzf ruby-2.2.1.tar.gz 
	(cd ruby-2.2.1/; \
	CFLAGS=-fPIC ./configure --disable-install-doc --disable-install-rdoc --disable-install-capi ; \
	make; \
	sudo make install)
	ruby --version

afterruby:
	sudo gem install bundler
	sudo apt-get install nodejs nodejs-dbg nodejs-dev

gbundler:
	sudo gem install bundler

binstall:
	bundle install

run:
	echo "server running at port 4000"
	bundle exec jekyll serve
