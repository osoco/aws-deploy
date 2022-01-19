# Script metadata
setScriptUrl "https://github.com/osoco/aws-deploy";

# CLI
addCommandLineFlag environment e "The environment where the stack is or will be deployed. For environment-wide settings, define them in a file [environment].config in the root folder" MANDATORY EXPECTS_ARGUMENT;
addCommandLineFlag client c "The specific client" OPTIONAL EXPECTS_ARGUMENT;
addCommandLineFlag profile p "The AWS profile" MANDATORY EXPECTS_ARGUMENT;
addCommandLineFlag region r "The AWS region" OPTIONAL EXPECTS_ARGUMENT "eu-west-1";
addCommandLineFlag continue C "Continue in case of error" OPTIONAL NO_ARGUMENT;

# fun: dw_check_stack_cli_flag
# api: public
# txt: Callback for checking the stack flag.
# txt: Returns 0/TRUE always, but can exit if the stack folder does not exist.
# use: dw_check_stack_cli_flag "${flag}";
function dw_check_stack_cli_flag() {
  export STACK="${1}";
  DW.getScriptFolder;
  local _rootFolder="${RESULT}";
  if ! folderExists "${_rootFolder}/${STACK}"; then
    exitWithErrorCode STACK_FOLDER_DOES_NOT_EXIST "${_rootFolder}/${STACK}";
  fi
}

# fun: dw_parse_continue_cli_flag
# api: public
# txt: Callback for parsing the continue flag.
# txt: Returns 0/TRUE always.
# use: dw_parse_continue_cli_flag "${flag}";
function dw_parse_continue_cli_flag() {
  export CONTINUE=${TRUE};
}

# Requirements
checkReq aws AWS_NOT_INSTALLED;
checkReq jq JQ_NOT_INSTALLED;

# env: FALLBACK_AWS_REGION: The AWS region used as fallback to retrieve CloudFormation exports.
defineEnvVar FALLBACK_AWS_REGION MANDATORY "The AWS region used as fallback to retrieve CloudFormation exports." "eu-west-1";

# env: KEY_NAME: The name of the SSH key.
defineEnvVar KEY_NAME OPTIONAL "The name of the SSH key";

# env: OMIT_CLIENT_IN_STACK_NAME: Whether to omit the client in the stack name.
defineEnvVar OMIT_CLIENT_IN_STACK_NAME MANDATORY "Whether to omit the client in the stack name" ${TRUE};

# env: OMIT_CONTESTIA_IN_STACK_NAME: Whether to omit the contestia word in the stack name.
defineEnvVar OMIT_CONTESTIA_IN_STACK_NAME MANDATORY "Whether to omit the contestia word in the stack name" ${FALSE};
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
# env: DEV_NEXPLORE_AWS_PROFILE: The AWS profile for nexplore / dev.
defineEnvVar DEV_NEXPLORE_AWS_PROFILE MANDATORY "The AWS profile for nexplore / dev" "nexplore-contestia-dev";
# env: DEV_NEXPLORE_AWS_REGION: The AWS region for nexplore / dev.
defineEnvVar DEV_NEXPLORE_AWS_REGION MANDATORY  "The AWS region for nexplore / dev" "eu-west-1";
# env: KEY_NAME: The name of the SSH key.
overrideEnvVar KEY_NAME "nexplore-contestia-dev";
# env: OMIT_TENANT_IN_STACK_NAME: Whether to omit the tenant when creating stack names.
overrideEnvVar OMIT_CLIENT_IN_STACK_NAME ${TRUE};
# env: OMIT_CONTESTIA_IN_STACK_NAME: Whether to omit the "contestia" part in stack names.
overrideEnvVar OMIT_CONTESTIA_IN_STACK_NAME ${FALSE};
# env: OMIT_STACKS: A comma-separated list of stacks to omit.
overrideEnvVar OMIT_STACKS "backoffice-evaapp-cluster,cluster,core-cluster,s3uploader-cluster,backoffice-cluster,evaapp-cluster";
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
