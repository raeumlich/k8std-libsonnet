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
};

t.run(sets)
