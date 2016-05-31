# just for ObjC-Projects, use different branch for C

set( UNWANTED_C_WARNINGS "-Wno-parentheses -Wno-int-to-void-pointer-cast")
set( UNWANTED_OBJC_WARNINGS "-Wno-objc-protocol-method-implementation -Wno-objc-root-class -Wno-nullability-completeness -Wno-protocol -Wno-objc-missing-super-calls")


set( CMAKE_C_COMPILER "mulle-clang")
set( CMAKE_CXX_COMPILER "mulle-clang")


if(APPLE)
  # baseline set to 10.6 for rpath
  set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)
  set(CMAKE_POSITION_INDEPENDENT_CODE FALSE)
  set(BEGIN_ALL_LOAD "-all_load")
  set(END_ALL_LOAD)
else()
  set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
  set(BEGIN_ALL_LOAD "-Wl,--whole-archive")
  set(END_ALL_LOAD "-Wl,--no-whole-archive")
endif()



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

