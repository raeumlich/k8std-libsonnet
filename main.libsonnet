{
  local d = (import 'doc-util/main.libsonnet'),

  '#':: d.pkg(
    name='k8std',
    url='https://github.com/raeumlich/k8std-libsonnet/main.libsonnet',
    help=|||
      A Jsonnet library that provides common functions when dealing with
      Kubernetes resources.
    |||,
  ),

  '#isK8sResource':: d.fn(
    help=|||
      Checks whether the given object is a Kubernetes resource or not (based on
      the presence of the "apiVersion" and "kind" field)
    |||,
    args=[
      d.arg(name='o', type=d.T.object),
    ],
  ),
  isK8sResource(o)::
    if std.objectHas(o, 'apiVersion') && std.objectHas(o, 'kind') then
      true
    else
      false,

  '#parseYamlManifestToObject':: d.fn(
    help=|||
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
    |||,
    args=[
      d.arg(name='yaml', type=d.T.string),
    ]
  ),
  parseYamlManifestToObject(yaml)::
    local parsed = std.parseYaml(yaml);
    local getFieldName(kind, name) = '%s_%s' % [
      std.asciiLower(kind),
      std.asciiLower(name),
    ];

    if std.isObject(parsed) then
      {
        [getFieldName(parsed.kind, parsed.metadata.name)]: parsed
      }
    else if std.isArray(parsed) then
      {
        [getFieldName(item.kind, item.metadata.name)]: item
        for item in parsed
      }
    else
      error 'Error parsing manifest. The returned value is neither an object nor an array.',

  '#recommendedLabels':: d.fn(
    help=|||
      Helper for building a set of recommended labels.

      Please refer to the [Kubernetes documentation](
        https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/
      ) for more information.
    |||,
    args=[
      d.arg(name='name', type=d.T.string, default=d.T.nil),
      d.arg(name='instance', type=d.T.string, default=d.T.nil),
      d.arg(name='version', type=d.T.string, default=d.T.nil),
      d.arg(name='component', type=d.T.string, default=d.T.nil),
      d.arg(name='part_of', type=d.T.string, default=d.T.nil),
      d.arg(name='managed_by', type=d.T.string, default=d.T.nil),
      d.arg(name='created_by', type=d.T.string, default=d.T.nil),
    ],
  ),
  recommendedLabels(
    name=null,
    instance=null,
    version=null,
    component=null,
    part_of=null,
    managed_by=null,
    created_by=null,
  ):: {
    [if std.isString(name) then 'app.kubernetes.io/name']: name,
    [if std.isString(instance) then 'app.kubernetes.io/instance']: instance,
    [if std.isString(version) then 'app.kubernetes.io/version']: version,
    [if std.isString(component) then 'app.kubernetes.io/component']: component,
    [if std.isString(part_of) then 'app.kubernetes.io/part-of']: part_of,
    [if std.isString(managed_by) then 'app.kubernetes.io/managed-by']: managed_by,
    [if std.isString(created_by) then 'app.kubernetes.io/created-by']: created_by,
  },

  '#setNamespace':: d.fn(
    help=|||
      Sets the namespace `ns` on the given resource `o`.
      If the resource doesn't have any namespace set it doesn't change anything
      unless `force` is set to `true`.
    |||,
    args=[
      d.arg(name='o', type=d.T.object),
      d.arg(name='ns', type=d.T.string),
      d.arg(name='force', type=d.T.boolean, default=false),
    ]
  ),
  setNamespace(o, ns, force=false)::
    if $.isK8sResource(o) then
      if std.objectHas(o.metadata, 'namespace') || force then
        o + {metadata+: {namespace: ns}}
      else
        o
    else
      o,

  kindOrder:: (import 'kindorder/main.libsonnet'),
  multifile:: (import 'multifile/main.libsonnet'),
}
