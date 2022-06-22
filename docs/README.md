---
permalink: /
---

# k8std

```jsonnet
local k8std = import "https://github.com/raeumlich/k8std-libsonnet/main.libsonnet"
```

A Jsonnet library that provides common functions when dealing with
Kubernetes resources.


* [kindOrder](kindOrder.md)
* [multifile](multifile.md)

## Index

* [`fn isK8sResource(o)`](#fn-isk8sresource)
* [`fn parseYamlManifestToObject(yaml)`](#fn-parseyamlmanifesttoobject)
* [`fn recommendedLabels(name='null', instance='null', version='null', component='null', part_of='null', managed_by='null', created_by='null')`](#fn-recommendedlabels)
* [`fn setNamespace(o, ns, force=false)`](#fn-setnamespace)

## Fields

### fn isK8sResource

```ts
isK8sResource(o)
```

Checks whether the given object is a Kubernetes resource or not (based on
the presence of the "apiVersion" and "kind" field)


### fn parseYamlManifestToObject

```ts
parseYamlManifestToObject(yaml)
```

Parses the given YAML manifest into an object by using the resources kind
and name as field name separated by `_`. Field names are always lowercase.
This works for single YAML documents as well as streams of YAML documents.

**Requires Jsonnet v0.18.0**

Example:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: foo
  namespace: default
data:
  some_variable: "1"
```

becomes...

```json
{
  "configmap_foo": {
    "apiVersion": "v1",
    "kind": "ConfigMap",
    "metadata": {
      "name": "foo",
      "namespace": "default"
    },
    "data": {
      "some_variable": "1"
    }
  }
}
```


### fn recommendedLabels

```ts
recommendedLabels(name='null', instance='null', version='null', component='null', part_of='null', managed_by='null', created_by='null')
```

Helper for building a set of recommended labels.

Please refer to the [Kubernetes documentation](
  https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/
) for more information.


### fn setNamespace

```ts
setNamespace(o, ns, force=false)
```

Sets the namespace `ns` on the given resource `o`.
If the resource doesn't have any namespace set it doesn't change anything
unless `force` is set to `true`.
