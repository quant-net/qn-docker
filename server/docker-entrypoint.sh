#!/bin/sh
# vim:sw=4:ts=4:et

set -e

entrypoint_log() {
    if [ -z "${QUANTNET_ENTRYPOINT_QUIET_LOGS:-}" ]; then
        echo "$@"
    fi
}

if [ -n "${QUANTNET_ENTRYPOINT_DROP_ALL_DB:-}" ]; then
	entrypoint_log "$0: Waiting 10 seconds for db completing initialization..."
	sleep 10
	
	entrypoint_log "$0: Starting bootstrap..."
	python ${QUANTNET_HOME}/tools/bootstrap.py
	entrypoint_log "$0: Done with bootstrap.\n"
fi

exec "$@"
