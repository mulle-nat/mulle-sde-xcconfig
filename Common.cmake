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
else()
	if( (CMAKE_C_COMPILER_ID STREQUAL "Intel") OR
       (CMAKE_C_COMPILER_ID STREQUAL "MSVC"))
    	# C4068: unwanted pragma
      set( UNWANTED_C_WARNINGS "/wd4068")
	endif()
endif()

message(STATUS "CMAKE_C_COMPILER_ID is ${CMAKE_C_COMPILER_ID}")
