data_dir = "/etc/nomad/data"
bind_addr = "{{ .bind_addr }}"
datacenter = "{{ .datacenter_name }}"

advertise {
  http = "{{ .interface }}:{{ .port }}"
  rpc = "{{ .interface }}:4647"
  serf = "{{ .interface }}:4648"
}

server {
  enabled = false
}

client {
  enabled = true
}

consul {
  address = "{{ .consul_addr }}:{{ .consul_port }}"
  server_service_name = "nomad-server"
  client_service_name = "nomad-client"
}

