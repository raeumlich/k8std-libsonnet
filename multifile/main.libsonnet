local ko = import '../kindOrder/main.libsonnet';

{
  local d = (import 'doc-util/main.libsonnet'),

  '#':: d.pkg(
    name='multifile',
    url='',
    help=|||
      Handles naming and ordering of resources when multiple file output is
      used.
    |||,
  ),

  '#addExtension':: d.fn(
    help=|||
      Adds the file extension to the name of every visible field in the given
      object. If yaml is true `.yaml` is used otherwise `.json`.
    |||,
    args=[
      d.arg(name='resources', type=d.T.object),
      d.arg(name='yaml', type=d.T.boolean, default=false),
    ],
  ),
  addExtension(resources, yaml=false):: {
    ['%s.%s' % [field, if yaml then 'yaml' else 'json']]: resources[field],
    for field in std.objectFields(resources)
  },
}
