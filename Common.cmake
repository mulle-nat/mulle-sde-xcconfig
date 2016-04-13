include_directories( BEFORE SYSTEM
dependencies/include
)

# baseline set to 10.6 for rpath
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.6" CACHE STRING "Deployment target for OSX" FORCE)


set( UNWANTED_WARNINGS
-Wno-objc-protocol-method-implementation
-Wno-objc-root-class
-Wno-parentheses
-Wno-nullability-completeness
)
