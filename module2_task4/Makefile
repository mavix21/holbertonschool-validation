# Makefile for Go-Hugo website

# Define variables
POST_TITLE ?= Default title
POST_NAME ?= default_name
PUBLISH_DIR := dist/

# Define targets
.PHONY: build clean post help 

build:		## Generate the website from the markdown and configuration files
	@hugo

clean:		## Cleanup the content of the dist/ directory
	@rm -rf $(PUBLISH_DIR)*

post:		## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	@hugo new posts/$(POST_NAME).md
	@sed -i 's/^title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	@echo -e '\# $(POST_TITLE)' >> content/posts/$(POST_NAME).md

check: 		## Lint Markdown files inside content/posts
	@markdownlint content/posts/*.md
	@markdown-link-check content/posts/*.md

validate:	## Validate index.html with WC3-Validator
	python3 /opt/W3C-Validator/w3c_validator.py dist/index.html || true

help:		## Show this help usage
	@grep -F -h "##" $(MAKEFILE_LIST) | grep -v grep | sed -e 's/:.*##/:\t/'
