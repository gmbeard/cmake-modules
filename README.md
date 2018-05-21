CMake Modules
---
### `InstallExternals`
Including this module will enable configure and build a `CMakeLists.txt` 
file located in a `setup` top-level directory. The purpose of this module 
is to pre-install a project's dependencies via `ExternalProject_Add`. The
module is activated by providing a path to the `INSTALL_DEPS_TO` variable 
on the command line. The variable is `unset` after one invocation so as not 
to run with every `cmake` invocation.

The supported project file structure is as follows...

    [project dir]
        |
         - src
         - ...
         - setup
             |
              - CMakeLists.txt
