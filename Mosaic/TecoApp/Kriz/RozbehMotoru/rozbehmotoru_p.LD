PROGRAM rozbehmotoru_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    casovac : TON;
    pom : BOOL;
    cas : TIME;
    zarovka : BOOL;
    s1 : BOOL;
    s2 : BOOL;
    zarovka2 : BOOL;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Komentáø ke schématu
*)

{NETWORK}
(*
Start + Spinani tranzistoru T1
*)
  LD_BOOL   "start"
  OR        "t1"
  ANDN      "stop"
  ST        "t1"
{/NETWORK}

{NETWORK}
(*
Generovani casoveho zpozdeni po startu
*)
  LD_BOOL   "t1"
  {POU:TON} "casovac"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "cas" {/PIN}
  {/POU}
  ST        "pom"
{/NETWORK}

{NETWORK}
(*
Spinani tranzistoru T2
*)
  LD_BOOL   "pom"
  ST        "t2"
{/NETWORK}

{NETWORK}
(*
Extra priklad - schodistak
*)
  LD_BOOL   "t1"
  AND       "t2"
  OR(
    LDN_BOOL  "t2"
    ANDN      "t1"
  )
  ST        "zarovka"
{/NETWORK}

{NETWORK}
(*
Extra priklad - schodistak v2
*)
  LD_BOOL   "s1"
  {POU:XOR}
    {PIN:IN1} {/PIN}
    {PIN:IN2}
      LD_BOOL   "s2"
    {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  ST        "zarovka2"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 26 *)    LD_BOOL   start
(* 27 *)    OR        t1
(* 28 *)    ANDN      stop
(* 29 *)    ST        t1
(* Network 2 *)
(* 36 *)    LD_BOOL   t1
(* 38 *)    ST        casovac.IN
(* 37 *)    CAL casovac (PT:=T#5s)
(* 41 *)    LD        casovac.ET
(* 41 *)    ST        cas
(* 40 *)    LD        casovac.Q
(* 43 *)    ST        pom
(* Network 3 *)
(* 50 *)    LD_BOOL   pom
(* 51 *)    ST        t2
(* Network 4 *)
(* 58 *)    LD_BOOL   t1
(* 59 *)    AND       t2
(* 60 *)    OR(
(* 61 *)      LDN_BOOL  t2
(* 62 *)      ANDN      t1
(* 63 *)    )
(* 64 *)    ST        zarovka
(* Network 5 *)
(* 71 *)    LD_BOOL   s1
(* 74 *)    XOR       s2
(* 77 *)    __CR_TEST
(* 79 *)    ST        zarovka2
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 26:86:0 27:87:0 28:88:0 29:89:0 36:91:0 38:92:0 39:93:0 37:93:0 41:95:0
 40:96:0 43:97:0 50:99:0 51:100:0 58:102:0 59:103:0 61:105:0 62:106:0 63:107:0
 64:108:0 71:110:0 74:111:0 77:112:0 79:113:0
}
