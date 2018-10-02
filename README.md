# Vagrant Homelab Desktop

## Summary

Provide a method of reproducible graphical development environments based on Linux.  This repository provides a base Homelab Desktop environment, sandboxed on your local computer.

### Usage

You can use this locally with `vagrant up`, calling as such:

```bash
vagrant --name=mydesktop up
```

However It is recommended to use the script `create.sh` for the first run to ensure all necessary arguments are provided. The provided arguments creates a `settings.yaml`, storing the settings for the machine.  You can create the machine by calling:

```bash
sh create.sh -n mydesktop -d ubuntu
```

If you want more information about the script `create.sh`, you can do so by calling:

```bash
sh create.sh -h
```

### Parameters

The parameters are used in the calling of `vagrant up`, primarily as `vagrant [OPTIONS] up`.  After provisioning the environment, a settings file (`setting.yaml`) is created, which stores the provided parameters.

| Name | Type | Description |
| ---  | ---  | ---         |
| name | `string` | Name of the provisioned desktop environment |
| desktop | `filename` | The name of the desktop provisioning script.  These scripts are present in [`packaging/environments`](src/packaging/environments). |

The vagrant environment is based on the `bento/ubuntu` images.  If the timezone is not set, the provision script will attempt to auto-detect the timezone using [`tzupdate`](https://github.com/cdown/tzupdate).

## Components

On first run (`create.sh ...`) the base `bento/ubuntu` image will be downloaded, and the packages for a graphical interface will be downloaded. This will take a significant amount of time to fully setup to become fully installed.  The default user is `vagrant` with password `vagrant`.

### Architecture

The `vagrant-desktop-homelab` is meant to be included as a git submodule as part of a `.Workspace` project. The following is the architecture of a `.Workspace` meta-project:

    * .Workspace Repository
        * bin
        * lib
        * build
            * build-all.sh
        * Repositories
            * MyDockerProject (git repo submodule)
            * MyHomeLab (git repo submodule)
        * Environments
            * vagrant-desktop (git repo submodule)
        README.md

The concept of this architecture is to enable docker experiments that is best not to be executed on the actual homelab. This enables purging the docker image cache or completely wiping the users (& filesystem) while experimenting with a new docker image.

## Acknowledgements

The project icon is retrieved from [the Noun Project](docs/icon/icon.json). The original source material has been altered for the purposes of the project. The icon is used under the terms of the [Public Domain](https://creativecommons.org/publicdomain/zero/1.0/).

The project icon is by [Maxi Koichi from the Noun Project](https://thenounproject.com/term/package/137417).