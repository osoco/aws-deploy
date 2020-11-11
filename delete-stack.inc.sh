# Script metadata
setScriptDescription "Deletes a CloudFormation stack in AWS";

addCommandLineParameter stack "The name of the stack. It should be the name of a folder, containing [stack].json and optionally [stack].config and [environment].config" MANDATORY SINGLE;
addCommandLineParameter environment "The environment where the stack is or will be deployed. For environment-wide settings, define them in a file [environment].config in the root folder" MANDATORY SINGLE;
addCommandLineParameter tenant "The specific tenant" OPTIONAL SINGLE;

checkReq aws AWS_NOT_INSTALLED;
checkReq jq JQ_NOT_INSTALLED;

function dw_check_stack_cli_parameter() {
  export STACK="${1}";
  if ! folderExists "${STACK}"; then
    exitWithErrorCode STACK_FOLDER_DOES_NOT_EXIST;
  fi
}

# env: KEY_NAME: The name of the SSH key.
defineEnvVar KEY_NAME OPTIONAL "The name of the SSH key";
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
