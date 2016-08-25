# Just for C-Projects, use different branch for ObjC
# TODO: move stuff to _Common for really common C and ObjC projects...
#
if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
endif()

if(APPLE)
  # baseline set to 10.6 for rpath
  set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)
  set(CMAKE_POSITION_INDEPENDENT_CODE FALSE)
  set(BEGIN_ALL_LOAD "-all_load")
  set(END_ALL_LOAD)
else()
  set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
  if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")
     set(BEGIN_ALL_LOAD "")
     set(END_ALL_LOAD "")
  else
     set(BEGIN_ALL_LOAD "-Wl,--whole-archive")
     set(END_ALL_LOAD "-Wl,--no-whole-archive")
  endif()
endif()


#
# if using mulle_bootstrap, DEPENDENCIES_DIR  is defined and
# mulle-boostrap will set up the paths, so don't mess with it
#
# These setting are for ppl. who build the project as a top
# level project
#
if( NOT DEPENDENCIES_DIR )

   set( COMMON_DEPENDENCIES_DIR dependencies)

   set( DEPENDENCY_LIBRARY_DIRS
      ${COMMON_DEPENDENCIES_DIR}/lib
   )

   include_directories( BEFORE SYSTEM
      ${COMMON_DEPENDENCIES_DIR}/include
   )
else()
   set( COMMON_DEPENDENCIES_DIR ${DEPENDENCIES_DIR})
endif()

