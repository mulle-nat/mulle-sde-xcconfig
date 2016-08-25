# Just for C-Projects
include( Common)

#
# if using mulle_bootstrap, DEPENDENCIES_DIR  is defined and
# mulle-boostrap will set up the paths, so don't mess with it
#
# These setting are for ppl. who build the project as a top
# level project
#
if( NOT DEPENDENCIES_DIR )
   link_directories( ${CMAKE_BINARY_DIR}
      ${DEPENDENCY_LIBRARY_DIRS}
   )
endif()

set( CMAKE_LIBRARY_PATH "${CMAKE_LIBRARY_PATH}
${COMMON_DEPENDENCIES_DIR}")

if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} /O2 /Zo /DNDEBUG=1 ${UNWANTED_C_WARNINGS}")
else()
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} -O3 -DNDEBUG=1 ${UNWANTED_C_WARNINGS}")
endif()

set(OTHER_C_FLAGS "-O3 -DNDEBUG ${UNWANTED_C_WARNINGS}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OTHER_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OTHER_C_FLAGS}")
