# Get the registration token from:
# http://localhost:8081/root/${project}/settings/ci_cd
# Then:
# ./register.ps1 -REGISTRATION_TOKEN=<your token>

param($REGISTRATION_TOKEN)

docker exec -it gitlab-runner `
  gitlab-runner register `
  	--name runner1 `
    --non-interactive `
    --registration-token $REGISTRATION_TOKEN `
    --locked=false `
    --url http://gitlab-server:8081 `
    --executor docker `
    --docker-pull-policy if-not-present `
    --docker-image "docker:19.03.1" `
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" `
    --docker-network-mode gitlab-network
