#
# This is common to C and ObjC projects...
#
cmake_policy( SET CMP0054 NEW)


if(APPLE)
  # baseline set to 10.6 for rpath
  cmake_minimum_required (VERSION 3.0)
  set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)
  set(CMAKE_POSITION_INDEPENDENT_CODE FALSE)
  set(BEGIN_ALL_LOAD "-all_load")
  set(END_ALL_LOAD)
else()
  if(WIN32)
    # may not be enough though...
    cmake_minimum_required (VERSION 3.4)
    set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
    set(BEGIN_ALL_LOAD "/OPT:NOREF /OPT:NOICF")
    set(END_ALL_LOAD "/OPT:REF /OPT:ICF")
  else()
    cmake_minimum_required (VERSION 3.0)
    set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
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
