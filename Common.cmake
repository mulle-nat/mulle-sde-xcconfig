# Just for Mulle-ObjC-Projects, use different branch for ObjC or C
#
# Common stuff for Debug and Release
#

include( _Common)

if( CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(OS_SPECIFIC_LIBS  "-ldl -lpthread")
endif()


if( NOT DEPENDENCIES_DIR)
   set( DEPENDENCY_FRAMEWORK_DIRS
      ${COMMON_DEPENDENCIES_DIR}/Frameworks
   )
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

message(STATUS "CMAKE_SYSTEM_NAME is ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_C_COMPILER_ID is ${CMAKE_C_COMPILER_ID}")
message(STATUS "MULLE_C_COMPILER_ID is ${MULLE_C_COMPILER_ID}")
