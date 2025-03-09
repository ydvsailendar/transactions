target "backend" {
  context = "."
  dockerfile = "Dockerfile.backend"
  platforms = ["linux/amd64", "linux/arm64"]
}

target "frontend" {
  context = "."
  dockerfile = "Dockerfile.frontend"
  platforms = ["linux/amd64", "linux/arm64"]
}

target "db" {
  context = "."
  dockerfile = "Dockerfile.db"
  platforms = ["linux/amd64", "linux/arm64"]
}

group "transactions" {
  targets = ["backend", "frontend", "db"]
}
