PROGRAM vykony_p
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
MAX 3W celkem, neodpojovat jiz bezici stroj

Antonin Kriz, 4C
*)

{NETWORK}
(*
Stroj 1W
*)
  LD_BOOL   "S1"
  ANDN      "P3"
  ST        "P1"
{/NETWORK}

{NETWORK}
(*
Stroj 2W
*)
  LD_BOOL   "S2"
  ANDN      "P3"
  ST        "P2"
{/NETWORK}

{NETWORK}
(*
Stroj 3W
*)
  LD_BOOL   "S3"
  ANDN      "P1"
  ANDN      "P2"
  ST        "P3"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 21 *)    LD_BOOL   S1
(* 22 *)    ANDN      P3
(* 23 *)    ST        P1
(* Network 2 *)
(* 30 *)    LD_BOOL   S2
(* 31 *)    ANDN      P3
(* 32 *)    ST        P2
(* Network 3 *)
(* 39 *)    LD_BOOL   S3
(* 40 *)    ANDN      P1
(* 41 *)    ANDN      P2
(* 42 *)    ST        P3
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 21:49:0 22:50:0 23:51:0 30:53:0 31:54:0 32:55:0 39:57:0 40:58:0 41:59:0
 42:60:0
}
