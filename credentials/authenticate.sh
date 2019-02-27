REPO_ROOT=$(dirname $(readlink -f $0))/..

# Export desktop environment shell configuration
export $($REPO_ROOT/docker/scripts/environment.sh)

# Extract credentials from environment
if [ ! -z "$DESKTOP_ENVIRONMENT_CREDENTIALS" ]; then
  docker run \
    --env DESKTOP_ENVIRONMENT_CREDENTIALS \
    --interactive \
    --rm \
    --volume DESKTOP_ENVIRONMENT_DOCKER_REPOSITORY:$DESKTOP_ENVIRONMENT_DOCKER_REPOSITORY \
    alpine:latest ash -c "echo '$DESKTOP_ENVIRONMENT_CREDENTIALS' > $DESKTOP_ENVIRONMENT_DOCKER_REPOSITORY/credentials/credentials.json"
fi