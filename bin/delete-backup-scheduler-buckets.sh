#!/bin/bash /home/chous/.dry-wit/src/dry-wit
# mod: delete-backup-scheduler-buckets.sh
# api: public
# txt: Deletes Backup-Scheduler S3 buckets.

DW.import aws-s3;
DW.import contestia;

# fun: main
# api: public
# txt: Deletes Backup-Scheduler S3 buckets.
# txt: Returns 0/TRUE always, but can exit if some problem occurs.
# use: main;
function main() {
  local _domainName;
  if getContestiaDomainName "${ENVIRONMENT}" "${PROFILE}"; then
    _domainName="${RESULT}";
  else
    exitWithErrorCode CANNOT_RETRIEVE_CONTESTIA_DOMAIN_NAME;
  fi

  getBucketNames "${ENVIRONMENT}" "${PROFILE}" "${_domainName}";
  local _bucketNames="${RESULT}";
  local _oldIFS="${IFS}";
  local _bucket;
  IFS="${DWIFS}";
  for _bucket in ${_bucketNames}; do
    IFS="${_oldIFS}";
    logInfo -n "Deleting ${_bucket}";
    if deleteS3Bucket "${_bucket}" "${PROFILE}" "${AWS_REGION}"; then
      logInfoResult SUCCESS "done";
    else
      logInfoResult FAILURE "failed";
      logDebug "${ERROR}";
    fi
  done;
  IFS="${_oldIFS}";
}

# fun: getBucketNames environment profile
# api: public
# txt: Retrieves the names of the buckets.
# opt: environment: The environment.
# opt: profile: The AWS profile.
# txt: Returns 0/TRUE always, but can exit if some bucket is not found.
# txt: If the function returns 0/TRUE, the variable RESULT contains the bucket names.
# use: getBucketNames dev dev;
# use: echo "Bucket names: ${RESULT}";
function getBucketNames() {
  local _environment="${1}";
  checkNotEmpty environment "${_environment}" 1;
  local _profile="${2}";
  checkNotEmpty profile "${_profile}" 2;
	local _domainName="${3}";
	checkNotEmpty domainName "${_domainName}" 3;

  local _result="backup-scheduler.${_domainName}";

	export RESULT="${_result}";

  return ${TRUE};
}

# Script metadata
setScriptDescription "Deletes Backup-Scheduler buckets";

addCommandLineParameter environment "The environment of the backup-scheduler-buckets stack" MANDATORY SINGLE;
addCommandLineParameter profile "The AWS profile" MANDATORY SINGLE;

# env: AWS_REGION: The AWS region. Defaults to eu-west-1.
defineEnvVar AWS_REGION MANDATORY "The AWS region" "eu-west-1";

addError CANNOT_RETRIEVE_AWS_CLI "Cannot retrieve AWS CLI";
addError CANNOT_RETRIEVE_CONTESTIA_DOMAIN_NAME "Cannot retrieve Contestia domain name";
addError CANNOT_RETRIEVE_BUCKET_NAME "Cannot retrieve bucket name";
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
