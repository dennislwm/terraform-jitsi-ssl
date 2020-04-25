# terraform-jitsi-ssl
[Terraform](https://terraform.io) starter project for a self-hosted [Jitsi Video Server](https://jitsi.org).

---
### About terraform-jitsi-ssl

[Jitsi Meet](https://jitsi.org/) is a secured, fully featured, and completely free video conferencing.

Jitsi isn't just for video conferencing. It also has room chat, virtual hand raise, screen sharing and streaming a YouTube video. Using your own Jitsi server, you don't have to be tied down to any free public servers, which may laggy or not available 24/7, or to be dependent on premium servers, which may be expensive. And if you're a serious user, you can create a scalable, optimized video conferencing server, or even a frontend graphical user interface to wrap around your server.

**terraform-jitsi-ssl** was a personal project to:
- automate SSH key upload
- automate droplet creation in a remote server
- automate provision in a remote server

---
### Automate SSH Key Upload

The main resource file, main.tf, has a shared resource objSshKey.

The SSH token string is stored in the root terraform.tfvars file (add to .gitignore).

---
### Automate Droplet Creation in a Remote Server

The main resource file, main.tf, has a declaration for each module, e.g. jitsi.

In each module folder, a resource file declares a droplet and a project.

In each module folder, a variable file overrides the default root variable file.

For example, changing the default value of strDoImage to "opentradestatist-jitsiserver-18-04".

---
### Automate Provision in a Remote Server

In each module, we perform the following in Terraform via a SSH connection:

- provision for creating remote folders.

- provision for copying local data files to a remote server.

- provision for making a swapfile in a remote server.

- provision for executing a docker-compose command in a remote server.

- return the server IP address at completion.

---
### Project Structure
     terraform-jitsi-ssl/             <-- Root of your project
       |- package.json                <-- Node.js project entries
       |- README.md                   <-- This README markdown file
       +- bin/                        <-- Holds any executable files
          |- mkswap.sh                <-- Creates a swapfile in a Bash terminal for production
       +- config/                     <-- Holds any configuration files
          |- ssh.conf                 <-- SSH configuration file
       +- tf/                         <-- Terraform root folder
          |- main.tf                  <-- Main TF file (required)
          |- variables.tf             <-- Default variables declaration file for root
          |- outputs.tf               <-- Default outputs declaration file for root
          |- terraform.tfvars         <-- Secret variables declaration file for tokens (.gitignore)
          +- modules/                 <-- Nested modules
             +- jitsi/                <-- Holds any TF files for Jitsi
                |- jitsi.tf           <-- Resources TF file
                |- variables.tf       <-- Overrides inputs of variables.tf file in root
                |- outputs.tf         <-- Returns outputs in module to main.tf file in root

---
## Prerequisite

* Custom domain name, e.g. markit.work

* [DigitalOcean](https://bit.ly/dbaff001) account

* SSH Keygen

* [Terraform](https://terraform.io)

## Example Usage

Clone this repository to your folder _myproject_:

     $ git clone https://github.com/dennislwm/terraform-jitsi-ssl myproject

## Infrastructure as Code

### Configuration

1. In the **root** folder, edit the _variables.tf_ file and change the default values for:
* **strSshPath** - path to local SSH folder, e.g. "c:\\\\users\\\\dennislwm\\\\.ssh\\\\"
* **strSshId** - name of local SSH public_key .pub file, e.g. "id_rsa.pub"
* **strRootPath** - path to this project root folder, e.g. "c:\\\\users\\\\dennislwm\\\\terraform-jitsi-ssl\\\\"
* **strDoDomain** - name of custom domain, e.g. "markit.work"
2. Create a _terraform.tfvars_ file and add the following (remember to replace "token" with your DigitalOcean API access token string):

     strDoToken = "token"

**Warning**: Keep your _terraform.tfvars_ file (add to _.gitignore_) a secret to prevent unauthorized access to your DigitalOcean account.

### DigitalOcean

Browse lists of images, regions, and sizes for DigitalOcean:

URL: https://slugs.do-api.dev/

### Initialize Terraform Nested Modules

In the Terraform **root** folder, type the following command in your terminal:

     $ terraform init

---

### Create a Terraform Plan

Type the following command in your terminal:

     $ terraform plan

---

### Execute a Terraform Plan

Type the following command in your terminal:

     $ terraform apply

Before typing 'yes', ensure that ALL resources Terraform will create and **destroy** are correct.

---

### Destroy a Terraform Plan

Type the following command in your terminal:

     $ terraform destroy

Before typing 'yes', ensure that ALL resources Terraform will **destroy** are correct.

Note: Add optional parameter "-target=module.mymodule" to destroy a given module, eg. "terraform destroy -target=module.jitsi"

---

### Reach Out!
Please consider giving this repository a star on GitHub.

Alternatively, leave a comment on the tutorial How to Deploy Your Secure Video Conference Server in 4 GIF Steps.
