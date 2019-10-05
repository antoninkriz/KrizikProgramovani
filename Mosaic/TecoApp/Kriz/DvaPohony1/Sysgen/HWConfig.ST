(* Upozornìní *)
(* Soubor je automaticky regenerován a všechny ruèní modifikace budou ztracené. *)
(* ---------------------------------------------------------------------- *)
(* Generováno pro TC700 *)
(* ********************************************************************** *)
TYPE
  TAIStat : STRUCT
    UNF     : BOOL;
    UNR     : BOOL;
    OVR     : BOOL;
    OVF     : BOOL;
    FLS     : BOOL;
    CJC     : BOOL;
    dummy6 {HIDDEN} : BOOL;
    dummy7 {HIDDEN} : BOOL;
    CHC     : BOOL;
    dummy9 {HIDDEN} : BOOL;
    dummy10 {HIDDEN} : BOOL;
    dummy11 {HIDDEN} : BOOL;
    dummy12 {HIDDEN} : BOOL;
    dummy13 {HIDDEN} : BOOL;
    dummy14 {HIDDEN} : BOOL;
    dummy15 {HIDDEN} : BOOL;
  END_STRUCT;

  TAI : STRUCT
    STAT  : TAIStat;
    FS    : INT;
    ENG   : REAL;
    PCT   : REAL;
  END_STRUCT;

  TBIN_8DI : STRUCT
    DI0  : BOOL;
    DI1  : BOOL;
    DI2  : BOOL;
    DI3  : BOOL;
    DI4  : BOOL;
    DI5  : BOOL;
    DI6  : BOOL;
    DI7  : BOOL;
  END_STRUCT;

  TBIN_4DIP  : STRUCT
    DIP0  : BOOL;
    DIP1  : BOOL;
    DIP2  : BOOL;
    DIP3  : BOOL;
  END_STRUCT;

  TCNTF_IN : STRUCT
    SCNT : UINT;
    VALA : UDINT;
    VALB : UDINT;
  END_STRUCT;

  TCNTF_OUT : STRUCT
    CCNT: UINT; 
    SET : UDINT;
  END_STRUCT;

  TBIN_6DO : STRUCT
    DO0  : BOOL;
    DO1  : BOOL;
    DO2  : BOOL;
    DO3  : BOOL;
    DO4  : BOOL;
    DO5  : BOOL;
  END_STRUCT;

  TCHStatistic : STRUCT
    STAT       : USINT;
    ERR        : USINT;
    trueMes    : UDINT;
    falseMes   : UDINT;
  END_STRUCT;

  TCHControl : STRUCT
    CONTROL  : UINT;
  END_STRUCT;

END_TYPE
(* ********************************************************************** *)
(* ---------------------------------------------------------------------- *)
(* CP-1004 *)
VAR_GLOBAL
  r0_p0_Statistic_CH1  AT %X7500 : TCHStatistic;
  r0_p0_Control_CH1    AT %Y7500 : TCHControl;
END_VAR
(* ---------------------------------------------------------------------- *)
(* MI2-01M *)
VAR_GLOBAL
  r0_p2_Statistic_MI_CIB1 AT %X0   : TCHStatistic;
  r0_p2_Control_MI_CIB1 AT %Y0   : TCHControl;
END_VAR
(* ---------------------------------------------------------------------- *)
(* IR-1057 *)
VAR_GLOBAL
  r0_p3_DI             AT %X10  : TBIN_8DI;
  r0_p3_DIP            AT %X11  : TBIN_4DIP;
  r0_p3_CNT_IN1        AT %X12  : TCNTF_IN;
  r0_p3_CNT_IN2        AT %X22  : TCNTF_IN;
  r0_p3_AI0            AT %X32  : TAI;
  r0_p3_AI1            AT %X44  : TAI;
  r0_p3_AI2            AT %X56  : TAI;
  r0_p3_AI3            AT %X68  : TAI;
  r0_p3_DO             AT %Y2   : TBIN_6DO;
  r0_p3_dummy          AT %Y3   : USINT;
  r0_p3_CNT_OUT1       AT %Y4   : TCNTF_OUT;
  r0_p3_CNT_OUT2       AT %Y10  : TCNTF_OUT;
(* alias *)
  DI0                  AT r0_p3_DI.DI2;
  DI1                  AT r0_p3_DI.DI3;
  DI2                  AT r0_p3_DI.DI4;
  DI3                  AT r0_p3_DI.DI5;
  DI4                  AT r0_p3_DI.DI6;
  DI5                  AT r0_p3_DI.DI7;
  DO0                  AT r0_p3_DO.DO0;
  DO1                  AT r0_p3_DO.DO1;
  START                AT r0_p3_DI.DI0;
  STOP                 AT r0_p3_DI.DI1;
END_VAR
(* -- *)
(* -- *)
VAR_EXTERNAL
END_VAR
(* -- *)

(* ********************************************************************** *)
(* Generováno programem MOSAIC *)
(* © 2001-2013 Teco a.s. *)
(* Verze : 1.2 *)
(* DLL Verze : 13.1.2.247 *)
