local t = import '../testutil.libsonnet';
local mf = import 'main.libsonnet';
local ko = import '../kindorder/main.libsonnet';

local sets = {
  TestAddExtension: {
    tests: {
      json: {
        input: mf.addExtension({foo: 'bar', baz: 'qux'}),
        want: {'foo.json': 'bar', 'baz.json': 'qux'},
      },
      yaml: {
        input: mf.addExtension({foo: 'bar', baz: 'qux'}, yaml=true),
        want: {'foo.yaml': 'bar', 'baz.yaml': 'qux'},
      },
    },
    run(input):: input,
  },

  TestSortByKind: {
    tests: {
      known: {
        input: mf.sortByKind(
          {
            two: {kind: 'Service'},
            three: {kind: 'Deployment'},
            one: {kind: 'ServiceAccount'},
          }
        ),
        want: {
          '01_one': {kind: 'ServiceAccount'},
          '02_two': {kind: 'Service'},
          '03_three': {kind: 'Deployment'},
        },
      },
      unknown: {
        input: mf.sortByKind(
          {
            foo: {kind: 'Something'},
            one: {kind: 'ServiceAccount'},
          }
        ),
        want: {
          '01_one': {kind: 'ServiceAccount'},
          '02_foo': {kind: 'Something'},
        },
      },
      with_order: {
        input: mf.sortByKind(
          {
            two: {kind: 'ServiceAccount'},
            one: {kind: 'Something'},
          },
          order=ko.withKindsBefore('ServiceAccount', ['Something']),
        ),
        want: {
          '01_one': {kind: 'Something'},
          '02_two': {kind: 'ServiceAccount'},
        },
      },
      with_prefix_length: {
        input: mf.sortByKind(
          {
            two: {kind: 'Service'},
            three: {kind: 'Deployment'},
            one: {kind: 'ServiceAccount'},
          },
          prefixLength=3,
        ),
        want: {
          '001_one': {kind: 'ServiceAccount'},
          '002_two': {kind: 'Service'},
          '003_three': {kind: 'Deployment'},
        },
      },
    },
    run(input): input
  },
};

t.run(sets)
