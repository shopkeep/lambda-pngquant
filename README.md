# lambda-pngquant

Prebuilt binaries for [pngquant](https://pngquant.org/) on AWS Lambda.

## Download

See the [releases](releases/) page for available binary downloads.

## Building locally

To build locally you should have Docker installed and running.

Run `./build_docker.sh` to compile `pngquant` inside Docker and copy the generated binary to `artifacts/`.

## Releasing a new version

To build and release a new version of pngquant, just tag the release in Github and let Travis do the rest.

First, update the versions specified in `build.sh` to the desired versions and commit/PR to `master`. Once merged, tag the release in the format `v$DESIRED_VERSION` and push. Travis will take care of building and pushing to Github releases.
