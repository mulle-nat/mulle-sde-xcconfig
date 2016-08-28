# Just for C-Projects, use different branch for ObjC
#
# Common stuff for Debug and Release
#
include( _Common)


if( (CMAKE_C_COMPILER_ID STREQUAL "Clang") OR
    (CMAKE_C_COMPILER_ID STREQUAL "AppleClang") OR
    (CMAKE_C_COMPILER_ID STREQUAL "MulleClang") OR
    (CMAKE_C_COMPILER_ID STREQUAL "GNU"))
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
endif()

message(STATUS "CMAKE_C_COMPILER_ID is ${CMAKE_C_COMPILER_ID}")
