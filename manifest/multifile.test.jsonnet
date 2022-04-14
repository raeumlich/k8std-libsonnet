local mf = import 'multifile.libsonnet';
local ko = import 'kindOrder.libsonnet';

{
  addExtensionTest: {
    json: mf.addExtension(
      {
        foo: 'bar',
        baz: 'qux',
      },
      yaml=false,
    ),
    yaml: mf.addExtension(
      {
        foo: 'bar',
        baz: 'qux',
      },
      yaml=true,
    ),
  },

  sortByKindTest: {
    known: mf.sortByKind({
      two: { kind: 'Service' },
      three: { kind: 'Deployment' },
      one: { kind: 'ServiceAccount' },
    }),
    unknown: mf.sortByKind({
      foo: { kind: 'Something' },
      one: { kind: 'ServiceAccount' },
    }),
    withOrder: mf.sortByKind(
      {
        two: { kind: 'ServiceAccount' },
        one: { kind: 'Something' },
      },
      order=ko.withKindsBefore('ServiceAccount', ['Something']),
    ),
    withPrefixLength: mf.sortByKind(
      {
        two: { kind: 'Service' },
        three: { kind: 'Deployment' },
        one: { kind: 'ServiceAccount' },
      },
      prefixLength=3,
    )
  },
}
