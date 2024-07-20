source "docker" "docker-image-ubuntu" {
  image = "ubuntu"
  export_path = "image.tar"
}

build {
  sources = ["source.docker.docker-image-ubuntu"]
}
