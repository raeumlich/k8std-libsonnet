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
* [`fn setNamespaceAll(o, ns, force=false)`](#fn-setnamespaceall)
* [`fn sortByKind(resources, order=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'], prefixLength=2)`](#fn-sortbykind)

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


### fn setNamespaceAll

```ts
setNamespaceAll(o, ns, force=false)
```

Sets the namespace `ns` on all resources in `o`.
If the resource doesn't have any namespace set it doesn't change anything
unless `force` is set to `true`.


### fn sortByKind

```ts
sortByKind(resources, order=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'], prefixLength=2)
```

Sorts the given resources by their Kind using `order`. The prefixLength
handles the zero padding of the number prefix that is added to get the
files in order on the file system, which is only relevant if you are using
the multifile output.
