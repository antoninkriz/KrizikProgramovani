PROGRAM vytah4patra_p
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
    LD_BOOL   "t2"
    OR        "t3"
    OR        "t4"
  )
  OR(
    LD_BOOL   "s2"
    AND(
      LD_BOOL   "t3"
      OR        "t4"
    )
  )
  OR(
    LD_BOOL   "s3"
    AND       "t4"
  )
  ST        "nahoru"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "s2"
  AND       "t1"
  OR(
    LD_BOOL   "s3"
    AND(
      LD_BOOL   "t1"
      OR        "t2"
    )
  )
  OR(
    LD_BOOL   "s4"
    AND(
      LD_BOOL   "t1"
      OR        "t2"
      OR        "t3"
    )
  )
  ST        "dolu"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 19 *)    LD_BOOL   s1
(* 20 *)    AND(
(* 21 *)      LD_BOOL   t2
(* 22 *)      OR        t3
(* 23 *)      OR        t4
(* 24 *)    )
(* 25 *)    OR(
(* 26 *)      LD_BOOL   s2
(* 27 *)      AND(
(* 28 *)        LD_BOOL   t3
(* 29 *)        OR        t4
(* 30 *)      )
(* 31 *)    )
(* 32 *)    OR(
(* 33 *)      LD_BOOL   s3
(* 34 *)      AND       t4
(* 35 *)    )
(* 36 *)    ST        nahoru
(* Network 2 *)
(* 43 *)    LD_BOOL   s2
(* 44 *)    AND       t1
(* 45 *)    OR(
(* 46 *)      LD_BOOL   s3
(* 47 *)      AND(
(* 48 *)        LD_BOOL   t1
(* 49 *)        OR        t2
(* 50 *)      )
(* 51 *)    )
(* 52 *)    OR(
(* 53 *)      LD_BOOL   s4
(* 54 *)      AND(
(* 55 *)        LD_BOOL   t1
(* 56 *)        OR        t2
(* 57 *)        OR        t3
(* 58 *)      )
(* 59 *)    )
(* 60 *)    ST        dolu
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 19:67:0 21:69:0 22:70:0 23:71:0 24:72:0 26:74:0 28:76:0 29:77:0 30:78:0
 31:79:0 33:81:0 34:82:0 35:83:0 36:84:0 43:86:0 44:87:0 46:89:0 48:91:0
 49:92:0 50:93:0 51:94:0 53:96:0 55:98:0 56:99:0 57:100:0 58:101:0 59:102:0
 60:103:0
}
