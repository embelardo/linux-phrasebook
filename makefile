help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-28s\033[0m %s\n", $$1, $$2}'

.PHONY: help

# 10 Finding Files, Directories, Words, and Phrases ###########################

ack.man: ## Show ack man page
	ack --man

ack.search.in.file: ## Use ack to search in file
	ack -i agile ch10/d01/d01bb/file-02.txt

ack.search.in.files: ## Use ack to search in files
	ack -i -r agile ch10/*

ack.search.in.files.context: ## Use ack to search and include lines around match
	ack -i -r -B 1 -A 1 documentation ch10/*

ack.search.in.files.exact: ## Use ack to search many words (exact match)
	ack -i -r better ways ch10/*
	ack -i -r "better ways" ch10/*
	ack -i -r 'better ways' ch10/*

ack.search.in.files.word: ## Use ack to search whole words
	ack -i -r do ch10/*
	ack -i -r -w do ch10/*

ack.search.output: ## Use ack to search command output
	@echo '* Unlike grep, ack cannot provide line number in this use case'
	@echo
	cat ch10/d01/d01bb/file-02.txt | ack -i agile
	cat ch10/d01/d01bb/file-02.txt | grep -i --color=always -n agile

grep.man: ## Show grep man page
	man grep

grep.search.in.file: ## Use grep to search in file
	grep -i --color=always agile ch10/d01/d01bb/file-02.txt

grep.search.in.files: ## Use grep to search in files
	grep -i --color=always -r -n agile ch10/*

grep.search.in.files.context: ## Use grep to search and include lines around match
	grep -i --color=always -r -n -B 1 -A 1 documentation ch10/*

grep.search.in.files.exact: ## Use grep to search many words
	grep -i --color=always -r -n better ways ch10/* || true
	grep -i --color=always -r -n "better ways" ch10/*
	grep -i --color=always -r -n 'better ways' ch10/*

grep.search.in.files.word: ## Use grep to search whole words
	grep -i --color=always -r -n do ch10/*
	grep -i --color=always -r -n -w do ch10/*

grep.search.output: ## Use grep to search command output
	cat ch10/d01/d01bb/file-02.txt | grep -i --color=always -n agile

locate.file: ## Use locate command to find hide-and-seek.txt
	locate -i hide-and-seek

locate.man: ## Show locate man page
	man locate

locate.updatedb: ## Update locate database (macos)
	sudo /usr/libexec/locate.updatedb

.PHONY: ack.man ack.search.in.file ack.search.in.files ack.search.in.files.context ack.search.in.files.exact ack.search.in.files.word
.PHONY: grep.man grep.search.in.file grep.search.in.files grep.search.in.files.context grep.search.in.files.exact grep.search.in.files.word grep.search.output
.PHONY: locate.updatedb locate.file
