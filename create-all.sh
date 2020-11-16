#!/bin/env dry-wit
# mod: create-all.sh
# api: public
# txt: Creates all stacks, in order.

# fun: main
# api: public
# txt: Creates all stacks, in order.
function main() {
  $(dirname ${BASH_SOURCE[0]})/deploy-all.sh -v create ${ENVIRONMENT} ${CLIENT};
}

# metadata
setScriptDescription "Creates all stacks, in order";

# cli
addCommandLineParameter e environment "The environment" MANDATORY EXPECTS_ARGUMENT;
addCommandLineParameter c client "The client" OPTIONAL EXPECTS_ARGUMENT;
