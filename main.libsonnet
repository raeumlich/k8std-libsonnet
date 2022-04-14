{
  local d = (import 'doc-util/main.libsonnet'),

  '#':: d.pkg(
    name='k8std-libsonnet',
    url='https://github.com/raeumlich/k8std-libsonnet/main.libsonnet',
    help='A Jsonnet library that provides common functions when dealing with Kubernetes resources.',
  ),

  manifest:: (import 'manifest/main.libsonnet'),
}
