# hashicorp_vault_config_template

[Back to resource list](../README.md#resources)

Creates a vault agent template HCL configuration stanza (<https://www.vaultproject.io/docs/agent/template>)

Introduced: v5.0.0

## Actions

- `:create`
- `:delete`

## Properties

| Name                   | Type          | Default                          | Description                                                         |
| ---------------------- | ------------- | -------------------------------- | ------------------------------------------------------------------- |
| `owner`                | String        | `vault`                          | Owner of the generated configuration file                           |
| `group`                | String        | `vault`                          | Group of the generated configuration file                           |
| `mode`                 | String        | `'0640'`                         | Filemode of the generated configuration file                        |
| `config_file`          | String        | `/etc/vault.d/vault.hcl`         | Configuration file to generate stanza in                            |
| `cookbook`             | String        | `hashicorp-vault`                | Cookbook to source configuration file template from                 |
| `template`             | String        | `hcl.erb`                        | Template to use to generate the configuration file                  |
| `sensitive`            | True, False   | `true`                           | Set template to sensitive by default                                |
| `type`                 | String, Symbol| `new_resource.name`              | Configuration stanza type                                           |
| `options`              | Hash          | `{}`                             | Options for the configuration stanza                                |

## Examples

```ruby
hashicorp_vault_config_template '/etc/vault/server.key' do
  options(
    'source' => '/etc/vault/server.key.ctmpl',
    'destination' => '/etc/vault/server.key'
  )
end

hashicorp_vault_config_template '/etc/vault/server.crt' do
  options(
    'source' => '/etc/vault/server.crt.ctmpl',
    'destination' => '/etc/vault/server.crt'
  )
end
```
