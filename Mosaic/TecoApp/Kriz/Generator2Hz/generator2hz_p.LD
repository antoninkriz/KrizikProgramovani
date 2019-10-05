PROGRAM generator2hz_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    c1 : TP;
    c2 : TON;
    impulzy : BOOL;
    cit : CTUD;
    hodnota : INT;
    citReset : TON;
    impReset : BOOL;
    nerovno2 : BOOL;
    NEFUNGUJE : BOOL;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Komentáø ke schématu
*)

{NETWORK}
(*
Generator 2Hz
*)
  LDN_BOOL  "impulzy"
  {POU:TON} "c2"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#0.25s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  {POU:TP} "c1"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#0.25s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "impulzy"
{/NETWORK}

{NETWORK}
(*
Porovnani kazdou vterinu, jestli probehlo presne 2 impulzu
*)
  LD_BOOL   "impReset"
  {POU:NE}
    {PIN:EN} {/PIN}
    {PIN:IN1} "hodnota" {/PIN}
    {PIN:IN2} "2" {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  ST        "nerovno2"
{/NETWORK}

{NETWORK}
(*
Citac impulzu za vterinu
*)
  LD_BOOL   "impulzy"
  {POU:CTUD} "cit"
    {PIN:CU} {/PIN}
    {PIN:CD} {/PIN}
    {PIN:R}
      LDN_BOOL  "impReset"
      {POU:TON} "citReset"
        {PIN:IN} {/PIN}
        {PIN:PT} "T#1s" {/PIN}
        {PINO:Q} {/PIN}
        {PINO:ET} {/PIN}
      {/POU}
    {/PIN}
    {PIN:LD} {/PIN}
    {PIN:PV} "255" {/PIN}
    {PINO:QU} {/PIN}
    {PINO:QD} "impReset" {/PIN}
    {PINO:CV} "hodnota" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*
Pokud se na NEFUNGUJE objevi 1, obvod nepracuje spravne
*)
  LD_BOOL   "nerovno2"
  OR        "NEFUNGUJE"
  ST        "NEFUNGUJE"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 28 *)    LDN_BOOL  impulzy
(* 30 *)    ST        c2.IN
(* 29 *)    CAL c2 (PT:=T#0.25s)
(* 32 *)    LD        c2.Q
(* 36 *)    ST        c1.IN
(* 35 *)    CAL c1 (PT:=T#0.25s)
(* 38 *)    LD        c1.Q
(* 41 *)    ST        impulzy
(* Network 2 *)
(* 48 *)    LD_BOOL   impReset
(* 50 *)    JMPCN __PouSkip_49
(* 49 *)    LD        hodnota
(* 52 *)    NE        2
(* 53 *)    __CR_TEST
(* 49 *)  __PouSkip_49:
(* 55 *)    ST        nerovno2
(* Network 3 *)
(* 62 *)    LD_BOOL   impulzy
{CREATE_TEMP=__Tmp_1}
(* 63 *)    ST        __Tmp_1
(* 67 *)    LDN_BOOL  impReset
(* 69 *)    ST        citReset.IN
(* 68 *)    CAL citReset (PT:=T#1s)
(* 71 *)    LD        citReset.Q
{CREATE_TEMP=__Tmp_2}
(* 66 *)    ST        __Tmp_2
(* 63 *)    CAL cit (CU:=__Tmp_1,CD:=cit.CD,R:=__Tmp_2,LD:=cit.LD,PV:=255)
(* 78 *)    LD        cit.QD
(* 78 *)    ST        impReset
(* 79 *)    LD        cit.CV
(* 79 *)    ST        hodnota
(* 77 *)    LD        cit.QU
(* Network 4 *)
(* 87 *)    LD_BOOL   nerovno2
(* 88 *)    OR        NEFUNGUJE
(* 89 *)    ST        NEFUNGUJE
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 28:96:0 30:97:0 31:98:0 29:98:0 32:99:0 36:100:0 37:101:0 35:101:0 38:102:0
 41:103:0 48:105:0 50:106:0 51:107:0 52:108:0 53:109:0 55:111:0 62:113:0 67:116:0
 69:117:0 70:118:0 68:118:0 71:119:0 64:122:1 65:122:0 66:122:2 75:122:0 76:122:0
 63:122:0 78:124:0 79:126:0 77:127:0 87:129:0 88:130:0 89:131:0
}
