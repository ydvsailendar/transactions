target "docker-metadata-action" {}

target "backend" {
  context = "."
  dockerfile = "Dockerfile.backend"
  inherits = ["docker-metadata-action"]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "frontend" {
  context = "."
  dockerfile = "Dockerfile.frontend"
  inherits = ["docker-metadata-action"]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "db" {
  context = "."
  dockerfile = "Dockerfile.db"
  inherits = ["docker-metadata-action"]
  platforms = ["linux/amd64", "linux/arm64"]
}

group "transactions" {
  targets = ["backend", "frontend", "db"]
}
