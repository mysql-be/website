HUGO_VERSION = 0.24.1
CNAME = mysqlusers.be

default: build

deps:
	wget -c -O hugo-$(HUGO_VERSION).tar.gz https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz
	tar xvf hugo-$(HUGO_VERSION).tar.gz hugo

build: deps
	./hugo

deploy: build
	echo $(CNAME) > public/CNAME
	(cd public; git init . ; git add . ; git commit -n 'Automated push' ; git push -f git@github.com:mysql-be/mysql-be.github.io)
