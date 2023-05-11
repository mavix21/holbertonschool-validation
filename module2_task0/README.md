# Simple HTTP Server in Go

This is a simple HTTP server written in Go using the Gorilla Mux package.

## Getting Started

### Prerequisites
- [Go](https://golang.org/doc/install) installed
- Make

## Usage

To run the server, simply run the following command:

```bash
make run
```

This will compile the source code and start the server in the background. The server will be accessible at http://localhost:9999/health.

To stop the server, run the following command:

```bash
make stop
```

To clean up the generated binary and log files, run:

```bash
make clean
```

To check the status of the server, run:

```bash
make test
```

To see all available commands, run:

```bash
make help
```

## HTTP Routes

The server only has one route: /health. When an HTTP GET request is received on this path, the server responds with a 200 OK status and the body ALIVE.
