{
  local d = (import 'doc-util/main.libsonnet'),

  '#':: d.pkg(
    name='manifest',
    url='',
    help='Provides functions for managing manifest files.',
  ),

  kindOrder:: (import 'kindOrder.libsonnet'),
  multifile:: (import 'multifile.libsonnet'),
}
