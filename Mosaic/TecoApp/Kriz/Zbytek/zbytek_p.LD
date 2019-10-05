PROGRAM zbytek_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    casovac : TON;
    imp : BOOL;
    cas : TIME;
    citac : CTUD;
    max : BOOL;
    min : BOOL;
    prep : BOOL;
    h : INT;
    licha : BOOL;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Komentáø ke schématu
*)

{NETWORK}
(*
  Komentáø k obvodu
*)
  LD_BOOL   "S1"
  ANDN      "imp"
  {POU:TON} "casovac"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#1s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "cas" {/PIN}
  {/POU}
  ST        "imp"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "imp"
  AND       "S1"
  AND       "prep"
  {POU:CTUD} "citac"
    {PIN:CU} {/PIN}
    {PIN:CD}
      LD_BOOL   "imp"
      AND       "S1"
      ANDN      "prep"
    {/PIN}
    {PIN:R} {/PIN}
    {PIN:LD} {/PIN}
    {PIN:PV} "10" {/PIN}
    {PINO:QU} {/PIN}
    {PINO:QD} "min" {/PIN}
    {PINO:CV} "h" {/PIN}
  {/POU}
  ST        "max"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "min"
  OR        "prep"
  ANDN      "max"
  ST        "prep"
{/NETWORK}

{NETWORK}
(*

*)
  {POU:MOD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "h" {/PIN}
    {PIN:IN2} "2" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "licha" {/PIN}
  {/POU}
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 28 *)    LD_BOOL   S1
(* 29 *)    ANDN      imp
(* 31 *)    ST        casovac.IN
(* 30 *)    CAL casovac (PT:=T#1s)
(* 34 *)    LD        casovac.ET
(* 34 *)    ST        cas
(* 33 *)    LD        casovac.Q
(* 36 *)    ST        imp
(* Network 2 *)
(* 43 *)    LD_BOOL   imp
(* 44 *)    AND       S1
(* 45 *)    AND       prep
{CREATE_TEMP=__Tmp_1}
(* 46 *)    ST        __Tmp_1
(* 49 *)    LD_BOOL   imp
(* 50 *)    AND       S1
(* 51 *)    ANDN      prep
{CREATE_TEMP=__Tmp_2}
(* 48 *)    ST        __Tmp_2
(* 46 *)    CAL citac (CU:=__Tmp_1,CD:=__Tmp_2,R:=citac.R,LD:=citac.LD,PV:=10)
(* 57 *)    LD        citac.QD
(* 57 *)    ST        min
(* 58 *)    LD        citac.CV
(* 58 *)    ST        h
(* 56 *)    LD        citac.QU
(* 60 *)    ST        max
(* Network 3 *)
(* 67 *)    LD_BOOL   min
(* 68 *)    OR        prep
(* 69 *)    ANDN      max
(* 70 *)    ST        prep
(* Network 4 *)
(* 78 *)    LD_bool true
(* 78 *)    JMPCN __PouSkip_77
(* 77 *)    LD        h
(* 80 *)    MOD       2
(* 82 *)    ST        licha
(* 81 *)    LD_bool true
(* 77 *)  __PouSkip_77:
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 28:90:0 29:91:0 31:92:0 32:93:0 30:93:0 34:95:0 33:96:0 36:97:0 43:99:0
 44:100:0 45:101:0 49:104:0 50:105:0 51:106:0 47:109:1 48:109:2 53:109:0 54:109:0
 55:109:0 46:109:0 57:111:0 58:113:0 56:114:0 60:115:0 67:117:0 68:118:0 69:119:0
 70:120:0 78:123:0 79:124:0 80:125:0 82:126:0
}
