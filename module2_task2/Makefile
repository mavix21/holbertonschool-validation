BINARY_NAME = awesome-api
LOG_FILE = $(BINARY_NAME).log

.PHONY: build run stop clean test lint unit-tests

build: lint	 ## Compile the source code of the application to a binary named awesome-api
	@go build	

run: build	 ## Run the application in background by executing the binary and writes the log into a file named awesome-api.log
	@./$(BINARY_NAME) > $(LOG_FILE) 2>&1 &

stop: 	  	 ## Stop the application
	@pgrep $(BINARY_NAME) | xargs kill 2> /dev/null || true

clean: stop	 ## Stop the application. Delete the binary awesome-api and the log file awesome-api.log
	@rm -f $(BINARY_NAME) $(LOG_FILE)

test:		 ## Check the status of the server
	@curl -v http://localhost:9999
	@curl -v http://localhost:9999/health

lint: 		 ## Staticly analyse the source code
	@golangci-lint run

unit-tests:  ## Run unit tests
	@go test -v -short -coverprofile=coverage-units.out

help:		 ## Show this help usage
	@grep -F -h "##" Makefile | grep -v grep | sed -e 's/:.*##/:\t/'
