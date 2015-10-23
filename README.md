## Xcode configurations

These configurations are embedded into various projects, probably using `mulle-bootstrap`.

### How to embed

```console
$ mulle-bootstrap init
$ echo "http://www.mulle-kybernetik.com/repositories/mulle-configuration" >> .bootstrap/embedded_repositories
$ mulle-bootstrap fetch
```

### Customizing them for your project

```console
$ git branch <myproject> 
$ git checkout <myproject>
$ mkdir -p .bootstrap/settings/mulle-configuration
$ echo "<myproject> > .bootstrap/settings/mulle-configuration/tag
$ git push --all
```

