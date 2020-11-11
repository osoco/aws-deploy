#!/bin/bash dry-wit
# Copyright 2018-today Osoco S.L.
# Distributed under the terms of the GNU General Public License v3
# mod: delete-all.sh
# api: public
# txt: Manages the deletion of all stacks as a whole.

DW.import aws-deploy;

# fun: main
# api: public
# txt: Manages the deletion of all stacks as a whole.
# txt: Returns 0/TRUE always. In case of error, it exits.
# use: main;
function main() {
  deleteAll;
}

# script metadata
setScriptDescription "Manages the deletion of all stacks as a whole";
setScriptUrl "https://github.com/osoco/aws-deploy";

addCommandLineParameter environment "The environment where the stack is or will be deployed. For environment-wide settings, define them in a file [environment].config in the root folder" MANDATORY SINGLE;
addCommandLineParameter client "The specific client" OPTIONAL SINGLE;

# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
