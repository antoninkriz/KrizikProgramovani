PROGRAM bubenpracky_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    beh : BOOL;
    cProg : TP;
    cP : TP;
    cL : TP;
    pauza : BOOL;
    cX : TP;
    cY : TP;
    pauza2 : BOOL;
    ct : CTUD;
    limit : BOOL;
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
  LD_EDGE   "b2"
  OR(
    LD_BOOL   "beh"
    {POU:TP} "cProg"
      {PIN:IN} {/PIN}
      {PIN:PT} "T#60s" {/PIN}
      {PINO:Q} {/PIN}
      {PINO:ET} {/PIN}
    {/POU}
  )
  ANDN      "limit"
  ST        "beh"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "pauza2"
  {POU:CTUD} "ct"
    {PIN:CU} {/PIN}
    {PIN:CD} {/PIN}
    {PIN:R}
      LD_EDGE   "b2"
    {/PIN}
    {PIN:LD} {/PIN}
    {PIN:PV} "2" {/PIN}
    {PINO:QU} {/PIN}
    {PINO:QD} {/PIN}
    {PINO:CV} {/PIN}
  {/POU}
  ST        "limit"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  ANDN      "pauza"
  ANDN      "pauza2"
  ANDN      "d3"
  {POU:TP} "cP"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#10s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "d2"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  ANDN      "d2"
  {POU:TP} "cX"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "pauza"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  ANDN      "pauza"
  ANDN      "d2"
  {POU:TP} "cL"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#10s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "d3"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  ANDN      "pauza"
  ANDN      "d2"
  ANDN      "d3"
  {POU:TP} "cY"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "pauza2"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 29 *)    LD_EDGE   b2
(* 30 *)    OR(
(* 31 *)      LD_BOOL   beh
(* 33 *)      ST        cProg.IN
(* 32 *)      CAL cProg (PT:=T#60s)
(* 35 *)      LD        cProg.Q
(* 38 *)    )
(* 39 *)    ANDN      limit
(* 40 *)    ST        beh
(* Network 2 *)
(* 47 *)    LD_BOOL   pauza2
{CREATE_TEMP=__Tmp_1}
(* 48 *)    ST        __Tmp_1
(* 52 *)    LD_EDGE   b2
{CREATE_TEMP=__Tmp_2}
(* 51 *)    ST        __Tmp_2
(* 48 *)    CAL ct (CU:=__Tmp_1,CD:=ct.CD,R:=__Tmp_2,LD:=ct.LD,PV:=2)
(* 56 *)    LD        ct.QU
(* 60 *)    ST        limit
(* Network 3 *)
(* 67 *)    LD_BOOL   beh
(* 68 *)    ANDN      pauza
(* 69 *)    ANDN      pauza2
(* 70 *)    ANDN      d3
(* 72 *)    ST        cP.IN
(* 71 *)    CAL cP (PT:=T#10s)
(* 74 *)    LD        cP.Q
(* 77 *)    ST        d2
(* Network 4 *)
(* 84 *)    LD_BOOL   beh
(* 85 *)    ANDN      d2
(* 87 *)    ST        cX.IN
(* 86 *)    CAL cX (PT:=T#5s)
(* 89 *)    LD        cX.Q
(* 92 *)    ST        pauza
(* Network 5 *)
(* 99 *)    LD_BOOL   beh
(* 100 *)    ANDN      pauza
(* 101 *)    ANDN      d2
(* 103 *)    ST        cL.IN
(* 102 *)    CAL cL (PT:=T#10s)
(* 105 *)    LD        cL.Q
(* 108 *)    ST        d3
(* Network 6 *)
(* 115 *)    LD_BOOL   beh
(* 116 *)    ANDN      pauza
(* 117 *)    ANDN      d2
(* 118 *)    ANDN      d3
(* 120 *)    ST        cY.IN
(* 119 *)    CAL cY (PT:=T#5s)
(* 122 *)    LD        cY.Q
(* 125 *)    ST        pauza2
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 29:132:0 31:134:0 33:135:0 34:136:0 32:136:0 35:137:0 38:138:0 39:139:0 40:140:0
 47:142:0 52:145:0 49:148:1 50:148:0 51:148:2 54:148:0 55:148:0 48:148:0 56:149:0
 60:150:0 67:152:0 68:153:0 69:154:0 70:155:0 72:156:0 73:157:0 71:157:0 74:158:0
 77:159:0 84:161:0 85:162:0 87:163:0 88:164:0 86:164:0 89:165:0 92:166:0 99:168:0
 100:169:0 101:170:0 103:171:0 104:172:0 102:172:0 105:173:0 108:174:0 115:176:0 116:177:0
 117:178:0 118:179:0 120:180:0 121:181:0 119:181:0 122:182:0 125:183:0
}
