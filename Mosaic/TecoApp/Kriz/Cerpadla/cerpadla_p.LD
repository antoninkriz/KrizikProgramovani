PROGRAM cerpadla_p
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
  LD_BOOL   "s1"
  AND(
    LDN_BOOL  "c2"
    ORN       "c3"
  )
  ST        "c1"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "s2"
  AND(
    LDN_BOOL  "c1"
    ORN       "c3"
  )
  ST        "c2"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "s3"
  AND(
    LDN_BOOL  "c2"
    ORN       "c1"
  )
  ST        "c3"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 19 *)    LD_BOOL   s1
(* 20 *)    AND(
(* 21 *)      LDN_BOOL  c2
(* 22 *)      ORN       c3
(* 23 *)    )
(* 24 *)    ST        c1
(* Network 2 *)
(* 31 *)    LD_BOOL   s2
(* 32 *)    AND(
(* 33 *)      LDN_BOOL  c1
(* 34 *)      ORN       c3
(* 35 *)    )
(* 36 *)    ST        c2
(* Network 3 *)
(* 43 *)    LD_BOOL   s3
(* 44 *)    AND(
(* 45 *)      LDN_BOOL  c2
(* 46 *)      ORN       c1
(* 47 *)    )
(* 48 *)    ST        c3
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 19:55:0 21:57:0 22:58:0 23:59:0 24:60:0 31:62:0 33:64:0 34:65:0 35:66:0
 36:67:0 43:69:0 45:71:0 46:72:0 47:73:0 48:74:0
}
