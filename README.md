# trips4-webserver

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with webserver](#setup)
    * [What webserver affects](#what-webserver-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with webserver](#beginning-with-webserver)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The `trips4-webserver` module installs and configures a basic HTTP service — **IIS on Windows** or **apache2 on Ubuntu** — with a configurable HTTP port.

## Setup

### What webserver affects

- OS-aware package installation (`IIS` on Windows, `apache2` on Ubuntu)
- Configuration of the HTTP port (via exec or command)
- Service management (ensuring the service is running and enabled)

### Setup Requirements

This module depends on the puppetlabs/powershell module.  Refer to the metadata.json file in this repo for version requirements

### Beginning with webserver

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most basic
use of the module.

## Usage

```puppet
# Install with default settings (port 80)
include webserver

# Or customize port
class { 'webserver':
  http_port => '8080',
}
```

## Limitations

## Development
