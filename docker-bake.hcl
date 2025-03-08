variable "REGISTRY" {
  default = "ghcr.io"
}

variable "GITHUB_REPOSITORY" {
  default = ""
}

variable "TAG" {
  default = "latest"
}

# Common metadata for all images
target "metadata" {
  labels = {
    "org.opencontainers.image.source" = "https://github.com/${GITHUB_REPOSITORY}"
    "org.opencontainers.image.licenses" = "MIT"
  }
}

target "backend" {
  inherits = ["metadata"]
  context = "."
  dockerfile = "Dockerfile.backend"
  tags = ["${REGISTRY}/${GITHUB_REPOSITORY}/backend:${TAG}"]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "frontend" {
  inherits = ["metadata"]
  context = "."
  dockerfile = "Dockerfile.frontend"
  tags = ["${REGISTRY}/${GITHUB_REPOSITORY}/frontend:${TAG}"]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "db" {
  inherits = ["metadata"]
  context = "."
  dockerfile = "Dockerfile.db"
  tags = ["${REGISTRY}/${GITHUB_REPOSITORY}/db:${TAG}"]
  platforms = ["linux/amd64", "linux/arm64"]
}

group "default" {
  targets = ["backend", "frontend", "db"]
} 