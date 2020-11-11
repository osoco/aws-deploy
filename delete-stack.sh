#!/bin/bash dry-wit
# Copyright 2017-today Osoco S.L.
# Distributed under the terms of the GNU General Public License v3
# mod: deploy-stack
# api: public
# txt: Deletes a Cloudformation stack for given environment/client combination in AWS.

DW.import aws-deploy;

# fun: main
# api: public
# txt: Deletes a Cloudformation stack for given environment/client combination in AWS.
# txt: Returns 0/TRUE always, but can exit if an error is triggered.
function main() {
  deleteStack "${STACK}" "${ENVIRONMENT}" "${CLIENT}";
}

# script metadata
setScriptDescription "Deletes a Cloudformation stack for given environment/client combination in AWS";
setScriptUrl "https://github.com/osoco/aws-deploy";

addCommandLineParameter environment "The environment where the stack is or will be deployed. For environment-wide settings, define them in a file [environment].config in the root folder" MANDATORY SINGLE;
addCommandLineParameter client "The specific client" OPTIONAL SINGLE;

# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
