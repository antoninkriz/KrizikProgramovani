PROGRAM krizovatka_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    blikani : BOOL;
    generator : TON;
    zpozdovac : TOF;
    prepinani : BOOL;
    generator2 : TON;
    zpozdovac2 : TOF;
    casB2 : TIME;
    casB1 : TIME;
    casA1 : TIME;
    casA2 : TIME;
    prepinac : BOOL;
    zpozdovac3 : TOF;
    casC1 : TIME;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
Krizova krizovatka - 2 smery

Cxx - Cervena
Oxx - Oranzova
Zxx - Zelena
xx = smer (AB, CD, OBA smery)
*)

{NETWORK}
(*
Trvale cervena pro oba smery
*)
  LD_BOOL   "S1"
  ST        "CAB"
  ST        "CCD"
{/NETWORK}

{NETWORK}
(*
Blikajici 1Hz oranzova pro oba smery
*)
  LD_BOOL   "S2"
  ANDN      "blikani"
  {POU:TON} "generator"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#1s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "casA1" {/PIN}
  {/POU}
  ST        "blikani"
  {POU:TOF} "zpozdovac"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#0.5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "casA2" {/PIN}
  {/POU}
  ST        "OOBA"
{/NETWORK}

{NETWORK}
(*
Stridajici se zelena/cervena po 20s menici smery
*)
  LD_BOOL   "S3"
  ANDN      "prepinani"
  {POU:TON} "generator2"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#10s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "casB1" {/PIN}
  {/POU}
  ST        "prepinani"
  {POU:TOF} "zpozdovac2"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "casB2" {/PIN}
  {/POU}
  ST        "prepinac"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "S3"
  AND       "prepinac"
  ST        "ZAB"
  ST        "CCD"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "S3"
  ANDN      "prepinac"
  ST        "ZCD"
  ST        "CAB"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 37 *)    LD_BOOL   S1
(* 38 *)    ST        CAB
(* 39 *)    ST        CCD
(* Network 2 *)
(* 46 *)    LD_BOOL   S2
(* 47 *)    ANDN      blikani
(* 49 *)    ST        generator.IN
(* 48 *)    CAL generator (PT:=T#1s)
(* 52 *)    LD        generator.ET
(* 52 *)    ST        casA1
(* 51 *)    LD        generator.Q
(* 54 *)    ST        blikani
(* 56 *)    ST        zpozdovac.IN
(* 55 *)    CAL zpozdovac (PT:=T#0.5s)
(* 59 *)    LD        zpozdovac.ET
(* 59 *)    ST        casA2
(* 58 *)    LD        zpozdovac.Q
(* 61 *)    ST        OOBA
(* Network 3 *)
(* 68 *)    LD_BOOL   S3
(* 69 *)    ANDN      prepinani
(* 71 *)    ST        generator2.IN
(* 70 *)    CAL generator2 (PT:=T#10s)
(* 74 *)    LD        generator2.ET
(* 74 *)    ST        casB1
(* 73 *)    LD        generator2.Q
(* 76 *)    ST        prepinani
(* 78 *)    ST        zpozdovac2.IN
(* 77 *)    CAL zpozdovac2 (PT:=T#5s)
(* 81 *)    LD        zpozdovac2.ET
(* 81 *)    ST        casB2
(* 80 *)    LD        zpozdovac2.Q
(* 83 *)    ST        prepinac
(* Network 4 *)
(* 90 *)    LD_BOOL   S3
(* 91 *)    AND       prepinac
(* 92 *)    ST        ZAB
(* 93 *)    ST        CCD
(* Network 5 *)
(* 100 *)    LD_BOOL   S3
(* 101 *)    ANDN      prepinac
(* 102 *)    ST        ZCD
(* 103 *)    ST        CAB
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 37:110:0 38:111:0 39:112:0 46:114:0 47:115:0 49:116:0 50:117:0 48:117:0 52:119:0
 51:120:0 54:121:0 56:122:0 57:123:0 55:123:0 59:125:0 58:126:0 61:127:0 68:129:0
 69:130:0 71:131:0 72:132:0 70:132:0 74:134:0 73:135:0 76:136:0 78:137:0 79:138:0
 77:138:0 81:140:0 80:141:0 83:142:0 90:144:0 91:145:0 92:146:0 93:147:0 100:149:0
 101:150:0 102:151:0 103:152:0
}
