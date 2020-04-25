provider digitalocean {
  token = var.strDoToken
}

//  Shared Resource
//  Create a new ssh key
resource "digitalocean_ssh_key" "objSshKey" {
  name       = "digitalocean ssh key"
  public_key = file(format("%s%s", var.strSshPath, var.strSshId))
}

//
//  Modules
module jitsi {
  //
  //  Override in variables.tf file in modules folder
  //    strDoProject
  //    strDoImage
  //    strDoSize
  //
  source = "./modules/jitsi/"
  //
  //  Use default variables.tf in root folder
  //
  objSshKey   = [digitalocean_ssh_key.objSshKey.fingerprint]
  strSshPath  = var.strSshPath
  strSshPte   = var.strSshPte
  strRootPath = var.strRootPath
  strDoDomain = var.strDoDomain
  strDoRegion = var.strDoRegion
}

//  Get Account
//
data "digitalocean_account" "objDoAcct" {}
