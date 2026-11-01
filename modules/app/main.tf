terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "this" {
  name         = var.image
  keep_locally = true
}

resource "docker_container" "this" {
  name    = "${var.env}-python-health-app"
  image   = docker_image.this.image_id
  memory  = var.memory_mb
  restart = "unless-stopped"

  ports {
    internal = var.container_port
    external = var.host_port
    ip       = "127.0.0.1"
  }
}