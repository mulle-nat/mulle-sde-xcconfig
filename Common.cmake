# Just for Mulle-ObjC-Projects, use different branch for ObjC or C
#
# Common stuff for Debug and Release
#
set( CMAKE_C_COMPILER "mulle-clang")
set( CMAKE_CXX_COMPILER "mulle-clang")

include( _Common)

if( CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(OS_SPECIFIC_LIBS  "-ldl -lpthread")
endif()


if( NOT DEPENDENCIES_DIR)
   set( DEPENDENCY_FRAMEWORK_DIRS
      ${COMMON_DEPENDENCIES_DIR}/Frameworks
   )
endif()


if( CMAKE_C_COMPILER_ID MATCHES "^(Clang|AppleClang|MulleClang|GNU)$")
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
else()
	if( CMAKE_C_COMPILER_ID MATCHES "^(Intel|MSVC)$")
 		# C4068: unwanted pragma
		set( UNWANTED_C_WARNINGS "/D_CRT_SECURE_NO_WARNINGS /wd4068 /wd4113")
	endif()
endif()

message(STATUS "CMAKE_C_COMPILER_ID is ${CMAKE_C_COMPILER_ID}")
