# Simple Website

This is a simple website written in Markdown and built using Hugo, and an API
written in GO

## Getting Started

### Prerequisites

- [Go](https://golang.org/doc/install) installed
- [Hugo v0.84.0](https://github.com/gohugoio/hugo/releases/tag/v0.84.0)
- Make
- [golangci-lint](https://golangci-lint.run/usage/install/) installed
- [markdownlint](https://github.com/igorshubovych/markdownlint-cli) installed
- [markdown-link-check](https://www.npmjs.com/package/markdown-link-check) installed
- [Python 3](https://www.python.org/downloads/) installed

## Lifecycle

### Post

To create a new blog post with name POST_TITLE and title POST_TITLE, run:

```bash
make POST_NAME=<your filename> POST_TITLE="<your title>" post
```

### Build

To generate the website from the markdown and configuration files and compile
the source code of the API to a binary named awesome-api, run:

```bash
make build
```
This command will generate the website in the dist directory and compile the
API to a binary named awesome-api.

### Run

To run the application in the background by executing the binary and write the
log into awesome-api.log, run:

```bash
make run
```

### Clean

To cleanup the content of the ./dist/ directory, and delete the binary
`awesome-api` and log files run:

```bash
make clean
```

### Stop

To stop the application, run:

```bash
make stop
```

### Check

To lint markdown files inside ./content/posts, run:

```bash
make check
```

## Lint

To staticly analyses the app source code and markdown files, run:

```bash
make lint
```

### Validate

To validate index.html with WC3-Validator, run:

```bash
make validate
```

### Unit tests

To run the unit tests, run:

```bash
make unit-tests
```

### Integration tests

To run the integration tests, run:

```bash
make integration-tests
```

### Test

To execute all testing targets, including unit tests, integration tests, and
HTML validation, run:

```bash
make test
```

### Help

To see all available commands, run:

```bash
make help
```

## Build Workflow

his workflow is triggered whenever there is a push event in the repository. Additionally, it is scheduled to run daily at midnight using a cron job.

### Job: build

This job runs on an Ubuntu 22.04 virtual machine.

#### Steps:

1. **Clone repository**
   - Action: `actions/checkout@v3`
   - Description: Clones the repository into the runner's workspace.
   - Inputs:
     - `fetch-depth: 0` - Fetches the complete history of the repository.

2. **Validate setup.sh script**
   - Command: `shellcheck module3_task1/setup.sh`
   - Description: Lints the `module3_task1/setup.sh` script for shell script issues.

3. **Setup required tools**
   - Command: `source module3_task1/setup.sh`
   - Description: Executes the `module3_task1/setup.sh` script to install necessary tools and dependencies.
     - Tools installed:
       - `wget`
       - `hugo` (extended version)
       - `markdownlint-cli`
       - `markdown-link-check`
       - `shellcheck`

4. **Build the app**
   - Commands:
     ```
     cd module3_task1
     make build
     ```
   - Description: Changes the current directory to `module3_task1` and executes the `make build` command.
     - `make build` triggers the `hugo-build` and `go-build` targets in the Makefile.
     - `hugo-build` generates the website from markdown and configuration files using `hugo`.
     - `go-build` compiles the source code of the application to a binary named `awesome-api` using `go build`.
