#!/bin/env dry-wit
# Copyright 2018-today Osoco S.L.
# Distributed under the terms of the GNU General Public License v3
# mod: create-all.sh
# api: public
# txt: Creates all stacks, in order.

DW.import aws-deploy;

# fun: main
# api: public
# txt: Creates all stacks, in order.
function main() {
  createAll ${ENVIRONMENT} ${CLIENT};
}

# metadata
setScriptDescription "Creates all stacks, in order";

# cli
addCommandLineParameter environment "The environment" MANDATORY SINGLE;
addCommandLineParameter client "The client" OPTIONAL SINGLE;
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
