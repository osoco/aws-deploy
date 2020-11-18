source $(dirname ${BASH_SOURCE[0]})/aws-deploy-all.inc.sh;

addCommandLineFlag stack s "The name of the stack. It should be the name of a folder, containing [stack].json and optionally [stack].config and [environment].config" MANDATORY EXPECTS_ARGUMENT;
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
