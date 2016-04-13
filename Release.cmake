include( Common)

set( DEPENDENCY_FRAMEWORK_DIRS
dependencies/Frameworks/Release
dependencies/Frameworks
)

set( DEPENDENCY_LIBRARY_DIRS
dependencies/lib/Release
dependencies/lib
)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -g -DNDEBUG -Wno-parentheses")

