# gitlab-docker

Tooling to run GitLab CE and GitLab Runner in Docker.

## Requirements

- [Docker CE](https://docs.docker.com/v17.09/engine/installation/)
- [docker-compose](https://docs.docker.com/compose/install/)

## Usage
1. Clone the repo and change into the gitlab-docker directory.
    ```
    git clone https://github.com/jasonking3/gitlab-docker.git
    cd gitlab-docker
    ```
1. Find the primary IP address of your host and assign it to the `GITLAB_IP` variable and write it to the `.env` file.
    ```
    echo GITLAB_IP=192.168.1.10 > .env
    ```
    > Note: Replace `192.168.1.10` with your IP address.

    > Note: Windows PowerShell may create the new file in UTF-16 encoding if you use `>` redirection.  docker-compose will fail unless the file is UTF-8.  If this happens, create the .env file using a text editor and assign the `GITLAB_IP` variable that way.
1. Bring up gitlab-ce and gitlab-runner.
    ```
    docker-compose up -d
    ```
    > Note: It will take a few minutes for gitlab-ce to become available.
1. Browse to `localhost:8081`, enter a new root password and then login as root.  Click on the wrench icon in the menu bar. Select Overview -> Runners and then copy the registration token.
1. On Mac/Linux, run the `register.sh` shell script.
    ```
    REGISTRATION_TOKEN=<your token> ./register.sh
    ```
    On Windows, run the `register.ps1` PowerShell script.
    ```
    ./register.ps1 -REGISTRATION_TOKEN <your token>
    ```
1. Congratulations, you should now have a functional GitLab CE and GitLab Runner.

## Helpful tips
- Unregister the runner in Mac/Linux:
    ```
    ./unregister.sh
    ```
- Unregister the runner in Windows:
    ```
    ./unregister.ps1
    ```
- Bring down GitLab CE and GitLab Runner:
    ```
    docker-compose down
    ```
- Four Docker volumes are created to persist the configuration/data for GitLab CE and GitLab Runner.  To remove this persisted data:
    ```
    docker-compose down -v
    ```
