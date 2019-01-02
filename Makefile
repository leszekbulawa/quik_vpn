.DEFAULT_GOAL := help

build: ## Build Container
	docker build -t local/terraform_worker -f Dockerfile_tf .

init: ## Terraform init
	docker run --rm -v ${PWD}/terraform:/terraform -e AWS_REGION=$(AWS_REGION) local/terraform_worker init

plan: ## Terraform plan
	docker run --rm -v ${PWD}/terraform:/terraform -e AWS_REGION=$(AWS_REGION) local/terraform_worker plan

aws: ## Run quik_vpn with aws provider
	docker run --rm -v ${PWD}/terraform:/terraform -e AWS_REGION=$(AWS_REGION) local/terraform_worker apply


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'8
