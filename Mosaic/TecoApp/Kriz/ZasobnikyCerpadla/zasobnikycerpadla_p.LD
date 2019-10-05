PROGRAM zasobnikycerpadla_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
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
  LD_BOOL   "CERP"
  ANDN      "L90"
  OR(
    LDN_BOOL  "L90"
    AND(
      LDN_BOOL  "L80"
      ANDN      "P80"
      ORN       "L50"
    )
  )
  ST        "LVENT"
  OR(
    LD_BOOL   "CERP"
    ANDN      "P90"
    OR(
      LDN_BOOL  "P90"
      AND(
        LDN_BOOL  "P80"
        ANDN      "L80"
        ORN       "P50"
      )
    )
    ANDN      "LVENT"
    ST        "PVENT"
  )
  ST        "CERP"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 19 *)    LD_BOOL   CERP
(* 20 *)    ANDN      L90
(* 21 *)    OR(
(* 22 *)      LDN_BOOL  L90
(* 23 *)      AND(
(* 24 *)        LDN_BOOL  L80
(* 25 *)        ANDN      P80
(* 26 *)        ORN       L50
(* 27 *)      )
(* 28 *)    )
(* 29 *)    ST        LVENT
(* 30 *)    OR(
(* 31 *)      LD_BOOL   CERP
(* 32 *)      ANDN      P90
(* 33 *)      OR(
(* 34 *)        LDN_BOOL  P90
(* 35 *)        AND(
(* 36 *)          LDN_BOOL  P80
(* 37 *)          ANDN      L80
(* 38 *)          ORN       P50
(* 39 *)        )
(* 40 *)      )
(* 41 *)      ANDN      LVENT
(* 42 *)      ST        PVENT
(* 43 *)    )
(* 44 *)    ST        CERP
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 19:51:0 20:52:0 22:54:0 24:56:0 25:57:0 26:58:0 27:59:0 28:60:0 29:61:0
 31:63:0 32:64:0 34:66:0 36:68:0 37:69:0 38:70:0 39:71:0 40:72:0 41:73:0
 42:74:0 43:75:0 44:76:0
}
