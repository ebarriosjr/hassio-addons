data_dir = "/data/nomad/data"
bind_addr = "{{ .bind_addr }}"
datacenter = "{{ .datacenter_name }}"

advertise {
  http = "{{ .nomad_addr }}:4646"
  rpc = "{{ .nomad_addr }}:4647"
  serf = "{{ .nomad_addr }}:4648"
}

server {
  enabled = true
  bootstrap_expect = 1
}

client {
  enabled = true
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

plugin "docker" {
  config {
    volumes {
      enabled = true
    }
    allow_privileged = true
  }
}

ui {
  enabled=true
  label {
    text = "Home Cluster"
    background_color = "black"
    text_color = "white"
  }
}


