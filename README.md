# cnpm-docker
Dockerfile for cnpm

## Introduction
Based on node:6.10-alpine with a minimized image size of only 60+MB.

All cnpm app files are in `/var/app/cnpmjs.org`

You can mount config file as a volume at `/var/app/cnpmjs.org/config/config.js`

`config.js`: See `config.js.sample` in this repository.

## Quick start
This docker image has not been uploaded to docker hub, so you can build it and publish to your own docker registry to use it.

## Environments
- CNPMJS_ORG_VERSION: Version of cnpmjs.org
- APP_PATH: Installation path of cnpmjs.org
- ADDITIONAL_NPM_PACKAGE: Used to install additional nfs wrapper package. See [NFS Guide](https://github.com/cnpm/cnpmjs.org/wiki/NFS-Guide)
