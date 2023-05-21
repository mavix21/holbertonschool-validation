# Deployment Guide

This document provides instructions for deploying and managing the awesome-api
application.

## Archive Contents

The `awesome-website.zip` archive contains the following items:

- `awesome-api`: The binary file of the awesome-api application.
- `dist/`: The directory containing the generated website files.

## Unarchiving the Application

To unarchive the application, follow these steps:

1. Copy the `awesome-website.zip` file to the desired location.
2. Run the following command to extract the contents:

   ```bash
   unzip awesome-website.zip
   ```

## Start and Stopping the Application

To start the application, navigate to the directory where you performed the
unzip and run the following command:

```bash
./awesome-api > application.log 2>&1 &
```

The application will start running in the background, and the logs will be
written to the application.log file.

To stop the application, run the following command:

```bash
pkill -f awesome-api

```

This command will stop the running application.

## Customizing Log File Location

By default, the application logs are written to the application.log file in the
same directory as the awesome-api binary. To customize the log file location,
modify the command used to start the application and specify the desired path.
For instance, if you want the logs to be written to a file called *awesome.log*
,you would run the following command:

```bash
./awesome-api > awesome.log 2>&1 &
```

## Healthcheck

To quickly verify that the application is running, you can perform a
healthcheck by accessing the application's endpoint. The exact endpoint URL
depends on the application's configuration.
Example: If the application is running on localhost with port 8080, you can use
the following command to perform a healthcheck:

```bash
curl -I http://localhost:8080/health
```

A successful healthcheck will return a response with a status code of 200 OK.
