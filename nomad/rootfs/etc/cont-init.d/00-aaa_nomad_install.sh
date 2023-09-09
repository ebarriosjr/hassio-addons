#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
if [ -e "/NOMADFILE" ]; then
    echo "Installing nomad..."
    BUILD_UPSTREAM=$(</NOMADFILE)
    BUILD_ARCH=$(uname -m)

    echo "${BUILD_ARCH}"
    BUILD_ARCH=${BUILD_ARCH:-x86}

    if [[ "${BUILD_ARCH}" == *x86* ]]; then ARCH="amd64"; fi

    echo "... success!"
fi
    bashio::log.blue " Success "
    bashio::log.blue " Nomad addr: $(bashio::config 'nomad_addr')"
    bashio::log.blue " Nomad server: $(bashio::config 'nomad_server')"
    bashio::log.blue " Datacenter Name: $(bashio::config 'datacenter_name')"
    bashio::log.blue " Bind Addr: $(bashio::config 'bind_addr')"
