output "email" {
  value = data.digitalocean_account.objDoAcct.email
}
output "droplet_limit" {
  value = data.digitalocean_account.objDoAcct.droplet_limit
}
output "server_ip_jitsi" {
  value = module.jitsi.server_ip
}
