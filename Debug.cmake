#
#
#
include( Common)
include( CommonC)
include( DebugC)

if( "${MULLE_LANGUAGE}" STREQUAL "ObjC")
   include( CommonObjC)
   include( DebugObjC)
endif()

include( PathsAndFlags)
include( Final)
