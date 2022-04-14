local ko = import 'kindOrder.libsonnet';

{
  withKindsAfterTest: {
    oneKind: ko.withKindsAfter('Deployment', ['Foo']),
    multipleKinds: ko.withKindsAfter('Service', ['Foo', 'Bar']),
    withOrder: ko.withKindsAfter('Bar', ['Baz'], baseOrder=['Foo', 'Bar', 'Qux']),
  },

  withKindsBeforeTest: {
    oneKind: ko.withKindsBefore('Deployment', ['Foo']),
    multipleKinds: ko.withKindsBefore('Service', ['Foo', 'Bar']),
    withOrder: ko.withKindsBefore('Bar', ['Baz'], baseOrder=['Foo', 'Bar', 'Qux']),
  },
}
