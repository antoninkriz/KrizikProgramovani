PROGRAM pohybbrusky_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    beh : BOOL;
    zastav : BOOL;
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
  AND       "Leva"
  OR        "beh"
  OR(
    LD_BOOL   "STOP"
    OR(
      LD_BOOL   "zastav"
      AND       "beh"
    )
    ST        "zastav"
  )
  AND(
    LDN_BOOL  "zastav"
    OR(
      LD_BOOL   "zastav"
      ANDN      "Leva"
    )
  )
  ST        "beh"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  AND(
    LD_BOOL   "Leva"
    OR        "Vpravo"
  )
  ANDN      "Prava"
  ST        "Vpravo"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  AND(
    LD_BOOL   "Prava"
    OR        "Vlevo"
  )
  ANDN      "Leva"
  ST        "Vlevo"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 21 *)    LD_BOOL   START
(* 22 *)    AND       Leva
(* 23 *)    OR        beh
(* 24 *)    OR(
(* 25 *)      LD_BOOL   STOP
(* 26 *)      OR(
(* 27 *)        LD_BOOL   zastav
(* 28 *)        AND       beh
(* 29 *)      )
(* 30 *)      ST        zastav
(* 31 *)    )
(* 32 *)    AND(
(* 33 *)      LDN_BOOL  zastav
(* 34 *)      OR(
(* 35 *)        LD_BOOL   zastav
(* 36 *)        ANDN      Leva
(* 37 *)      )
(* 38 *)    )
(* 39 *)    ST        beh
(* Network 2 *)
(* 46 *)    LD_BOOL   beh
(* 47 *)    AND(
(* 48 *)      LD_BOOL   Leva
(* 49 *)      OR        Vpravo
(* 50 *)    )
(* 51 *)    ANDN      Prava
(* 52 *)    ST        Vpravo
(* Network 3 *)
(* 59 *)    LD_BOOL   beh
(* 60 *)    AND(
(* 61 *)      LD_BOOL   Prava
(* 62 *)      OR        Vlevo
(* 63 *)    )
(* 64 *)    ANDN      Leva
(* 65 *)    ST        Vlevo
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 21:72:0 22:73:0 23:74:0 25:76:0 27:78:0 28:79:0 29:80:0 30:81:0 31:82:0
 33:84:0 35:86:0 36:87:0 37:88:0 38:89:0 39:90:0 46:92:0 48:94:0 49:95:0
 50:96:0 51:97:0 52:98:0 59:100:0 61:102:0 62:103:0 63:104:0 64:105:0 65:106:0
}
