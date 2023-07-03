testmo:
	npm install --no-save @testmo/testmo-cli

testmoconfig: testmo
	npx testmo automation:resources:add-field --name git --type string --value $(shell echo $$GITHUB_SHA:0:7) --resources resources.json
	npx testmo automation:resources:add-link --name build --url "$(shell echo $$GITHUB_SERVER_URL)/$(shell echo $$GITHUB_REPOSITORY)/actions/runs/$(shell echo $$GITHUB_RUN_ID)" --resources resources.json


