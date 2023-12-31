#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

#################
# NOMAD SETTING #
#################

#declare admin_port
declare nomad_protocol=http

bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    protocol "${nomad_protocol}" \
    nomad_addr "$(bashio::config 'nomad_addr')" \
    nomad_server "$(bashio::config 'nomad_server')" \
    bind_addr "$(bashio::config 'bind_addr')" \
    datacenter_name "$(bashio::config 'datacenter_name')" |
tempio \
    -template /etc/nomad.d/templates/nomad.gtpl \
    -out /etc/nomad.d/nomad.hcl
