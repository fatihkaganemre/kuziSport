SHELL := /bin/bash

sourcery: ## Meta - code generator
	@bundle exec Pods/Sourcery/bin/sourcery --sources Karate/ --templates SourceryTemplates/AutoMockable.stencil --output KarateTests/Dependencies/AutoMockable.generated.swift --disableCache
	

help:  ## This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help