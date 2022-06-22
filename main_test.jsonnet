local t = import 'testutil.libsonnet';
local k8std = import 'main.libsonnet';

local sets = {
  TestIsK8sResource: {
    tests: {
      is_resource: {
        input: {apiVersion: 'v1', kind: 'foo'},
        want: true,
      },
      without_apiVersion: {
        input: {version: 'v1', kind: 'foo'},
        want: false,
      },
      without_kind: {
        input: {apiVersion: 'v1', foo: 'bar'},
        want: false,
      },
      something_else: {
        input: {foo: 'bar', baz: 'qux'},
        want: false,
      }
    },
    run(input):: k8std.isK8sResource(input),
  },

  TestParseYamlManifestToObject: {
    tests: {
      simple: {
        input: |||
          kind: Foo
          metadata:
            name: bar
        |||,
        want: {
          foo_bar: {
            kind: 'Foo',
            metadata: {
              name: 'bar'
            }
          }
        }
      },
      stream: {
        input: |||
          kind: ConfigMap
          metadata:
            name: foo
          ---
          kind: Secret
          metadata:
            name: bar
        |||,
        want: {
          configmap_foo: {
            kind: 'ConfigMap',
            metadata: {
              name: 'foo'
            }
          },
          secret_bar: {
            kind: 'Secret',
            metadata: {
              name: 'bar'
            }
          }
        }
      },
    },
    run(input):: k8std.parseYamlManifestToObject(input)
  },

  TestRecommendedLabels: {
    tests: {
      name: {
        input: k8std.recommendedLabels(name='postgresql'),
        want: {'app.kubernetes.io/name': 'postgresql'},
      },
      instance: {
        input: k8std.recommendedLabels(instance='postgresql-abcd123'),
        want: {'app.kubernetes.io/instance': 'postgresql-abcd123'},
      },
      version: {
        input: k8std.recommendedLabels(version='14.4'),
        want: {'app.kubernetes.io/version': '14.4'},
      },
      part_of: {
        input: k8std.recommendedLabels(part_of='something_big'),
        want: {'app.kubernetes.io/part-of': 'something_big'},
      },
      managed_by: {
        input: k8std.recommendedLabels(managed_by='someone'),
        want: {'app.kubernetes.io/managed-by': 'someone'},
      },
      created_by: {
        input: k8std.recommendedLabels(created_by='someone_else'),
        want: {'app.kubernetes.io/created-by': 'someone_else'},
      },
    },
    run(input): input,
  },

  TestSetNameSpace: {
    tests: {
      with_namespace: {
        input: k8std.setNamespace(
          {apiVersion: 'v1', kind: 'Foo', metadata: {namespace: 'foo'}},
          'bar',
        ),
        want: {apiVersion: 'v1', kind: 'Foo', metadata: {namespace: 'bar'}},
      },
      without_namespace: {
        input: k8std.setNamespace(
          {apiVersion: 'v1', kind: 'Foo', metadata: {name: 'test'}},
          'baz',
        ),
        want: {apiVersion: 'v1', kind: 'Foo', metadata: {name: 'test'}},
      },
      forced_namespace: {
        input: k8std.setNamespace(
          {apiVersion: 'v1', kind: 'Bar', metadata: {name: 'test'}},
          'baz',
          force=true,
        ),
        want: {apiVersion: 'v1', kind: 'Bar', metadata: {name: 'test', namespace: 'baz'}},
      },
      no_k8s_resource: {
        input: k8std.setNamespace(
          {metadata: {namespace: 'foo'}},
          'bar',
        ),
        want: {metadata: {namespace: 'foo'}},
      },
    },
    run(input): input
  },
};

t.run(sets)
