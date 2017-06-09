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

To telnet to the daemon do the following:

```
docker exec -it bob bash
telnet localhost 2000
```

Cleanup bob before running multiple notes under compose:

```
## remove the "bob" container
make bob_rm
docker ps
```

Now run 5 nodes under docker-compose.  Note that you need to:

- Startup the nodes
- Get the IP and wallet info for each node
- Update this info to the QRL Python code
- Re-start the nodes

The nodes each require a separate sub-directory for the code, wallet and chain files:

```
## setup the directories and startup the nodes
./mkdirs.sh
./cpcode.sh
docker-compose up -d
```

Now query each node to get the IP and wallet info:

```
## get the IP:
docker inspect bob
## get the wallet address
cat bob/qrl.log
```

... repeat the above for alice, charlie, donald and eve.

Now, in chain.py, update the peer IP address to be bob's IP, and add everyone's wallet address to the genesis block.

```
## TBD
```

Shutdown the nodes, cleanup the directories, and re-start the nodes again:

```
## shutdown nodes
docker-compose down
## cleanup directories
./rmchains.sh
./cleandirs.sh
## copy new code
./cpcode.sh
## re-start nodes
docker-compose up -d
```

Profit!!!

Note that you can ssh to each docker image, and then telnet to the node, as follows:

```
docker exec -it bob bash  # or alice, charlie, donald, eve
telnet localhost 2000
```

... etc ...


