PROGRAM prgMain
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    c1 : TOF;
    c2 : TOF;
    c3 : TOF;
    c4 : TOF;
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
  LD_BOOL   "s1"
  OR        "s2"
  {POU:TOF} "c1"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "sv1"
  OR(
    LD_BOOL   "s1"
    OR        "s2"
    OR        "s3"
    {POU:TOF} "c2"
      {PIN:IN} {/PIN}
      {PIN:PT} "T#5s" {/PIN}
      {PINO:Q} {/PIN}
      {PINO:ET} {/PIN}
    {/POU}
    ST        "sv2"
  )
  OR(
    LD_BOOL   "s2"
    OR        "s3"
    OR        "s4"
    {POU:TOF} "c3"
      {PIN:IN} {/PIN}
      {PIN:PT} "T#5s" {/PIN}
      {PINO:Q} {/PIN}
      {PINO:ET} {/PIN}
    {/POU}
    ST        "sv3"
  )
  OR(
    LD_BOOL   "s3"
    OR        "s4"
    {POU:TOF} "c4"
      {PIN:IN} {/PIN}
      {PIN:PT} "T#5s" {/PIN}
      {PINO:Q} {/PIN}
      {PINO:ET} {/PIN}
    {/POU}
    ST        "sv4"
  )
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 23 *)    LD_BOOL   s1
(* 24 *)    OR        s2
(* 26 *)    ST        c1.IN
(* 25 *)    CAL c1 (PT:=T#5s)
(* 28 *)    LD        c1.Q
(* 31 *)    ST        sv1
(* 32 *)    OR(
(* 33 *)      LD_BOOL   s1
(* 34 *)      OR        s2
(* 35 *)      OR        s3
(* 37 *)      ST        c2.IN
(* 36 *)      CAL c2 (PT:=T#5s)
(* 39 *)      LD        c2.Q
(* 42 *)      ST        sv2
(* 43 *)    )
(* 44 *)    OR(
(* 45 *)      LD_BOOL   s2
(* 46 *)      OR        s3
(* 47 *)      OR        s4
(* 49 *)      ST        c3.IN
(* 48 *)      CAL c3 (PT:=T#5s)
(* 51 *)      LD        c3.Q
(* 54 *)      ST        sv3
(* 55 *)    )
(* 56 *)    OR(
(* 57 *)      LD_BOOL   s3
(* 58 *)      OR        s4
(* 60 *)      ST        c4.IN
(* 59 *)      CAL c4 (PT:=T#5s)
(* 62 *)      LD        c4.Q
(* 65 *)      ST        sv4
(* 66 *)    )
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 23:73:0 24:74:0 26:75:0 27:76:0 25:76:0 28:77:0 31:78:0 33:80:0 34:81:0
 35:82:0 37:83:0 38:84:0 36:84:0 39:85:0 42:86:0 43:87:0 45:89:0 46:90:0
 47:91:0 49:92:0 50:93:0 48:93:0 51:94:0 54:95:0 55:96:0 57:98:0 58:99:0
 60:100:0 61:101:0 59:101:0 62:102:0 65:103:0 66:104:0
}
