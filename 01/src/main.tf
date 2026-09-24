terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  required_version = "~>1.16.0" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  context = "docker-yandex"  
}
#однострочный комментарий

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "random_string1" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}
resource "docker_image" "mysql8" {
  name         = "mysql:8"
}

resource "docker_container" "mysql_container" {
  image = docker_image.mysql8.image_id
  name  = "database"

  ports {
    internal = 3306
    external = 3306
    ip = "127.0.0.1"
  }
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.random_string.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.random_string1.result}",
    "MYSQL_ROOT_HOST=%"
  ]

}