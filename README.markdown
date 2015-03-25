#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with riak2](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Module for installing and configuring Riak 2.0.x

## Module Description

We simplify the install and configuration by making a hash of all the default configuration values and allowing the user to override whichever they want, rather then making each one a puppet attribute.


## Setup Requirements

Expects package to exist in the servers available repos, no support for specifying an installation source currently


## Usage

include ::riak2

or

class { '::riak2':
  config => {
    'dtrace' => 'on',
  }
}

## Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

## Limitations

* Tested on Ubuntu 12.04 only

