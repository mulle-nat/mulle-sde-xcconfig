#
#
#
include( Common)
include( CommonC)
include( ReleaseC)

if( "${MULLE_LANGUAGE}" STREQUAL "ObjC")
   include( CommonObjC)
   include( ReleaseObjC)
endif()

include( PathsAndFlags)
include( Final)
