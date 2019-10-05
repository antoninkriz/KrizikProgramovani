; Varování: Tento soubor je spravován vývojovým prostøedím Mosaic.
; Nedoporuèuje se upravovat ho ruènì!

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
#useoption RemZone = 0          ; délka remanentní zóny
#useoption AlarmTime = 150      ; první výstraha [ms]
#useoption MaxCycleTime = 250   ; maximální cyklus [ms]
#useoption PLCstart = 1         ; studený start
#useoption AutoSummerTime = 0   ; vnitøní hodiny PLC se neposouvají pøi pøechodu na letní èas
#useoption RestartOnError = 0   ; PLC nebude po tvrdé chybì restartováno

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
