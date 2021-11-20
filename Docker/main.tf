# Docker Provider
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.15.0"
    }
    }
  }
}

# Specify the Docker Host
provider "docker" {
    host = "unix:///var/run/docker.sock"
    #host = "ssh://user@remote-host:22"
    #host = "tcp://127.0.0.1:2376"
}

# Download Latest Centos Image
resource "docker_image" "mynginx" {
    name = "nginx"
}

#Start an nginx contianer
resource "docker_container" "nginx_container" {
    name = "mynginx"
    image = docker_image.mynginx.latest
    ports {
        internal = "80"
        external = "80"
    }
}

/* Some commands to execute
Terraform Workflow
$ terraform init
$ terraform validate
$ terraform plan
  + resource creation
  - resource deletion
  +/- resource recreation
$ terraform apply
$ terraform apply --auto-approve
$ terraform show
$ terraform destroy
$ terraform plan
$ terraform apply --auto-approve
*/