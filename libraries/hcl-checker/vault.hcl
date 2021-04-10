#
# Generated by Chef for dokken
# Do NOT modify this file by hand, changes will be overwritten.
#

# global
pid_file = "./pidfile"

# auto_auth
auto_auth {
  method "aws" {
    mount_path = "auth/aws-subaccount"
    config = {
      type = "iam"
      role = "foobar"
    }
  }

  sink "file" {
    config = {
      path = "/tmp/file-foo"
    }
  }

  sink "file" {
    wrap_ttl = "5m"
    aad_env_var = "TEST_AAD_ENV"
    dh_type = "curve25519"
    dh_path = "/tmp/file-foo-dhpath2"
    config = {
      path = "/tmp/file-bar"
    }
  }
}

# cache
cache {
  use_auto_auth_token = true
}

# listener
listener "unix" {
  address = "/tmp/vault_agent_unix.sock"
  tls_disable = true
}

listener "tcp" {
  address = "127.0.0.1:8100"
  tls_disable = true
}

# template
template {
  source = "/etc/vault/server.key.ctmpl"
  destination = "/etc/vault/server.key"
}

template {
  source = "/etc/vault/server.crt.ctmpl"
  destination = "/etc/vault/server.crt"
}

# vault
vault {
  address = "https://127.0.0.1:8200"
}
