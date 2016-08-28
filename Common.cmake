# Just for Mulle-ObjC-Projects, use different branch for ObjC or C
#
# Common stuff for Debug and Release
#
set( CMAKE_C_COMPILER "mulle-clang")
set( CMAKE_CXX_COMPILER "mulle-clang")

include( _Common)

if( NOT DEPENDENCIES_DIR )
   set( DEPENDENCY_FRAMEWORK_DIRS
      ${COMMON_DEPENDENCIES_DIR}/Frameworks
endif()


if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")
else()
   set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
   set( UNWANTED_OBJC_WARNINGS "-Wno-objc-protocol-method-implementation -Wno-objc-root-class -Wno-nullability-completeness -Wno-protocol -Wno-objc-missing-super-calls")
endif()
