RANGERLOCALPATH := ./ranger/
RANGERSYSTEMPATH := ~/.config/ranger/

vim-get:
	cp ~/.vimrc .

ranger-get:
	mkdir -p $(RANGERLOCALPATH)
	cp $(RANGERSYSTEMPATH)/commands.py $(RANGERLOCALPATH)/commands.py
	cp $(RANGERSYSTEMPATH)/rifle.conf $(RANGERLOCALPATH)/rifle.conf
	cp $(RANGERSYSTEMPATH)/rc.conf $(RANGERLOCALPATH)/rc.conf
	cp $(RANGERSYSTEMPATH)/scope.sh $(RANGERLOCALPATH)/scope.sh
