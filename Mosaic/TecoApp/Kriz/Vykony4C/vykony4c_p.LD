PROGRAM vykony4c_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    h1 : INT;
    h2 : INT;
    h3 : INT;
    h4 : INT;
    h : INT;
    splneno : BOOL;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Komentáø ke schématu
*)

{NETWORK}
(*

*)
  LD_EDGE   "s1"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "1" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h1" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  LDN_BOOL  "s1"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "0" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h1" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "s2"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "4" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h2" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  LDN_BOOL  "s2"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "0" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h2" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "s3"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "7" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h3" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  LDN_BOOL  "s3"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "0" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h3" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "s4"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "9" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h4" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  LDN_BOOL  "s4"
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "0" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h4" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  {POU:ADD}
    {PIN:EN} {/PIN}
    {PIN:IN1} "h1" {/PIN}
    {PIN:IN2} "h2" {/PIN}
    {PIN:IN3} "h3" {/PIN}
    {PIN:IN4} "h4" {/PIN}
    {PINO:ENO} {/PIN}
    {PINO:Q} "h" {/PIN}
  {/POU}
{/NETWORK}

{NETWORK}
(*

*)
  {POU:LE}
    {PIN:EN} {/PIN}
    {PIN:IN1} "h" {/PIN}
    {PIN:IN2} "10" {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  ST        "splneno"
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "s1"
  AND       "splneno"
  OR        "sp1"
  AND       "s1"
  ST        "sp1"
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "s2"
  AND       "splneno"
  OR        "sp2"
  AND       "s2"
  ST        "sp2"
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "s3"
  AND       "splneno"
  OR        "sp3"
  AND       "s3"
  ST        "sp3"
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "s4"
  AND       "splneno"
  OR        "sp4"
  AND       "s4"
  ST        "sp4"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 25 *)    LD_EDGE   s1
(* 27 *)    JMPCN __PouSkip_26
(* 26 *)    LD        1
(* 29 *)    ADD       0
(* 31 *)    ST        h1
(* 30 *)    LD_bool true
(* 26 *)  __PouSkip_26:
(* Network 2 *)
(* 39 *)    LDN_BOOL  s1
(* 41 *)    JMPCN __PouSkip_40
(* 40 *)    LD        0
(* 43 *)    ADD       0
(* 45 *)    ST        h1
(* 44 *)    LD_bool true
(* 40 *)  __PouSkip_40:
(* Network 3 *)
(* 53 *)    LD_EDGE   s2
(* 55 *)    JMPCN __PouSkip_54
(* 54 *)    LD        4
(* 57 *)    ADD       0
(* 59 *)    ST        h2
(* 58 *)    LD_bool true
(* 54 *)  __PouSkip_54:
(* Network 4 *)
(* 67 *)    LDN_BOOL  s2
(* 69 *)    JMPCN __PouSkip_68
(* 68 *)    LD        0
(* 71 *)    ADD       0
(* 73 *)    ST        h2
(* 72 *)    LD_bool true
(* 68 *)  __PouSkip_68:
(* Network 5 *)
(* 81 *)    LD_EDGE   s3
(* 83 *)    JMPCN __PouSkip_82
(* 82 *)    LD        7
(* 85 *)    ADD       0
(* 87 *)    ST        h3
(* 86 *)    LD_bool true
(* 82 *)  __PouSkip_82:
(* Network 6 *)
(* 95 *)    LDN_BOOL  s3
(* 97 *)    JMPCN __PouSkip_96
(* 96 *)    LD        0
(* 99 *)    ADD       0
(* 101 *)    ST        h3
(* 100 *)    LD_bool true
(* 96 *)  __PouSkip_96:
(* Network 7 *)
(* 109 *)    LD_EDGE   s4
(* 111 *)    JMPCN __PouSkip_110
(* 110 *)    LD        9
(* 113 *)    ADD       0
(* 115 *)    ST        h4
(* 114 *)    LD_bool true
(* 110 *)  __PouSkip_110:
(* Network 8 *)
(* 123 *)    LDN_BOOL  s4
(* 125 *)    JMPCN __PouSkip_124
(* 124 *)    LD        0
(* 127 *)    ADD       0
(* 129 *)    ST        h4
(* 128 *)    LD_bool true
(* 124 *)  __PouSkip_124:
(* Network 9 *)
(* 138 *)    LD_bool true
(* 138 *)    JMPCN __PouSkip_137
(* 137 *)    LD        h1
(* 140 *)    ADD       h2
(* 141 *)    ADD       h3
(* 142 *)    ADD       h4
(* 144 *)    ST        h
(* 143 *)    LD_bool true
(* 137 *)  __PouSkip_137:
(* Network 10 *)
(* 153 *)    LD_bool true
(* 153 *)    JMPCN __PouSkip_152
(* 152 *)    LD        h
(* 155 *)    LE        10
(* 156 *)    __CR_TEST
(* 152 *)  __PouSkip_152:
(* 158 *)    ST        splneno
(* Network 11 *)
(* 165 *)    LD_EDGE   s1
(* 166 *)    AND       splneno
(* 167 *)    OR        sp1
(* 168 *)    AND       s1
(* 169 *)    ST        sp1
(* Network 12 *)
(* 176 *)    LD_EDGE   s2
(* 177 *)    AND       splneno
(* 178 *)    OR        sp2
(* 179 *)    AND       s2
(* 180 *)    ST        sp2
(* Network 13 *)
(* 187 *)    LD_EDGE   s3
(* 188 *)    AND       splneno
(* 189 *)    OR        sp3
(* 190 *)    AND       s3
(* 191 *)    ST        sp3
(* Network 14 *)
(* 198 *)    LD_EDGE   s4
(* 199 *)    AND       splneno
(* 200 *)    OR        sp4
(* 201 *)    AND       s4
(* 202 *)    ST        sp4
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 25:209:0 27:210:0 28:211:0 29:212:0 31:213:0 39:217:0 41:218:0 42:219:0 43:220:0
 45:221:0 53:225:0 55:226:0 56:227:0 57:228:0 59:229:0 67:233:0 69:234:0 70:235:0
 71:236:0 73:237:0 81:241:0 83:242:0 84:243:0 85:244:0 87:245:0 95:249:0 97:250:0
 98:251:0 99:252:0 101:253:0 109:257:0 111:258:0 112:259:0 113:260:0 115:261:0 123:265:0
 125:266:0 126:267:0 127:268:0 129:269:0 138:274:0 139:275:0 140:276:0 141:277:0 142:278:0
 144:279:0 153:284:0 154:285:0 155:286:0 156:287:0 158:289:0 165:291:0 166:292:0 167:293:0
 168:294:0 169:295:0 176:297:0 177:298:0 178:299:0 179:300:0 180:301:0 187:303:0 188:304:0
 189:305:0 190:306:0 191:307:0 198:309:0 199:310:0 200:311:0 201:312:0 202:313:0
}
