# transactions

## Components

1. DB with postgres image
2. Frontend in HTML/CSS with nginx image
3. Backend with express node image

## Local Testing of the App

```bash
docker compose up -d  --build --remove-orphans
```

## Local Image Build

```bash
# because bake can read config from docker compose as well hence providing the file name explicitly
docker buildx bake --file docker-bake.hcl transactions
```

## Env

- The .env.example can be used as a ref for env variables

### Versioning

- The version is managed by package.json version and tags are created by the github actions

### Build and Deploy

- metadata action for generating metadata like annotations, tags and labels for the image
- buildx setup action is used to setup bake required build
- bake action is used to build the multi platform parallel builds
- The latest tags is attached to the newest image pushed

## App Details

- The application is a simple transactions app which has 2 routes in the backend to add and list transactions of lend and borrow.
- The frontend uses the backend to connect store and list the transactions and shown below:

![App UI](public/Screenshot%202025-03-09%20at%2012.41.16.png)
