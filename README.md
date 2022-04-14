# k8std-libsonnet

This project is meant to provide some common Jsonnet functions when dealing with
Kubernetes resources.

**NOTE:** This library is not stable yet.

## Usage

### Installation

**Using jsonnet-bundler**

```bash
$ jb install github.com/raeumlich/k8std-libsonnet@main
```

### Import

```jsonnet
local k8std = import 'github.com/raeumlich/k8std-libsonnet/main.libsonnet';
```
