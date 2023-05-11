# Makefile for Go-Hugo website

# Define variables
# HUGO_VERSION := 0.84.0
# HUGO_CMD := hugo_$(HUGO_VERSION)
POST_TITLE ?= Default title
POST_NAME ?= default_name
PUBLISH_DIR := dist/

.PHONY: build clean post	# Define targets

build:	# Build target: generate the website from the markdown and configuration files
	@hugo

clean:	# Clean target: cleanup the content of the dist/ directory
	@rm -rf $(PUBLISH_DIR)*

post:	# Post target: create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	@hugo new posts/$(POST_NAME).md
	@sed -i 's/^title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	@echo -e '# $(POST_TITLE)' >> content/posts/$(POST_NAME).md
