SHELL=/bin/bash

install-python:
	apt install -y python3 python3-pip python3-venv rsync sshpass

env:
	@echo -e "${Blue}==> Setup local environment${Color_Off}"

	@[ -d "${PWD}/.direnv" ] || (echo "Venv not found: ${PWD}/.direnv" && exit 1)
	@pip3 install -U pip wheel setuptools --no-cache-dir && \
	echo "[  OK  ] PIP + WHEEL + SETUPTOOLS" || \
	echo "[FAILED] PIP + WHEEL + SETUPTOOLS"

	@pip3 install -U --no-cache-dir -r "${PWD}/requirements.txt" && \
	echo "[  OK  ] PIP REQUIREMENTS" || \
	echo "[FAILED] PIP REQUIREMENTS"

	@ansible-galaxy install -fr ${PWD}/requirements.yml && \
	echo "[  OK  ] ANSIBLE-GALAXY REQUIREMENTS" || \
	echo "[FAILED] ANSIBLE-GALAXY REQUIREMENTS"

.PHONY: header
header:
	@	echo "**************************** SYSTEM BASE MAKEFILE ******************************"
	@	echo "HOSTNAME	`uname -n`"
	@	echo "KERNEL RELEASE `uname -r`"
	@	echo "KERNEL VERSION `uname -v`"
	@	echo "PROCESSOR	`uname -m`"
	@	echo "********************************************************************************"

##
## —————————————— Testing ——————————————————————————————————————————————————————————————————————
##
.PHONY: test-vbox-cluster
test-vbox-cluster: 
	@ echo -e "${Blue}==> Testing k8s role execution in vbox environment${Color_Off}"
	@ ansible-playbook -i ${VBOX_CLUSTER_TESTING_DIR}/hosts ${VBOX_CLUSTER_TESTING_DIR}/tests.yml

.PHONY: test-vbox-single-node
test-vbox-single-node: 
	@ echo -e "${Blue}==> Testing k8s role execution in vbox environment${Color_Off}"
	@ ansible-playbook -i ${VBOX_SINGLE_NODE_TESTING_DIR}/hosts ${VBOX_SINGLE_NODE_TESTING_DIR}/tests.yml
