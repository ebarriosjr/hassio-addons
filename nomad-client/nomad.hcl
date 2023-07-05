data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"
datacenter = "haos"

advertise {
  http = "192.168.1.162:4646"
  rpc = "192.168.1.162:4647"
  serf = "192.168.1.162:4648"
}

server {
  enabled = false 
}

client {
  enabled = true
}

consul {
  address = "192.168.1.51:8500"
  server_service_name = "nomad-server"
  client_service_name = "nomad-client"
}

plugin "docker" {
  config {
    endpoint = "http://192.168.1.162:2375"
  }
}
