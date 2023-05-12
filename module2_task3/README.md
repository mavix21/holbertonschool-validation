# Simple HTTP Server in Go

This is a simple HTTP server written in Go using the Gorilla Mux package.

## Getting Started

### Prerequisites
- [Go](https://golang.org/doc/install) installed
- Make

## Lifecycle

### Lint

To analyse the source code without the need to compile or execute the application, run:

```bash
make lint
```

### Build

To compile the source code of the application to a binary, run the following command:

```bash
make build
```

Note that this will not work if the lint fails

### Run

To run the server, simply run the following command:

```bash
make run
```

This will compile the source code and start the server in the background. The server will be accessible at http://localhost:9999/health.

### Stop

To stop the server, run the following command:

```bash
make stop
```

### Clean

To clean up the generated binary and log files, run:

```bash
make clean
```

### Test

To run both unit tests and integration tests, run:

```bash
make test
```

### Unit Tests

To run the unit tests, run:

```bash
make unit-tests
```

### Integration Tests

To run the integration tests, run:

```bash
make integration-tests
```

### Help

To see all available commands, run:

```bash
make help
```

## HTTP Routes

The server only has one route: /health. When an HTTP GET request is received on this path, the server responds with a 200 OK status and the body ALIVE.
