#
#
# Common stuff for Debug and Release
# C and ObjC
#
#
cmake_policy( SET CMP0054 NEW)


if(APPLE)
   # baseline set to 10.6 for rpath
   cmake_minimum_required (VERSION 3.0)
   set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)
   set(CMAKE_POSITION_INDEPENDENT_CODE FALSE)
   # linker stuff
   set(BEGIN_ALL_LOAD "-all_load")
   set(END_ALL_LOAD)
else()
   if(WIN32)
      # may not be enough though...
      cmake_minimum_required (VERSION 3.4)
      set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
      # linker stuff
      #set(BEGIN_ALL_LOAD "/OPT:NOREF /OPT:NOICF")
      #set(END_ALL_LOAD "/OPT:REF /OPT:ICF")
   else()
      cmake_minimum_required (VERSION 3.0)
      set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
      # linker stuff
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
if( NOT DEPENDENCIES_DIR)
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


if( "${MULLE_C_COMPILER_ID}" STREQUAL "")
   if( ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows") AND ( {CMAKE_C_COMPILER_ID MATCHES "^(Clang|MulleClang)$") )
      set( MULLE_C_COMPILER_ID "MSVC-${CMAKE_C_COMPILER_ID}")
   else()
      set( MULLE_C_COMPILER_ID "${CMAKE_C_COMPILER_ID}")
   endif()
endif()

if( "${MULLE_CXX_COMPILER_ID}" STREQUAL "")
   if( ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows") AND ( CMAKE_CXX_COMPILER_ID MATCHES "^(Clang|MulleClang)$") )
      set( MULLE_C_COMPILER_ID "MSVC-${CMAKE_CXX_COMPILER_ID}")
   else()
      set( MULLE_C_COMPILER_ID "${CMAKE_CXX_COMPILER_ID}")
   endif()
endif()


if( MULLE_C_COMPILER_ID MATCHES "^(Clang|AppleClang|MulleClang|GNU)$")
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
else()
   if( MULLE_C_COMPILER_ID MATCHES "^(Intel|MSVC|MSVC-Clang|MSVC-MulleClang)$")
      # C4068: unwanted pragma
      set( UNWANTED_C_WARNINGS "/D_CRT_SECURE_NO_WARNINGS /wd4068 /wd4113")
   endif()
endif()

if( MULLE_C_COMPILER_ID MATCHES "^(Intel|MSVC|MSVC-Clang|MSVC-MulleClang)$")
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} /Od /Z7 /DDEBUG=1")
else()
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} -O0 -g -DDEBUG")
endif()

