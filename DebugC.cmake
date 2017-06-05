#
# Set Search Paths
#

set( COMMON_LIBRARY_DIRS
"${DEPENDENCIES_DIR}/Debug/lib"
"${COMMON_LIBRARY_DIRS}"
)


#
# Set Compiler Flags
#

if( MULLE_C_COMPILER_ID MATCHES "^(Intel|MSVC|MSVC-Clang|MSVC-MulleClang)$")
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} /Od /DEBUG /Zi /DDEBUG=1")
else()
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} -O0 -g -DDEBUG")
endif()
