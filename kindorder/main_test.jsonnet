local t = import '../testutil.libsonnet';
local ko = import 'main.libsonnet';

local sets = {
  TestWithKindsAfter: {
    tests: {
      one_default_string: {
        input: ko.withKindsAfter('Secret', 'Foo'),
        want: [
          'Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange',
          'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount',
          'Secret', 'Foo', 'ConfigMap', 'StorageClass', 'PersistentVolume',
          'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole',
          'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet',
          'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment',
          'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob',
          'IngressClass', 'Ingress', 'APIService',
        ],
      },
      one_default_array: {
        input: ko.withKindsAfter('Secret', ['Bar']),
        want: [
          'Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange',
          'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount',
          'Secret', 'Bar', 'ConfigMap', 'StorageClass', 'PersistentVolume',
          'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole',
          'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet',
          'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment',
          'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob',
          'IngressClass', 'Ingress', 'APIService',
        ],
      },
      multiple_default: {
        input: ko.withKindsAfter('Secret', ['Baz', 'Qux']),
        want: [
          'Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange',
          'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount',
          'Secret', 'Baz', 'Qux', 'ConfigMap', 'StorageClass',
          'PersistentVolume', 'PersistentVolumeClaim',
          'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding',
          'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod',
          'ReplicationController', 'ReplicaSet', 'Deployment',
          'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob',
          'IngressClass', 'Ingress', 'APIService',
        ],
      },
      custom_order: {
        input: ko.withKindsAfter('Foo', ['Bar'], baseOrder=['Foo', 'Baz']),
        want: ['Foo', 'Bar', 'Baz'],
      },
    },
    run(input):: input,
  },
  TestWithKindsBefore: {
    tests: {
      one_default_string: {
        input: ko.withKindsBefore('Secret', 'Foo'),
        want: [
          'Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange',
          'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount',
          'Foo', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume',
          'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole',
          'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet',
          'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment',
          'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob',
          'IngressClass', 'Ingress', 'APIService',
        ],
      },
      one_default_array: {
        input: ko.withKindsBefore('Secret', ['Bar']),
        want: [
          'Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange',
          'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount',
          'Bar', 'Secret', 'ConfigMap', 'StorageClass', 'PersistentVolume',
          'PersistentVolumeClaim', 'CustomResourceDefinition', 'ClusterRole',
          'ClusterRoleBinding', 'Role', 'RoleBinding', 'Service', 'DaemonSet',
          'Pod', 'ReplicationController', 'ReplicaSet', 'Deployment',
          'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob',
          'IngressClass', 'Ingress', 'APIService',
        ],
      },
      multiple_default: {
        input: ko.withKindsBefore('Secret', ['Baz', 'Qux']),
        want: [
          'Namespace', 'NetworkPolicy', 'ResourceQuota', 'LimitRange',
          'PodSecurityPolicy', 'PodDisruptionBudget', 'ServiceAccount',
          'Baz', 'Qux', 'Secret', 'ConfigMap', 'StorageClass',
          'PersistentVolume', 'PersistentVolumeClaim',
          'CustomResourceDefinition', 'ClusterRole', 'ClusterRoleBinding',
          'Role', 'RoleBinding', 'Service', 'DaemonSet', 'Pod',
          'ReplicationController', 'ReplicaSet', 'Deployment',
          'HorizontalPodAutoscaler', 'StatefulSet', 'Job', 'CronJob',
          'IngressClass', 'Ingress', 'APIService',
        ],
      },
      custom_order: {
        input: ko.withKindsBefore('Foo', ['Bar'], baseOrder=['Foo', 'Baz']),
        want: ['Bar', 'Foo', 'Baz'],
      },
    },
    run(input):: input,
  },
};

t.run(sets)
