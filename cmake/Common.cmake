#
# Common stuff for Debug and Release
# C and ObjC
#
set( MULLE_CONFIGURATION_VERSION 3)

cmake_policy( SET CMP0054 NEW)

if( APPLE)
   cmake_minimum_required (VERSION 3.0)

   # CMAKE_OSX_SYSROOT must be set for CMAKE_OSX_DEPLOYMENT_TARGET (cmake bug)
   if( NOT CMAKE_OSX_SYSROOT)
      set( CMAKE_OSX_SYSROOT "/" CACHE STRING "SDK for OSX" FORCE)   # means current OS X
   endif()

   # baseline set to minimum 10.6 for rpath
   if( NOT CMAKE_OSX_DEPLOYMENT_TARGET)
      set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)
   endif()

   set( CMAKE_POSITION_INDEPENDENT_CODE FALSE)

   # linker stuff
   # prefix ObjC libraries with force_load ( OS X)
   set( BEGIN_ALL_LOAD)
   set( END_ALL_LOAD)
   set( FORCE_LOAD_PREFIX "-force_load ")
else()
   if(WIN32)
      # may not be enough though...

      cmake_minimum_required (VERSION 3.4)

      # set only for libraries ?
      set( CMAKE_POSITION_INDEPENDENT_CODE TRUE)

      # linker stuff (since VS 2015)
      set( FORCE_LOAD_PREFIX "-WHOLEARCHIVE:")
      set( OS_SPECIFIC_LIBRARIES psapi.lib)
   else()
      cmake_minimum_required (VERSION 3.0)

      # set only for libraries ?
      set( CMAKE_POSITION_INDEPENDENT_CODE TRUE)

      # linker stuff
      # prefix libraries with force_load ( OS X)
      set( BEGIN_ALL_LOAD "-Wl,--whole-archive")
      set( END_ALL_LOAD "-Wl,--no-whole-archive")
      set( FORCE_LOAD_PREFIX)

      if( ${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
         set( OS_SPECIFIC_LIBRARIES -lpthread -ldl)
      endif()
   endif()
endif()


if( NOT MULLE_C_COMPILER_ID)
   if( ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows") AND ( "${CMAKE_C_COMPILER_ID}" MATCHES "^(Clang|MulleClang)$") )
      set( MULLE_C_COMPILER_ID "MSVC-${CMAKE_C_COMPILER_ID}")
   else()
      set( MULLE_C_COMPILER_ID "${CMAKE_C_COMPILER_ID}")
   endif()
endif()

if( NOT MULLE_CXX_COMPILER_ID)
   if( ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows") AND ( "${CMAKE_CXX_COMPILER_ID}" MATCHES "^(Clang|MulleClang)$") )
      set( MULLE_CXX_COMPILER_ID "MSVC-${CMAKE_CXX_COMPILER_ID}")
   else()
      set( MULLE_CXX_COMPILER_ID "${CMAKE_CXX_COMPILER_ID}")
   endif()
endif()

if( "${MULLE_C_COMPILER_ID}" MATCHES "^(Clang|AppleClang|MulleClang|GNU)$")
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
else()
   if( "${MULLE_C_COMPILER_ID}" MATCHES "^(Intel|MSVC|MSVC-Clang|MSVC-MulleClang)$")
      # C4068: unwanted pragma
      set( UNWANTED_C_WARNINGS "/D_CRT_SECURE_NO_WARNINGS /wd4068 /wd4113")
   endif()
endif()

if( "${MULLE_C_COMPILER_ID}" MATCHES "^(MSVC-Clang|MSVC-MulleClang)$")
   # need this to emit /include code
   set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fms-extensions")
      # need this so /include code gets used
   set( CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} /LTCG")
   set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /LTCG")
endif()




#
# if using mulle_bootstrap, DEPENDENCIES_DIR is defined and
# mulle-boostrap will set up the paths, so don't mess with it
#
if( NOT DEPENDENCIES_DIR)
   execute_process( COMMAND mulle-bootstrap paths -m dependencies
                    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
                    OUTPUT_VARIABLE DEPENDENCIES_DIR
                    OUTPUT_STRIP_TRAILING_WHITESPACE)
   message( STATUS "DEPENDENCIES_DIR is ${DEPENDENCIES_DIR} according to mulle-bootstrap")
   if( NOT DEPENDENCIES_DIR)
      set( DEPENDENCIES_DIR "dependencies")
      set( CMAKE_FIND_ROOT_PATH ${DEPENDENCIES_DIR})
   endif()
endif()

if( NOT ADDICTIONS_DIR)
   execute_process( COMMAND mulle-bootstrap paths -m addictions
                    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
                    OUTPUT_VARIABLE ADDICTIONS_DIR
                    OUTPUT_STRIP_TRAILING_WHITESPACE)
   message( STATUS "ADDICTIONS_DIR is ${ADDICTIONS_DIR} according to mulle-bootstrap")
   if( NOT ADDICTIONS_DIR)
      set( CMAKE_FIND_ROOT_PATH
${CMAKE_FIND_ROOT_PATH}
${ADDICTIONS_DIR}
)
      set( ADDICTIONS_DIR "addictions")
   endif()
endif()
