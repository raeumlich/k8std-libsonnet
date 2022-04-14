---
permalink: /manifest/multifile/
---

# manifest.multifile

Handles naming and ordering of resources when multiple file output is used.

## Index

* [`fn addExtension(resources, yaml=false)`](#fn-addextension)
* [`fn sortByKind(resources, order=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'], prefixLength=2)`](#fn-sortbykind)

## Fields

### fn addExtension

```ts
addExtension(resources, yaml=false)
```

Adds the file extension to the name of every visible field in the given object. If yaml is true .yaml is used otherwise .json.

### fn sortByKind

```ts
sortByKind(resources, order=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'], prefixLength=2)
```

Sorts the given resources by their Kind using order. The prefixLength handles the zero padding of the number prefix for each visible field.