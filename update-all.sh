#!/bin/env dry-wit
# mod: update-all.sh
# api: public
# txt: Updates all stacks, in order.

DW.import aws-deploy;

# fun: main
# api: public
# txt: updates all stacks, in order.
function main() {
  deployAll;
}

# metadata
setScriptDescription "Updates all stacks, in order";

# cli
addCommandLineParameter environment "The environment" MANDATORY SINGLE;
addCommandLineParameter client "The client" OPTIONAL SINGLE;
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
