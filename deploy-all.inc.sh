# env: KEY_NAME: The name of the SSH key.
defineEnvVar KEY_NAME OPTIONAL "The name of the SSH key";
# env: OMIT_CLIENT_IN_STACK_NAME: Whether to omit the client in the stack name.
defineEnvVar OMIT_CLIENT_IN_STACK_NAME MANDATORY "Whether to omit the client in the stack name" ${FALSE};
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
