PROGRAM svetlaauto_p
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
Svetla atuo
*)

{NETWORK}
(*

*)
  LD_BOOL   "s1"
  ST        "vParkovaci"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "s2"
  AND       "vParkovaci"
  AND(
    LDN_BOOL  "s3"
    OR        "vMlhova"
    ST        "vTlumena"
    OR(
      LD_BOOL   "s3"
      ANDN      "vMlhova"
      ST        "vDalkova"
    )
  )
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "s4"
  AND       "vParkovaci"
  ST        "vMlhova"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 19 *)    LD_BOOL   s1
(* 20 *)    ST        vParkovaci
(* Network 2 *)
(* 27 *)    LD_BOOL   s2
(* 28 *)    AND       vParkovaci
{CREATE_TEMP=__Tmp_1}
(* 29 *)    ST __Tmp_1  // replacement of 'AND('
(* 30 *)      ANDN      s3
(* 31 *)      OR(
(* 31 *)        LD_bool __Tmp_1
(* 31 *)        AND       vMlhova
(* 31 *)      )
(* 32 *)      ST        vTlumena
(* 33 *)      OR(
(* 33 *)        LD_bool __Tmp_1
(* 34 *)        AND       s3
(* 35 *)        ANDN      vMlhova
(* 36 *)        ST        vDalkova
(* 37 *)      )
(* 38 *)    __CR_TEST
(* Network 3 *)
(* 45 *)    LD_BOOL   s4
(* 46 *)    AND       vParkovaci
(* 47 *)    ST        vMlhova
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 19:54:0 20:55:0 27:57:0 28:58:0 29:60:1 30:61:0 31:64:0 32:66:0 33:68:0
 34:69:0 35:70:0 36:71:0 37:72:0 38:73:0 45:75:0 46:76:0 47:77:0
}
