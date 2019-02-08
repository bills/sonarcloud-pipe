#!/bin/bash

source "$(dirname "$0")/common.sh"

parse_environment_variables() {
  EXTRA_ARGS=${EXTRA_ARGS:=""}
  SONAR_TOKEN=${SONAR_TOKEN:?'SONAR_TOKEN environment variable missing.'}
  BITBUCKET_CLONE_DIR=${BITBUCKET_CLONE_DIR:?'BITBUCKET_CLONE_DIR environment variable missing.'}
}

parse_environment_variables

OUTPUT_FILE="${BITBUCKET_CLONE_DIR}/sonarcloud-scan.log"
IFS=$'\n' ALL_ARGS=( $(xargs -n1 <<<"${EXTRA_ARGS}") )

if [[ "${DEBUG}" == "true" ]]; then
    ALL_ARGS+=( "-Dsonar.verbose=true" )
    debug "SONAR_SCANNER_OPTS: ${SONAR_SCANNER_OPTS}"
    debug "EXTRA_ARGS: ${EXTRA_ARGS}"
    debug "Final analysis parameters:\n${ALL_ARGS[@]}"
fi

(sonar-scanner "${ALL_ARGS[@]}" $2>&1 | tee ${OUTPUT_FILE}) || true

if grep -q "EXECUTION SUCCESS" ${OUTPUT_FILE}
then
  success "SonarCloud analysis was successful."
else
  fail "SonarCloud analysis failed."
fi
