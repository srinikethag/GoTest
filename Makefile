GOTESTSUM_JUNITFILE ?= tests_results.xml

install-testmo:
	npm install --no-save @testmo/testmo-cli

testmo-send-config:
	npx testmo automation:resources:add-field --name git --type string --value $(shell echo $$GITHUB_SHA:0:7) --resources resources.json
	npx testmo automation:resources:add-link --name build --url "$(shell echo $$GITHUB_SERVER_URL)/$(shell echo $$GITHUB_REPOSITORY)/actions/runs/$(shell echo $$GITHUB_RUN_ID)" --resources resources.json

testmo-run-%:
	npx testmo automation:run:submit --instance "https://toggl.testmo.net/" --project-id 1 --tags go --name "$*" --source "backend" --results $(GOTESTSUM_JUNITFILE)
