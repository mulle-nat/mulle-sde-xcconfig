## cmake includes

This project contains some common definitions for cmake to make `CMakeLists.txt`
more uniform and simpler. Check this repo out besides `CMakeLists.txt` and
add the following lines:

```
set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/mulle-configuration)
if( "${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
  include( Debug)
else()
  include( Release)
endif()
```


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

