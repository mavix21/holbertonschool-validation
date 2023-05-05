# Go-Hugo Website

## Prerequisites

- Go
- Hugo version 0.84.0
- GNU Make version 3.81 or 4.0

## Lifecycle

1. Clone the repository
2. Update the environment variables POST_TITLE and POST_NAME, or add them as arguments (see step 4)
3. Run `make build` to generate the website
4. Run `make post POST_TITLE="YOUR_POST_TITLE" POST_NAME="YOUR_POST_NAME"` (or just `make post` if  you already set the variables in step 2) to create a new blog post
5. Run `make clean` if you want to remove all the contents inside the `dist/` directory (the directory where the site will be published)
6. Run `make help` if you want to see more information about the targets
