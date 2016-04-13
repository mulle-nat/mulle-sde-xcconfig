include( Common)

set( DEPENDENCY_FRAMEWORK_DIRS
dependencies/Frameworks/Debug
dependencies/Frameworks/Release
dependencies/Frameworks
)

set( DEPENDENCY_LIBRARY_DIRS
dependencies/lib/Debug
dependencies/lib/Release
dependencies/lib
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -g -Wno-parentheses")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -g -Wno-parentheses")

