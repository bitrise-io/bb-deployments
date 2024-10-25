#!/usr/bin/env bash
set -eu

worker_hardlinking="worker-hardlinking-ubuntu22-04"

setup () {
    set -x

    rm -rf volumes/bb "volumes/${worker_hardlinking}"

    mkdir -p volumes
    mkdir -m 0777 "volumes/${worker_hardlinking}" "volumes/${worker_hardlinking}"/{build,cas,cas/persistent_state}
    mkdir -m 0700 "volumes/${worker_hardlinking}/cache"
    mkdir -p volumes/storage-{ac,cas}-{0,1}/persistent_state
    chmod 0700 volumes/storage-{ac,cas}-{0,1}/{,persistent_state}
}

setup
docker compose up "$@"
