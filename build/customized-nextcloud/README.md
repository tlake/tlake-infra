# Customized Nextcloud

There are a few tools used by certain applications that are not installed in the fpm-alpine nextcloud images.
This directory exists to pull down the image in a Dockerfile and install those packages, then build a new image and push it up to dockerhub.

## Usage

1. Configure any installation steps to be taken in `install-packages.sh`.

2. Configure the `Dockerfile` to pull the correct fpm-alpine image in the `FROM` field, then to copy `install-packages.sh` into the container and run it.

3. Configure `build.sh` to build and tag a container image appropriately (use the same tag as the source nextcloud image), and to push it to `tlake/customized-nextcloud` in dockerhub.

4. Run `docker login` if necessary, then run `./build.sh`.

5. The new `tlake/customized-nextcloud` image is available for use in `argocd/applications/nextcloud/`, or whatever!
