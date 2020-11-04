#!/bin/bash /home/chous/.dry-wit/src/dry-wit
# mod: delete-specific-bucket.sh
# api: public
# txt: Deletes given buckets.

DW.import aws-s3;

# fun: main
# api: public
# txt: Deletes given buckets.
# txt: Returns 0/TRUE always, but can exit if some problem occurs.
# use: main;
function main() {
  local _oldIFS="${IFS}";
  local _bucket;
  IFS="${DWIFS}";
  for _bucket in ${BUCKETS}; do
    IFS="${_oldIFS}";
    logInfo -n "Emptying bucket ${_bucket}";
    if emptyS3Bucket "${_bucket}" "${PROFILE}"; then
      logInfoResult SUCCESS "done";
    else
      logInfoResult FAILURE "failed";
    fi
    logInfo -n "Deleting bucket ${_bucket}";
    if deleteS3Bucket "${_bucket}" "${PROFILE}"; then
      logInfoResult SUCCESS "done";
    else
      logInfoResult FAILURE "failed";
    fi
  done;
  IFS="${_oldIFS}";
}

setScriptDescription "Deletes given buckets.";

addCommandLineParameter profile "The AWS profile" MANDATORY SINGLE;
addCommandLineParameter buckets "The buckets to delete" MANDATORY MULTIPLE;
# vim: syntax=sh ts=2 sw=2 sts=4 sr noet
