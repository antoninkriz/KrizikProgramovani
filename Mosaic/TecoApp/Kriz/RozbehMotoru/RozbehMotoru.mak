; Varov�n�: Tento soubor je spravov�n v�vojov�m prost�ed�m Mosaic.
; Nedoporu�uje se upravovat ho ru�n�!

#program RozbehMotoru , V1.0
;**************************************
;<ActionName/>
;<Programmer/>
;<FirmName/>
;<Copyright/>
;**************************************
;<History>
;</History>
;**************************************
#useoption CPM = 9              ; Typ CPM: K
#useoption RemZone = 0          ; d�lka remanentn� z�ny
#useoption AlarmTime = 150      ; prvn� v�straha [ms]
#useoption MaxCycleTime = 250   ; maxim�ln� cyklus [ms]
#useoption PLCstart = 1         ; studen� start
#useoption AutoSummerTime = 0   ; vnit�n� hodiny PLC se neposouvaj� p�i p�echodu na letn� �as
#useoption RestartOnError = 0   ; PLC nebude po tvrd� chyb� restartov�no

#uselib "LocalLib\StdLib_V20_20100519.mlb"
#endlibs

;**************************************
#usefile "PanelMaker\DeklarPT.mos", 'auto'
#usefile "SysGen\HWConfig.ST", 'auto'
#usefile "SysGen\RozbehMotoru.hwc", 'auto'
#usefile "ROZBEHMOTORU.ST"
#usefile "..\Kriz.hwn", 'auto'
#usefile "Sysgen\CIBMaker.mos", 'auto'
#usefile "Sysgen\CIBMaker.st", 'auto'
#usefile "rozbehmotoru_p.LD"
#usefile "PanelMaker\OI1073.mos", 'auto'
#usefile "RozbehMotoru.mcf", 'auto'