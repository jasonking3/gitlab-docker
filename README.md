# gitlab-docker

Tooling to run gitlab-ce and gitlab-runner in Docker.

## Requirements

- [Docker Desktop]()

## Usage

1. Find the host IP address and export it into your environment as `GITLAB_IP`.  On MacOS:
    ```
    export GITLAB_IP=`ipconfig getifaddr en0`
    ```
1. Bring up gitlab-ce and gitlab-runner.
    ```
    docker-compose up -d
    ```
    > Note: It will take a few minutes for gitlab-ce to become available.
1. Browse to `localhost:8081`, enter a new root password and then login as root.  Click on the wrench icon in the menu bar. Select Overview -> Runners and then copy the registration token.
1. Export the registration token into your environment.
    ```
    export REGISTRATION_TOKEN=fx5K-XsQVB-kFB7Xs2vZ
    ```
1. Run the `register.sh` shell script.
    ```
    ./register.sh
    ```