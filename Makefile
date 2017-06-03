DOCKER_RUN=docker run -d 
DOCKER_BOB=$(DOCKER_RUN) -p 8080:8080 -p 9000:9000 --name=bob --hostname=bob
DOCKER_ALICE=$(DOCKER_RUN) -p 8081:8080 -p 9001:9000 --name=alice --hostname=alice

QRL_DIR=/home/osboxes/Projects/QRL

IMG=qrl/qrl-dev

RUN_DAEMON=python node.py
RUN_SHELL=bash

build-base:
	docker build -t $(IMG) base

bob_rm:
	-docker rm -f bob

bob_shell: bob_rm
	$(DOCKER_BOB) -it -v $(QRL_DIR):$(QRL_DIR) $(IMG) $(RUN_SHELL)

bob_daemon: 
	docker exec bob $(RUN_DAEMON)

alice_rm:
	-docker rm -f alice

alice_shell: alice_rm
	$(DOCKER_ALICE) -it -v $(QRL_DIR):$(QRL_DIR) $(IMG) $(RUN_SHELL)

alice_daemon: 
	docker exec alice $(RUN_DAEMON)

