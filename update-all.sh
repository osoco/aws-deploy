#!/bin/env dry-wit
# mod: update-all.sh
# api: public
# txt: Updates all stacks, in order.

# fun: main
# api: public
# txt: update all stacks, in order.
function main() {
  $(dirname ${BASH_SOURCE[0]})/deploy-all.sh -v update ${ENVIRONMENT} ${CLIENT};
}

# metadata
setScriptDescription "Update all stacks, in order";

# cli
addCommandLineParameter e environment "The environment" MANDATORY EXPECTS_ARGUMENT;
addCommandLineParameter c client "The client" OPTIONAL EXPECTS_ARGUMENT;
