# Just for C-Projects, use different branch for ObjC

# baseline set to 10.6 for rpath
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)


if( ${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
   if( CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64" )
      set (CMAKE_POSITION_INDEPENDENT_CODE TRUE)
   endif()
endif()

set( UNWANTED_WARNINGS "-Wno-objc-protocol-method-implementation -Wno-objc-root-class -Wno-parentheses -Wno-nullability-completeness -Wno-protocol -Wno-objc-missing-super-calls")


#
# if using mulle_bootstrap, DEPENDENCIES_DIR  is defined and
# mulle-boostrap will set up the paths, so don't mess with it
#
# These setting are for ppl. who build the project as a top
# level project
#
if( NOT DEPENDENCIES_DIR )

   set( DEPENDENCY_FRAMEWORK_DIRS
   dependencies/Frameworks/Release
   dependencies/Frameworks
   )

   set( DEPENDENCY_LIBRARY_DIRS
   dependencies/lib/Release
   dependencies/lib
   )

   include_directories( BEFORE SYSTEM
      dependencies/include
   )
endif()

