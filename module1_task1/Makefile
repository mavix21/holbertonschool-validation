# Makefile for Go-Hugo website
# Define variables
# HUGO_VERSION := 0.84.0
# HUGO_CMD := hugo_$(HUGO_VERSION)
POST_TITLE ?= Default title
POST_NAME ?= default_name
PUBLISH_DIR := dist/

# Define targets
.PHONY: build clean post

# Build target: generate the website from the markdown and configuration files
build:
	@hugo

# Clean target: cleanup the content of the dist/ directory
clean:
	rm -rf $(PUBLISH_DIR)*

# Post target: create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
post:
	hugo new posts/$(POST_NAME).md
	sed -i 's/^title: .*/title: "'"${POST_TITLE}"'"/' content/posts/"${POST_NAME}".md
	echo -e '# $(POST_TITLE)' >> content/posts/$(POST_NAME).md
