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
    bashio::log.blue " Variables: "
    bashio::log.blue " Consul addr: $(bashio::config 'consul_addr')"
    bashio::log.blue " Consul port: $(bashio::config 'consul_port')"
    bashio::log.blue " Datacenter Name: $(bashio::config 'datacenter_name')"
    bashio::log.blue " Bind Addr: $(bashio::config 'bind_addr')"
