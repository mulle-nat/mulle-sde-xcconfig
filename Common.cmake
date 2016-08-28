#
# Just for C-Projects, use different branch for ObjC
#
# Common stuff for Debug and Release
#
include( _Common)


if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")
else()
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
endif()
