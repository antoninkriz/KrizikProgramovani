PROGRAM prgMain
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    bezi : BOOL;
    k1 : BOOL;
    k2 : BOOL;
    k3 : BOOL;
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
  OR        "bezi"
  ST        "bezi"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "bezi"
  ST        "k1"
  ANDN      "s2"
  ANDN      "k2"
  ANDN      "k3"
  ST        "v1"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "bezi"
  AND       "s2"
  ANDN      "s3"
  ANDN      "k3"
  ST        "v2"
  ST        "k2"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "bezi"
  AND       "s3"
  ANDN      "s4"
  ST        "v3"
  ST        "k3"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 23 *)    LD_BOOL   s1
(* 24 *)    OR        bezi
(* 25 *)    ST        bezi
(* Network 2 *)
(* 32 *)    LD_BOOL   bezi
(* 33 *)    ST        k1
(* 34 *)    ANDN      s2
(* 35 *)    ANDN      k2
(* 36 *)    ANDN      k3
(* 37 *)    ST        v1
(* Network 3 *)
(* 44 *)    LD_BOOL   bezi
(* 45 *)    AND       s2
(* 46 *)    ANDN      s3
(* 47 *)    ANDN      k3
(* 48 *)    ST        v2
(* 49 *)    ST        k2
(* Network 4 *)
(* 56 *)    LD_BOOL   bezi
(* 57 *)    AND       s3
(* 58 *)    ANDN      s4
(* 59 *)    ST        v3
(* 60 *)    ST        k3
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 23:67:0 24:68:0 25:69:0 32:71:0 33:72:0 34:73:0 35:74:0 36:75:0 37:76:0
 44:78:0 45:79:0 46:80:0 47:81:0 48:82:0 49:83:0 56:85:0 57:86:0 58:87:0
 59:88:0 60:89:0
}
