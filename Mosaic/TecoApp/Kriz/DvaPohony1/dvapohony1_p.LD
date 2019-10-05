PROGRAM dvapohony1_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    beh : BOOL;
    casovac : TON;
    casBezi : BOOL;
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
  LD_BOOL   "START"
  AND       "DI0"
  AND       "DI2"
  OR        "beh"
  ANDN      "STOP"
  ST        "beh"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  ANDN      "casBezi"
  ST        "DO0"
  AND       "DI1"
  ANDN      "STOP"
  ST        "DO1"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "DI1"
  AND       "DI3"
  {POU:TON} "casovac"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "casBezi"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 22 *)    LD_BOOL   START
(* 23 *)    AND       DI0
(* 24 *)    AND       DI2
(* 25 *)    OR        beh
(* 26 *)    ANDN      STOP
(* 27 *)    ST        beh
(* Network 2 *)
(* 34 *)    LD_BOOL   beh
(* 35 *)    ANDN      casBezi
(* 36 *)    ST        DO0
(* 37 *)    AND       DI1
(* 38 *)    ANDN      STOP
(* 39 *)    ST        DO1
(* Network 3 *)
(* 46 *)    LD_BOOL   DI1
(* 47 *)    AND       DI3
(* 49 *)    ST        casovac.IN
(* 48 *)    CAL casovac (PT:=T#5s)
(* 51 *)    LD        casovac.Q
(* 54 *)    ST        casBezi
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 22:61:0 23:62:0 24:63:0 25:64:0 26:65:0 27:66:0 34:68:0 35:69:0 36:70:0
 37:71:0 38:72:0 39:73:0 46:75:0 47:76:0 49:77:0 50:78:0 48:78:0 51:79:0
 54:80:0
}
