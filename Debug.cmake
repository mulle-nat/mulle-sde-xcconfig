# just for C-projects

include( Common)


#
# if using mulle_bootstrap, DEPENDENCIES_DIR  is defined and
# mulle-boostrap will set up the paths, so don't mess with it
#
# These setting are for ppl. who build the project as a top
# level project
#
if( NOT DEPENDENCIES_DIR )
   set( DEPENDENCY_FRAMEWORK_DIRS
      ${COMMON_DEPENDENCIES_DIR}/Debug/Framework
      ${DEPENDENCY_FRAMEWORK_DIRS}
   )

   set( DEPENDENCY_LIBRARY_DIRS
      ${COMMON_DEPENDENCIES_DIR}/Debug/lib
      ${DEPENDENCY_LIBRARY_DIRS}
   )

   link_directories(${CMAKE_BINARY_DIR}
      ${DEPENDENCY_LIBRARY_DIRS}
   )
endif()

set( CMAKE_LIBRARY_PATH "${CMAKE_LIBRARY_PATH}
${COMMON_DEPENDENCIES_DIR}/Debug
${COMMON_DEPENDENCIES_DIR}")


if( "${CMAKE_C_COMPILER_ID}" STREQUAL "Intel" or "${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} /Od /Z7 /DDEBUG=1 ${UNWANTED_C_WARNINGS} ${UNWANTED_OBJC_WARNINGS}")
else()
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} -O0 -g -DDEBUG ${UNWANTED_C_WARNINGS} ${UNWANTED_OBJC_WARNINGS}")
endif()


set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OTHER_C_FLAGS}")
set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OTHER_C_FLAGS}")

