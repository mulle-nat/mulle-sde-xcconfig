set(CMAKE_OSX_DEPLOYMENT_TARGET "10.4" CACHE STRING "Deployment target for OSX" FORCE)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -g -DNDEBUG -Wno-parentheses -Wno-objc-missing-super-calls -Wno-objc-protocol-method-implementation -Wno-objc-root-class -Wno-parentheses -Wno-nullability-completeness"")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -g -DNDEBUG -Wno-parentheses -Wno-objc-missing-super-calls -Wno-objc-protocol-method-implementation -Wno-objc-root-class -Wno-parentheses -Wno-nullability-completeness")

