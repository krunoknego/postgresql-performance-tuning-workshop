# Colors
GREEN  := $(shell tput -Txterm setaf 2)
WHITE  := $(shell tput -Txterm setaf 7)
YELLOW := $(shell tput -Txterm setaf 3)
RED    := $(shell tput -Txterm setaf 5)
RESET  := $(shell tput -Txterm sgr0)

default: help

start: ##@setup start containers
	docker compose up -d
.PHONY: start

down: ##@setup remove containers
	docker compose down
.PHONY: down

stop: ##@setup stop containers
	docker compose stop
.PHONY: stop

cli: ##@setup run cli
	@echo "Execute 'psql -d testdb -U testuser'"
	@echo "Password: testpassword"
	docker compose exec -it db bash
.PHONY: cli

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
# A category can be added with @category
HELP_FUN = \
        %help; \
        while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
        print "usage: make [target]\n\n"; \
        for (sort keys %help) { \
        print "${WHITE}$$_:${RESET}\n"; \
        for (@{$$help{$$_}}) { \
        $$sep = " " x (32 - length $$_->[0]); \
        print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
        }; \
        print "\n"; }

help: ##@other Show this help
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)
.PHONY: help
