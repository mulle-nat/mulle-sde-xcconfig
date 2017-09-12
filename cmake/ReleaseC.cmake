#
# Set Compiler Flags
# Optimization flags left to CMake
if( MULLE_C_COMPILER_ID MATCHES "^(Intel|MSVC|MSVC-Clang|MSVC-MulleClang)$")
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} /DNDEBUG=1")
else()
   set( OTHER_C_FLAGS "${OTHER_C_FLAGS} -DNDEBUG=1")
endif()
