#include "__cf_playtime.h"
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "playtime_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "playtime.h"
#include "playtime_capi.h"
#include "playtime_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"playtime/Abs" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 1 , 0 ,
TARGET_STRING ( "playtime/Product" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
0 } , { 2 , 0 , TARGET_STRING ( "playtime/Dead Zone Dynamic/Diff" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 3 , 0 , TARGET_STRING (
"playtime/Ramp/Step" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 2 } , { 0 , 0
, ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const
rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 4 , TARGET_STRING (
"playtime/Ramp" ) , TARGET_STRING ( "slope" ) , 0 , 0 , 0 } , { 5 ,
TARGET_STRING ( "playtime/Ramp" ) , TARGET_STRING ( "start" ) , 0 , 0 , 0 } ,
{ 6 , TARGET_STRING ( "playtime/Ramp" ) , TARGET_STRING ( "InitialOutput" ) ,
0 , 0 , 0 } , { 7 , TARGET_STRING ( "playtime/Constant" ) , TARGET_STRING (
"Value" ) , 0 , 0 , 0 } , { 8 , TARGET_STRING ( "playtime/Constant1" ) ,
TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 9 , TARGET_STRING (
"playtime/Sine Wave" ) , TARGET_STRING ( "Amplitude" ) , 0 , 0 , 0 } , { 10 ,
TARGET_STRING ( "playtime/Sine Wave" ) , TARGET_STRING ( "Bias" ) , 0 , 0 , 0
} , { 11 , TARGET_STRING ( "playtime/Sine Wave" ) , TARGET_STRING (
"Frequency" ) , 0 , 0 , 0 } , { 12 , TARGET_STRING ( "playtime/Sine Wave" ) ,
TARGET_STRING ( "Phase" ) , 0 , 0 , 0 } , { 13 , TARGET_STRING (
"playtime/Ramp/Step" ) , TARGET_STRING ( "Before" ) , 0 , 0 , 0 } , { 0 , (
NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static const rtwCAPI_ModelParameters
rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . g3vskftzoo , & rtB . jstaq2zmwu ,
& rtB . mez0jeven3 , & rtB . oxasztvgku , & rtP . Ramp_slope , & rtP .
Ramp_start , & rtP . Ramp_InitialOutput , & rtP . Constant_Value , & rtP .
Constant1_Value , & rtP . SineWave_Amp , & rtP . SineWave_Bias , & rtP .
SineWave_Freq , & rtP . SineWave_Phase , & rtP . Step_Y0 , } ; static int32_T
* rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
1 , 1 } ; static const real_T rtcapiStoredFloats [ ] = { 0.0 , 1.0 } ; static
const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( NULL ) , ( NULL ) , 2 , 0 } , { ( const void * )
& rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 0 ] , 0
, 0 } , { ( const void * ) & rtcapiStoredFloats [ 0 ] , ( const void * ) &
rtcapiStoredFloats [ 1 ] , 1 , 0 } } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 4 , ( NULL ) , 0 , ( NULL ) , 0 } , {
rtBlockParameters , 10 , rtModelParameters , 0 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 1484990782U , 2024521866U , 1512096241U ,
2033382069U } , ( NULL ) , 0 , 0 } ; const rtwCAPI_ModelMappingStaticInfo *
playtime_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void playtime_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void playtime_host_InitializeDataMapInfo ( playtime_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
