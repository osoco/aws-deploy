#!/bin/env dry-wit
# Copyright 2017-today Osoco S.L.
# Distributed under the terms of the GNU General Public License v3
# mod: create-stack
# api: public
# txt: Creates a Cloudformation stack for given environment/client combination in AWS.

DW.import aws-deploy;

# fun: main
# api: public
# txt: Creates a Cloudformation stack for given environment/client combination in AWS.
# txt: Returns 0/TRUE always, but can exit if an error is triggered.
# use: main;
function main() {
  createOrUpdateStack "${STACK}" create "${ENVIRONMENT}" ${TRUE} "${CLIENT}";
}

# script metadata
setScriptDescription "Creates a Cloudformation stack for given environment/client combination in AWS";
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
