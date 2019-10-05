PROGRAM dvapohony2_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    beh : BOOL;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Komentáø ke schématu
*)

{NETWORK}
(*
------------------------------------------------------
*)
  LD_BOOL   "START"
  AND       "Vp1"
  AND       "Vp2"
  OR        "beh"
  ANDN      "STOP"
  ST        "beh"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  ST        "P1"
  AND       "Pp1"
  ANDN      "Pp2"
  ST        "P2"
  AND       "Vp2"
  STN       "P1"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 20 *)    LD_BOOL   START
(* 21 *)    AND       Vp1
(* 22 *)    AND       Vp2
(* 23 *)    OR        beh
(* 24 *)    ANDN      STOP
(* 25 *)    ST        beh
(* Network 2 *)
(* 32 *)    LD_BOOL   beh
(* 33 *)    ST        P1
(* 34 *)    AND       Pp1
(* 35 *)    ANDN      Pp2
(* 36 *)    ST        P2
(* 37 *)    AND       Vp2
(* 38 *)    STN       P1
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 20:45:0 21:46:0 22:47:0 23:48:0 24:49:0 25:50:0 32:52:0 33:53:0 34:54:0
 35:55:0 36:56:0 37:57:0 38:58:0
}
