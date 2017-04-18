#
# Set Search Paths
#

# if we are called from mulle-bootstrap, then assume CMAKE_FRAMEWORK_PATH
# and CMAKE_LIBRARY_PATH are already set up.
#
# These paths are used by find_library. It's assumed, that the
# CMakeLists.txt is executing find_library for the libs it uses
# and then places them into a target_link_libraries command.
#
if( NOT DEFINED MULLE_BOOTSTRAP_VERSION)
   set( CMAKE_FRAMEWORK_PATH ${COMMON_FRAMEWORK_DIRS}
${CMAKE_FRAMEWORK_PATH}
)
   set( CMAKE_LIBRARY_PATH ${COMMON_LIBRARY_DIRS}
${CMAKE_LIBRARY_PATH}
)
endif()

#
# For headers it's a different story, we supplement the global
# search path here, which mulle-bootstrap can not do, because
# you can't set include_directories from the commandline.
#
# Why is that useful ? Shouldn't find_library also take care of that ?
# The problem here is, that if you have a Framework which includes
# <Foo/Foo.h> and that is a library, that's been linked into the
# Framework, the header will probably not be found.
#
# Copying the headers into the Framework/Headers doesn't really
# work, because <Foo/...> isn't searched in Framework/Headers.
# The proper solution is to sub_umbrella this in the Framework.
# So this is a shortcut hack, that works in development and it
# _should_ be harmless.
#
include_directories( BEFORE SYSTEM
${COMMON_INCLUDE_DIRS}
)

#
# Set Compiler Flags
#
set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OTHER_C_FLAGS} ${UNWANTED_C_WARNINGS}")
set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OTHER_C_FLAGS} ${UNWANTED_C_WARNINGS}")


if( "${MULLE_LANGUAGE}" STREQUAL "ObjC")
   set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${UNWANTED_OBJC_WARNINGS}")
   set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${UNWANTED_OBJC_WARNINGS}")
endif()

