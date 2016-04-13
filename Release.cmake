include( Common)

set( DEPENDENCY_FRAMEWORK_DIRS
dependencies/Frameworks/Release
dependencies/Frameworks
)


set( DEPENDENCY_LIBRARY_DIRS
dependencies/lib/Release
dependencies/lib
)


link_directories(${CMAKE_BINARY_DIR}
dependencies/Frameworks/Release
dependencies/Frameworks
dependencies/lib/Release
dependencies/lib
)


set(OTHER_C_FLAGS "-O3 -g -DNDEBUG ${UNWANTED_WARNINGS}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OTHER_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OTHER_C_FLAGS}")
