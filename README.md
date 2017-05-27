## ABOUT

Setup a QRL development environment using Docker

## CONFIG

You will need to clone the Git repositories for the QRL codebase and this repo:

I keep all my code under ~/Projects:
```
cd ~
mkdir Projects
cd Projects
git clone https://github.com/theQRL/QRL.git
git clone https://github.com/ianco/QRL-dev.git
```
Now cd into the QRL-dev directory and create the Docker image:

## USAGE

```
## Run make to build the Docker image (see Dockerfile for all the dependencies)
make build-base
docker images
```
Run the "bob" image and run the QRL node:
```
## build and run "bob" container
make bob_shell
make bob_daemon
docker ps
```







