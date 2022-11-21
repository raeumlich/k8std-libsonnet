---
permalink: /multifile/
---

# multifile

Handles naming and ordering of resources when multiple file output is
used.


## Index

* [`fn addExtension(resources, yaml=false)`](#fn-addextension)

## Fields

### fn addExtension

```ts
addExtension(resources, yaml=false)
```

Adds the file extension to the name of every visible field in the given
object. If yaml is true `.yaml` is used otherwise `.json`.
