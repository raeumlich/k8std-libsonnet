local getKindIndex(kind, order) = (
  local indexes = std.find(kind, order);
  assert std.length(indexes) > 0 : 'Kind %s not found in order' % kind;
  indexes[0]
);

{
  local d = (import 'doc-util/main.libsonnet'),

  '#':: d.pkg(
    name='kindOrder',
    url='',
    help=|||
      Manages a list of Kinds for ordering within a manifest file or across
      multiple manifest files.
    |||,
  ),

  '#default':: d.val(
    type=d.T.array,
    help=|||
      The default order for Kubernetes resources.
    |||,
    default=self.default,
  ),
  default:: [
    'Namespace',
    'NetworkPolicy',
    'ResourceQuota',
    'LimitRange',
    'PodSecurityPolicy',
    'PodDisruptionBudget',
    'ServiceAccount',
    'Secret',
    'ConfigMap',
    'StorageClass',
    'PersistentVolume',
    'PersistentVolumeClaim',
    'CustomResourceDefinition',
    'ClusterRole',
    'ClusterRoleBinding',
    'Role',
    'RoleBinding',
    'Service',
    'DaemonSet',
    'Pod',
    'ReplicationController',
    'ReplicaSet',
    'Deployment',
    'HorizontalPodAutoscaler',
    'StatefulSet',
    'Job',
    'CronJob',
    'IngressClass',
    'Ingress',
    'APIService',
  ],

  '#withKindsAtPosition':: d.fn(
    help=|||
      Inserts an array of Kinds at the given position. withKindsAfter() or
      withKindsBefore() might be more useful.
    |||,
    args=[
      d.arg(name='position', type=d.T.integer),
      d.arg(name='kinds', type=d.T.array),
      d.arg(name='baseOrder', type=d.T.array, default=self.default),
    ],
  ),
  withKindsAtPosition(position, kinds, baseOrder=self.default):: (
    std.flattenArrays([
      baseOrder[0:position:1],
      kinds,
      baseOrder[position::1],
    ])
  ),

  '#withKindsAfter':: d.fn(
    help=|||
      Inserts an array of Kinds after the given Kind in baseOrder.
      `kinds` can also be a string if you want to add just one Kind.
    |||,
    args=[
      d.arg(name='after', type=d.T.string),
      d.arg(name='kinds', type=d.T.array),
      d.arg(name='baseOrder', type=d.T.array, default=self.default),
    ],
  ),
  withKindsAfter(after, kinds, baseOrder=self.default):: (
    local order = std.uniq(baseOrder);
    local newKinds = if std.isString(kinds) then [kinds] else kinds;
    local index = getKindIndex(after, order) + 1;

    self.withKindsAtPosition(index, newKinds, baseOrder)
  ),

  '#withKindsBefore':: d.fn(
    help=|||
      Inserts an array of Kinds before the given Kind in baseOrder.
    |||,
    args=[
      d.arg(name='before', type=d.T.string),
      d.arg(name='kinds', type=d.T.array),
      d.arg(name='baseOrder', type=d.T.array, default=self.default),
    ],
  ),
  withKindsBefore(before, kinds, baseOrder=self.default):: (
    local order = std.uniq(baseOrder);
    local newKinds = if std.isString(kinds) then [kinds] else kinds;
    local index = getKindIndex(before, baseOrder);

    self.withKindsAtPosition(index, newKinds, order)
  ),
}
