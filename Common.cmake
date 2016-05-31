# Just for C-Projects, use different branch for ObjC
# TODO: move stuff to _Common for really common C and ObjC projects...
#
set( UNWANTED_WARNINGS "-Wno-objc-protocol-method-implementation -Wno-objc-root-class -Wno-parentheses -Wno-nullability-completeness -Wno-protocol -Wno-objc-missing-super-calls -Wno-int-to-void-pointer-cast")

if(APPLE)
  # baseline set to 10.6 for rpath
  set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -all_load")
  set(CMAKE_POSITION_INDEPENDENT_CODE FALSE)
else()
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--whole-archive")
  set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
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

