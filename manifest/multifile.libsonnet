local ko = import 'kindOrder.libsonnet';

{
  local d = (import 'doc-util/main.libsonnet'),

  '#':: d.pkg(
    name='multifile',
    url='',
    help='Handles naming and ordering of resources when multiple file output is used.',
  ),

  '#addExtension':: d.fn(
    help='Adds the file extension to the name of every visible field in the given object. If yaml is true .yaml is used otherwise .json.',
    args=[
      d.arg(name='resources', type=d.T.object),
      d.arg(name='yaml', type=d.T.boolean, default=false),
    ],
  ),
  addExtension(resources, yaml=false):: {
    ['%s.%s' % [field, if yaml then 'yaml' else 'json']]: resources[field],
    for field in std.objectFields(resources)
  },

  '#sortByKind':: d.fn(
    help='Sorts the given resources by their Kind using order. The prefixLength handles the zero padding of the number prefix for each visible field.',
    args=[
      d.arg(name='resources', type=d.T.object),
      d.arg(name='order', type=d.T.array, default=ko.default),
      d.arg(name='prefixLength', type=d.T.integer, default=2),
    ],
  ),
  sortByKind(resources, order=ko.default, prefixLength=2)::
  {
    ['%s_%s' % [item.prefix, item.name]]: item.value,
    for item in std.mapWithIndex(
      function(i, elem) (elem + { prefix: ('%%0%dd' % prefixLength) % (i+1) }),
      std.sort(
        std.objectValues(
          std.mapWithKey(
            function(k, v) { name: k, value: v },
            resources,
          ),
        ),
        keyF=function(res) (
          local idxs = std.find(res.value.kind, order);
          // Use the index of the first match if found otherwise move to end.
          if std.length(idxs) > 0 then idxs[0] else 99
        ),
      )
    )
  }
}
