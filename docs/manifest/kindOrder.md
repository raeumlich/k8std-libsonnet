---
permalink: /manifest/kindOrder/
---

# manifest.kindOrder

Manages a list of Kinds for ordering within a manifest file or across multiple manifest files.

## Index

* [`fn withKindsAfter(after, kinds, baseOrder=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'])`](#fn-withkindsafter)
* [`fn withKindsAtPosition(position, kinds, baseOrder=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'])`](#fn-withkindsatposition)
* [`fn withKindsBefore(before, kinds, baseOrder=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'])`](#fn-withkindsbefore)
* [`array default`](#array-default)

## Fields

### fn withKindsAfter

```ts
withKindsAfter(after, kinds, baseOrder=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'])
```

Inserts an array of Kinds after the given Kind in baseOrder.

### fn withKindsAtPosition

```ts
withKindsAtPosition(position, kinds, baseOrder=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'])
```

Inserts an array of Kinds at the given position. withKindsAfter() or withKindsBefore() might be more useful.

### fn withKindsBefore

```ts
withKindsBefore(before, kinds, baseOrder=['Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange', 'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume', 'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment', 'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob', 'IngressClass', 'Ingress', 'APIService'])
```

Inserts an array of Kinds before the given Kind in baseOrder.

### array default

*Default value: * `[Namespace NetworkPolicy ResourceQuota LimitRange PodSecurityPolicy PodDisruptionBudget ServiceAccount Secret ConfigMap StorageClass PersistentVolume PersistentVolumeClaim CustomResourceDefinition ClusterRole ClusterRoleBinding Role RoleBinding Service DaemonSet Pod ReplicationController ReplicaSet Deployment HorizontalPodAutoscaler StatefulSet Job CronJob IngressClass Ingress APIService]`

The default order for Kubernetes resources.