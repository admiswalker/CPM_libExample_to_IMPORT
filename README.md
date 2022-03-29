# CPM_libExample_to_IMPORT


## Add a tag for CPM.
Adding a <libName> for installation script can get lib name from download URL.
Recommending tag format is <libName>-<version>.
And use semantic versioning for <version>.
```
$ git tag -a <libName>-<version> -m 'initial release'
$ git push origin <libName>-<version>
```

- example
  ```
  $ git tag -a cpmex-0.1.0 -m 'initial release'
  $ git push origin cpmex-0.1.0
  ```
