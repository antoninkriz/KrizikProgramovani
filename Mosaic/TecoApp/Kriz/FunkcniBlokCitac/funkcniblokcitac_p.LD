PROGRAM funkcniblokcitac_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    citac : CTUD;
    generator : TON;
    impulzy : BOOL;
    cas : TIME;
    max : BOOL;
    min : BOOL;
    hodnota : INT;
    preklop : BOOL;
    mala : BOOL;
    velka : BOOL;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Komentáø ke schématu
*)

{NETWORK}
(*
Generator 1Hz impulzu

1
___|___|___|___|__
0
*)
  LD_BOOL   "s1"
  ANDN      "impulzy"
  {POU:TON} "generator"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#1s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "cas" {/PIN}
  {/POU}
  ST        "impulzy"
{/NETWORK}

{NETWORK}
(*
  Komentáø k obvodu
*)
  LD_BOOL   "s2"
  AND       "impulzy"
  ANDN      "preklop"
  {POU:CTUD} "citac"
    {PIN:CU} {/PIN}
    {PIN:CD}
      LD_BOOL   "s2"
      AND       "impulzy"
      AND       "preklop"
    {/PIN}
    {PIN:R}
      LD_BOOL   "s3"
      OR        "max"
    {/PIN}
    {PIN:LD}
      LD_BOOL   "s5"
    {/PIN}
    {PIN:PV} "10" {/PIN}
    {PINO:QU} {/PIN}
    {PINO:QD} "min" {/PIN}
    {PINO:CV} "hodnota" {/PIN}
  {/POU}
  ST        "max"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "max"
  OR        "preklop"
  ANDN      "min"
  ST        "preklop"
{/NETWORK}

{NETWORK}
(*

*)
  {POU:GE}
    {PIN:EN} {/PIN}
    {PIN:IN1} "hodnota" {/PIN}
    {PIN:IN2} "3" {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  {POU:LT}
    {PIN:EN} {/PIN}
    {PIN:IN1} "hodnota" {/PIN}
    {PIN:IN2} "5" {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  ST        "mala"
{/NETWORK}

{NETWORK}
(*

*)
  {POU:GT}
    {PIN:EN} {/PIN}
    {PIN:IN1} "hodnota" {/PIN}
    {PIN:IN2} "7" {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  {POU:LE}
    {PIN:EN} {/PIN}
    {PIN:IN1} "hodnota" {/PIN}
    {PIN:IN2} "9" {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  ST        "velka"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 33 *)    LD_BOOL   s1
(* 34 *)    ANDN      impulzy
(* 36 *)    ST        generator.IN
(* 35 *)    CAL generator (PT:=T#1s)
(* 39 *)    LD        generator.ET
(* 39 *)    ST        cas
(* 38 *)    LD        generator.Q
(* 41 *)    ST        impulzy
(* Network 2 *)
(* 48 *)    LD_BOOL   s2
(* 49 *)    AND       impulzy
(* 50 *)    ANDN      preklop
{CREATE_TEMP=__Tmp_1}
(* 51 *)    ST        __Tmp_1
(* 54 *)    LD_BOOL   s2
(* 55 *)    AND       impulzy
(* 56 *)    AND       preklop
{CREATE_TEMP=__Tmp_2}
(* 53 *)    ST        __Tmp_2
(* 59 *)    LD_BOOL   s3
(* 60 *)    OR        max
{CREATE_TEMP=__Tmp_3}
(* 58 *)    ST        __Tmp_3
(* 51 *)    CAL citac (CU:=__Tmp_1,CD:=__Tmp_2,R:=__Tmp_3,LD:=s5,PV:=10)
(* 67 *)    LD        citac.QD
(* 67 *)    ST        min
(* 68 *)    LD        citac.CV
(* 68 *)    ST        hodnota
(* 66 *)    LD        citac.QU
(* 70 *)    ST        max
(* Network 3 *)
(* 77 *)    LD_BOOL   max
(* 78 *)    OR        preklop
(* 79 *)    ANDN      min
(* 80 *)    ST        preklop
(* Network 4 *)
(* 88 *)    LD_bool true
(* 88 *)    JMPCN __PouSkip_87
(* 87 *)    LD        hodnota
(* 90 *)    GE        3
(* 91 *)    __CR_TEST
(* 87 *)  __PouSkip_87:
(* 94 *)    JMPCN __PouSkip_93
(* 93 *)    LD        hodnota
(* 96 *)    LT        5
(* 97 *)    __CR_TEST
(* 93 *)  __PouSkip_93:
(* 99 *)    ST        mala
(* Network 5 *)
(* 107 *)    LD_bool true
(* 107 *)    JMPCN __PouSkip_106
(* 106 *)    LD        hodnota
(* 109 *)    GT        7
(* 110 *)    __CR_TEST
(* 106 *)  __PouSkip_106:
(* 113 *)    JMPCN __PouSkip_112
(* 112 *)    LD        hodnota
(* 115 *)    LE        9
(* 116 *)    __CR_TEST
(* 112 *)  __PouSkip_112:
(* 118 *)    ST        velka
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 33:125:0 34:126:0 36:127:0 37:128:0 35:128:0 39:130:0 38:131:0 41:132:0 48:134:0
 49:135:0 50:136:0 54:139:0 55:140:0 56:141:0 59:144:0 60:145:0 52:148:1 53:148:2
 58:148:3 62:148:0 65:148:0 51:148:0 67:150:0 68:152:0 66:153:0 70:154:0 77:156:0
 78:157:0 79:158:0 80:159:0 88:162:0 89:163:0 90:164:0 91:165:0 94:167:0 95:168:0
 96:169:0 97:170:0 99:172:0 107:175:0 108:176:0 109:177:0 110:178:0 113:180:0 114:181:0
 115:182:0 116:183:0 118:185:0
}
