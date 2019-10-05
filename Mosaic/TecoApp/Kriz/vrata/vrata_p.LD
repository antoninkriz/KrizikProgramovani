PROGRAM vrata_p
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
  LD_BOOL   "start"
  OR        "otevirani"
  ANDN      "otevreno"
  ANDN      "stop"
  ST        "otevirani"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "start"
  AND       "otevreno"
  OR        "zavirani"
  ANDN      "zavreno"
  ANDN      "stop"
  ST        "zavirani"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 19 *)    LD_BOOL   start
(* 20 *)    OR        otevirani
(* 21 *)    ANDN      otevreno
(* 22 *)    ANDN      stop
(* 23 *)    ST        otevirani
(* Network 2 *)
(* 30 *)    LD_BOOL   start
(* 31 *)    AND       otevreno
(* 32 *)    OR        zavirani
(* 33 *)    ANDN      zavreno
(* 34 *)    ANDN      stop
(* 35 *)    ST        zavirani
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 19:42:0 20:43:0 21:44:0 22:45:0 23:46:0 30:48:0 31:49:0 32:50:0 33:51:0
 34:52:0 35:53:0
}
