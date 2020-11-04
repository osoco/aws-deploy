#!/bin/bash

for e in staging; do
  export S="${e}.";
  if [[ "${e}" == "production" ]]; then
    S="";
  fi;
  for a in bo core evaapp; do
    for t in assets attachments mail-assets mail-templates; do
      ./delete-specific-bucket.sh -v nexplore-contestia-${e} ${t}.${a}.${S}contestia.contestia-nexplore.com;
    done;
  done;
  ./delete-specific-bucket.sh -v nexplore-contestia-${e} \
                              backup-scheduler.${S}contestia.contestia-nexplore.com \
                              config.${S}contestia.contestia-nexplore.com \
                              convert-contest.${S}contestia.contestia-nexplore.com \
                              docs.${S}contestia.contestia-nexplore.com \
                              form.${S}contestia.contestia-nexplore.com \
                              code.${S}contestia.contestia-nexplore.com \
                              accesslogs.${S}contestia.contestia-nexplore.com;
done
