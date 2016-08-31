# Just for C-Projects, use different branch for ObjC
#
# Common stuff for Debug and Release
#
include( _Common)

if( CMAKE_C_COMPILER_ID MATCHES "^(Clang|AppleClang|MulleClang|GNU)$")
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
else()
	if( CMAKE_C_COMPILER_ID MATCHES "^(Intel|MSVC)$")
 		# C4068: unwanted pragma
		set( UNWANTED_C_WARNINGS "/D_CRT_SECURE_NO_WARNINGS /wd4068 /wd4113")
	endif()
endif()

message(STATUS "CMAKE_C_COMPILER_ID is ${CMAKE_C_COMPILER_ID}")
