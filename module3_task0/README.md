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

## Workflow

Workflow for this module can be found in .github/workflows/module3_task0.yml at
the root of this repository
