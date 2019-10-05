PROGRAM cerpadlarezervni_p
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
  LD_BOOL   "c1"
  ST        "s1"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "c2"
  ST        "s2"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "c3"
  AND(
    LDN_BOOL  "c1"
    ORN       "c2"
  )
  ST        "s3"
{/NETWORK}

{NETWORK}
(*

*)
  LDN_BOOL  "c1"
  ANDN      "c3"
  OR(
    LDN_BOOL  "c2"
    ANDN      "c3"
  )
  ST        "sre"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 19 *)    LD_BOOL   c1
(* 20 *)    ST        s1
(* Network 2 *)
(* 27 *)    LD_BOOL   c2
(* 28 *)    ST        s2
(* Network 3 *)
(* 35 *)    LD_BOOL   c3
(* 36 *)    AND(
(* 37 *)      LDN_BOOL  c1
(* 38 *)      ORN       c2
(* 39 *)    )
(* 40 *)    ST        s3
(* Network 4 *)
(* 47 *)    LDN_BOOL  c1
(* 48 *)    ANDN      c3
(* 49 *)    OR(
(* 50 *)      LDN_BOOL  c2
(* 51 *)      ANDN      c3
(* 52 *)    )
(* 53 *)    ST        sre
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 19:60:0 20:61:0 27:63:0 28:64:0 35:66:0 37:68:0 38:69:0 39:70:0 40:71:0
 47:73:0 48:74:0 50:76:0 51:77:0 52:78:0 53:79:0
}
