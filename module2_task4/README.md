# Simple Website

This is a simple website written in Markdown and built using Hugo

## Getting Started

### Prerequisites
- [Go](https://golang.org/doc/install) installed
- [Hugo v0.84.0](https://github.com/gohugoio/hugo/releases/tag/v0.84.0)
- Make

## Lifecycle

### Build

To generate the website from the markdown and configuration files, run:

```bash
make build
```

### Post

To create a new blog post with name POST_TITLE and title POST_TITLE, run:

```bash
make POST_NAME=<your filename> POST_TITLE="<your title>" post
```

### Clean

To cleanupt the content of the ./dist/ directory, run:

```bash
make clean
```

### Check

To lint markdown files inside ./content/posts, run:

```bash
make check
```

### Validate

To validate index.html with WC3-Validator, run:

```bash
make validate
```

### Help

To see all available commands, run:

```bash
make help
```
