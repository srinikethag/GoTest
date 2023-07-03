testmo:
	npm install --no-save @testmo/testmo-cli

testmoconfig: testmo
	npx testmo automation:resources:add-field --name git --type string --value $(GITHUB_SHA:0:7) --resources resources.json
    npx testmo automation:resources:add-link --name build --url "$(GITHUB_SERVER_URL)/$(GITHUB_REPOSITORY)/actions/runs/$(GITHUB_RUN_ID)" --resources resources.json


