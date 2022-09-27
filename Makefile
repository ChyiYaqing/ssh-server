.PHONY: build clean

NAMESPACE ?= $(shell bash -c 'read -p "Namespace: " namespace; echo $$namespace')
export SSH_SERVER_VERSION=v0.1.2

BUILD_IMAGE_PATH=ssh-server

help:
	@echo ''
	@echo 'You can use this image to running in Docker or kubernetes'
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>...\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m  %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


##@ Build image
# build ssh-server image for jump server
build_image: ## Build ssh-server image
	cat ~/.ssh/id_rsa.pub | cat > ${BUILD_IMAGE_PATH}/authorized_keys
	docker build -f ${BUILD_IMAGE_PATH}/Dockerfile -t chyiyaqing/ssh-server:${SSH_SERVER_VERSION} ${BUILD_IMAGE_PATH}

#publish ssh-server image for jump server
publish_image: build_image ## Push ssh-server image to docker hub
	docker push chyiyaqing/ssh-server:${SSH_SERVER_VERSION}

##@ Kubectl
# kubectl apply


##@ Helm
# helm install ssh-server charts
helm_install: ## helm install ssh-server charts
	@(./script/install_ssh_server.sh $(NAMESPACE) "install")

# helm convert to yaml template 
helm_template: ## helm template ssh-server charts to yaml
	@(./script/install_ssh_server.sh $(NAMESPACE) "template")

# helm delete ssh-server charts
helm_delete: ## helm delete ssh-server charts
	@(./script/delete_ssh_server.sh $(NAMESPACE))
