# Makefile for Go-Hugo website

# Define variables
POST_TITLE ?= Default title
POST_NAME ?= default_name
PUBLISH_DIR := dist/
BINARY_NAME = awesome-api
LOG_FILE = $(BINARY_NAME).log
MARKDOWN_FILES := $(shell find . -name "*.md" -not -path "./themes/*" -not -path "./archetypes/*")

# Define targets
.PHONY: build go-build hugo-build clean post check validate run stop test \
	lint unit-tests integration-tests help 

build: hugo-build go-build	## Generate the website and compile the source code of the app
	
go-build:	## Compile the source code of the application to a binary named awesome-api 
	@go build -o $(BINARY_NAME)

hugo-build: check	## Generate the website from the markdown and configuration files
	@hugo

run: build	## Run the application in background by executing the binary and writes the log into awesome-api.log
	@./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

post:	## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	@hugo new posts/$(POST_NAME).md
	@sed -i 's/^title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

stop:	## Stop the application. Delete the binary awesome-api and log files
	@pgrep $(BINARY_NAME) | xargs kill 2> /dev/null || true

clean: stop	## Cleanup the content of the dist/ directory
	@rm -rf $(PUBLISH_DIR)
	@rm -f $(BINARY_NAME) $(LOG_FILE) coverage-units.out coverage-integrations.out
	@rm -f awesome-website.zip

package: build  ## Produces a file awesome-website.zip, containing the binary awesome-api and the directory dist/ directory
	@zip -r awesome-website.zip $(BINARY_NAME) $(PUBLISH_DIR)

check: 	## Lint Markdown files inside content/posts and README.md and DEPLOY.md files
	@markdownlint $(MARKDOWN_FILES)
	@markdown-link-check $(MARKDOWN_FILES)

go-lint:	## Analyse the app source code
	@golangci-lint run

validate:	## Validate index.html with WC3-Validator
	@python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html 2>&1 || true

lint: check	   ## Staticly analyse the app source code and markdown files

test:    ## Execute all testing targets
	$(MAKE) unit-tests
	$(MAKE) integration-tests
	$(MAKE) validate
	
unit-tests:		## Run the unit tests
	@go test -v -short -coverprofile=coverage-units.out

integration-tests: 	## Run the integration-tests
	@go test -v -coverprofile=coverage-integrations.out

help:	## Show this help usage
	@grep -F -h "##" $(MAKEFILE_LIST) | grep -v grep | sed -e 's/:.*##/:\t/'
