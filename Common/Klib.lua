Version = "1.00"  
LVersion = " 6.2"
Scriptname = "Krystra Mid Series"
Author = "Krystra"
list = "Leblanc , Lissandra , Viktor, Akali, Diana"
 link = "Go to ../ then you can see my topic "..Scriptname.." on the first or second page."
 date = "02.02.2016"

---//==================================================\\---
--|| > English Translation details               ||--
---\\==================================================//---
loc_eng = {
--General Menu(Combo) // 8 // 1
"Combo Settings", "Use Q in Combo", "Use W in Combo", "Use E in Combo", "Use R in Combo" ,
"Use Ignite if target killable","Combo logic","Mana Manager %",
--General Menu(Harass) // 5 // 9
"Harass Settings","Harass With Q","Harass With W","Harass With E","Harass With R",
--General Menu(Clear) // 16 // 14
"Farm Settings","LaneClear Settings","Use Q on Laneclear","Use W on Laneclear","Use E on Laneclear","Use R on Laneclear",
"JungleClear Settings","Use Q on jungleclear","Use W on jungleclear","Use E on jungleclear","Use R on jungleclear",
"Lasthit Settings","Use Q on Lasthit","Use W on Lasthit","Use E on Lasthit","Use R on Lasthit",
--General Menu(Escape) // 5 // 30
"Escape Settings","Use Q While Escape","Use W While Escape","Use E While Escape","Use R While Escape",
--General Menu(Killsteal) // 7 // 35
"KillSteal Settings","Killsteal On/Off","Steal With Q","Steal With W","Steal With E","Steal With R","Steal With Ignite",
--General Menu(İtem Settings) // 5 // 42
"Item Settings","Auto Zhonya", "Zhonya if Health under -> %", "Use Hextech Gunblade", "Use Bilgewater Cutlass",
--General Menu(Vıp Settings) // 19 // 47
"VIP Settings","Use Packet Casting","To use vip settings, Packet Casting should be open.", "Auto Level Settings","Use Auto Level",
"Select Skill Order","Skin Hack Settings","Use Skin Hack","Make sure that using packet casting is ON.",
"To use vip settings, You need to be a VIP user on BOL community.","Select Skin",
"Focus Q>W>E", "Focus Q>E>W","Focus W>Q>E","Focus W>E>Q","Focus E>W>Q", "Focus E>Q>W", "Smart" ,
--General Menu(Draw Settings) // 12 // 65
"Draw Settings","Skill Drawing Settings","Q Skill Drawings","W Skill Drawings","E Skill Drawings","R Skill Drawings","Auto Attack Range",
"Draw Combo Mode","Draw Permabox","Draw Permabox ( Needs 2x F9 )","Draw circle for target selected","Target calculation",
--General Menu(Target Selectors) // 2 // 77
"Targetselectors","Left Click For Target Selection",
--General Menu(Key Settings) // 13 // 79
"Keys Settings", "    [Combo Key Settings]","Combo Key","    [Harass Key Settings]", 
"Smart Harass Key","      [Clear Key Settings]","LaneClear Key","JungleClear Key", 
"      [Other Key Settings]","Escape Key", " Keys are Same As Here","OrwWalkerKey Settings",
"Auto Harass Q",
--General Menu(Misc Settings) // 7 // 92
"Misc Settings", "[" .. myHero.charName.. "] - Auto-Interrupt","Interrupt with Q Skill","Interrupt with W Skill","Interrupt with E Skill",
"Interrupt with R Skill","       [Supported Skills]",
-- General Menu(Skill Logic) // 6 // 99
"Skill Logics","Q Skill Logic","W Skill Logic","E Skill Logic","R Skill Logic","Health Manager %",
-- General Menu(Hitchance Settings) // 5 // 105
"Hitchance","Q Hitchance","W Hitchance","E Hitchance","R Hitchance",
-- General Menu(Orbwalk Settings) // 5  // 110
"OrbWalkerKey Settings",
"                 Script Version:  "..Version.. "         ","            Script was made by  "..Author.. "         ",
"       Leauge Of Legends Version:  "..LVersion.. "         ","Current Orbwalker:                      Sidas Auto Carry",
"Current Orbwalker:                             SxOrbWalk", 
-- Leblanc Menu // 13 // 116
"Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"Random Skill Order","W Skill turn back settings"," Q>E>W>R mode ",
" Q>R>E>W mode "," E>Q>W>R mode "," E>W>Q>R mode ",
" Random Skill Order mode ","Steal With QW","Only use E Skill (Only Stun)"," Select Combomode Key",
-- Akali Menu // 9
"2 enemy", "3 enemy" , "4 enemy","5 enemy","Use R if Q is on target", "Rush Skills","Use Stealth if enemy >","Use Stealth if healt %","Use Stealth (W)",
-- Diana Menu // 4
"Smart Combo", "Use R if target marked" , "Spam everything fast","Use E only if enemy distance > 280",
-- Lissandraa Menu // 17
"E Logic for combo mode","E Logic for harass mode","Engage with second E", "Do not use Second E ( Recomended)" ,
"Do not use Second E ( Recomended)", "Engage with second E" ,"Smart", "save for yourself", "Use for enemy" ,"Auto R for yourself",
"AutoR if Health under -> %", "Engage with second E option is still on Beta..", "R Logic for combo mode", "For using Smart R logic, AutoR should be open..",
"Use W for Anti GapClose","This Function is on beta..",
-- Viktor Menu // 5
"Ulti Logic","Use Ulti If Target Is Killable","Use Ulti Directly" ,"E HitChance (Default value = 1.6)","E HitChance (Default value = 2)","Smart Auto Harass",
-- language menu// 5
"Language(Needs 2xF9)","English", "Turkish","German","Korean",
-- Extrass// 
"Start Engage With Your Ulti ",
-- rework// 171
"Auto W back if health >","Always","Depends on local Settings","Never","Enemy Number","Auto W back if enemy >","   [Local Back Settings]","W>R>Q>E mode ",
" W>Q>R>E mode ","Minimum minion to Q >","Minimum minion to W >","Minimum minion to E >","Minimum minion to R >","           [Mana Manager]",
"Q Skill Mana Manager  %","W Skill Mana Manager  %","E Skill Mana Manager  %","R Skill Mana Manager  %","Use Auto Lasthit","Only if cannot AA","Lasthit Logic","Auto Potion","Use Auto Potion",
"Auto Potion if Health under -> %","Anti-AFK Settings","Use Anti Afk","E -Target draw","Color Settings","Q Color","W Color","E Color","R Color","E -Target Color","Auto Attack Color",
"Selected Target Color","Draw Width Settings","E -Target Width","Selected Target Width","Auto Attack Width","Q Skill Width","W Skill Width","E Skill Width","R Skill Width","Draw Damage Indicator",
"Lasthit Key","Click For Instructions","Use if needed","Clear Key Settings","[" .. myHero.charName.. "] - Anti Gap-Close","Gap-Close With W Skill","Humanizer for Anti Gap Close",
"Auto W Settings","Use Auto W ","Auto W if enemy >","R -Target draw","R -Target Color","R -Target Width"
}

---//==================================================\\---
--|| > Turkish Translation details               ||--
---\\==================================================//---
loc_tr = {
--General Menu(Combo) // 8
"Kombo Ayarlari", "Komboda Q kullan", "Komboda W kullan", "Komboda E kullan", "Komboda R kullan" ,
"Hedef olucekse tutustur kullan","Kombonu sec ","Mana Menajeri %",
--General Menu(Harass) // 5
"Durtme Ayarlari","Rakibi Q ile durt","Rakibi W ile durt","Rakibi E ile durt","Rakibi R ile durt",
--General Menu(Clear) // 16
"Farm Ayarlari","Koridor Temizleme Ayarlari","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan",
"Orman Temizleme Ayarlari","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan",
"Son Vurus Ayarlari","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan",
--General Menu(Escape) // 5
"Kacis Ayarlari","Kacarken Q kullan","Kacarken W kullan","Kacarken E kullan","Kacarken R kullan",
--General Menu(Killsteal) // 7
"Kill Calma Ayarlari","Kill Calma Kapali / Acik","Q skilini Kullan","W skilini Kullan","E skilini Kullan","R skilini Kullan","Tutustur Kullan",
--General Menu(İtem Settings) // 5
"Item Ayarlari","Otomatik Zhonya", "Zhonya Eger can -> %", "Hextech Gunblade kullan", "Bilgewater Cutlass kullan",
--General Menu(Vıp Settings) // 19
"VIP Ayarlari","Packet Casting Kullan","Vip ayarlarini kullanmak icin packet casting acik olmalidir.", "Otomatik Seviye Ayarlari","Otomatik Seviye",
"Yetenek Duzeninin Secin","Kostum Hack Ayarlari","Kostum Hack Kullan","Packet Casting acik oldugundan emin olunuz",
"Vip ayarlarini kullanmak icin BOL Vip uyesi olmaniz gerekmektedir.","Kostum sec",
"Q>W>E ", "Q>E>W","W>Q>E","W>E>Q","E>W>Q", "E>Q>W", "Akilli" ,
--General Menu(Draw Settings) // 11
"Cizim Ayarlari","Yetenek Cizim Ayarlari","Q Yetenek menzilini ciz","W Yetenek menzilini ciz","E Yetenek menzilini ciz","R Yetenek menzilini ciz","Otomatik Saldiri Menzili",
"Kombo Modunu Ciz","Permabox Ciz","Permabox Ciz ( 2x F9 Gerekir )","Secili hedefi daire icine al","Hedef hasar hesapla",
--General Menu(Target Selectors) // 2
"Hedef Secici","Sol tik ile hedef sec",
--General Menu(Key Settings) // 13
"Tus Ayarlari", "<------------------Kombo Tus Ayarlari------------------>","Kombo Tusu","<------------------Durtme Tus Ayari------------------>", 
"Durtme Tusu","<------------------Temizleme Tus Ayarlari-------------------->","Koridor Temizleme Tusu","Orman Temizleme Tusu", 
"<------------------Diger Tus Ayarlari-------------------->","Kacis Tusu", "Orbwalker Tuslariniz Burayla Ayni Olmalidir.","OrwWalkerKey Ayarlari",
"Otomatik Q Durtme",
--General Menu(Misc Settings) // 7
"Ekstra Ayarlar", "[" .. myHero.charName.. "] - Otomatik Durdurma","Q Yetenegi ile durdur","W Yetenegi ile durdur","E Yetenegi ile durdur",
"R Yetenegi ile durdur","                  [Desteklenen Yetenekler]",
-- General Menu(Skill Logic) // 6
"Yetenek Ayarlari","Q Yetenegi Ayarlari","W Yetenegi Ayarlari","E Yetenegi Ayarlari","R Yetenegi Ayarlari","Health Menajeri %",
-- General Menu(Hitchance Settings) // 5
"Tutturma Orani","Q Tutturma Orani","W Tutturma Orani","E Tutturma Orani","R Tutturma Orani",
-- General Menu(Orbwalk Settings) // 5
"OrbWalker Tus Ayarlari",
"                 Script Versiyonu:  "..Version.. "         ","            Script "..Author.. " tarafindan yapilmistir.        ",
"       Leauge Of Legends Versiyonu:  "..LVersion.. "         ","Kullanilan Orbwalker:                      Sidas Auto Carry",
"Kullanilan Orbwalker:                             SxOrbWalk", 
-- Leblanc Menu // 13
"Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"Rastgele Yetenek Duzeni","W yetenegi geri donme ayarlari"," Q>E>W>R modunda W yerine geri don ",
"Q>R>E>W modunda W yerine geri don ","E>Q>W>R modunda W yerine geri don","E>W>Q>R modunda W yerine geri don ",
"Rastgele Yetenek modunda W yerine geri dön ","QW ile cal","Sadece E Kullan (Sadece Sersemlet)"," Kombo Modu Tusu",
-- Akali Menu // 9
"2 dusman", "3 dusman" , "4 dusman","5 dusman","Q Hedefteyse R Kullan", "Yetenekleri Direk Kullan","Görunmezlik(W) kullan hedef >","Görunmezlik(W) kullan Can %",
"Görunmezlik(W) kullan",
-- Diana Menu // 4
"Akilli Kombo", "Hedef isaretli ise R kullan" , "Butun yetenekleri hizlica kullan","E yetenegini mesafe > 280 kullan",
-- Lissandraa Menu // 17
"Kombo modu icin E ayarlari","Durtme modu icin E ayarlari","2. E ile basla", "2. E'yi kullanma ( önerilen)" ,
"2. E'yi kullanma (onerilen)", "2. E ile basla" ,"Akilli", "Kendini koru", "Dusman icin kullan" ,"Kendine otomatik R",
"Otomatik R can altindaysa -> %", "2. E ile basla ayari test asamasindadir..", "Kombo modu icin R ayarlari", "Akilli R ayarlari için kendine otomatik R acik olmalidir.",
"W kullanarak dusmani uzak tut","Bu ozellik hala test asamasindadir..",
-- Viktor Menu // 5
"Ulti Ayarlari","Hedef olucek ise Ulti Kullan","Ultiyi Direk Kullan" ,"E Tutturma Orani (Normali = 1.6)","E Tutturma Orani (Normali = 2)","Otomatik durtme",
-- language menu// 5
"Dil Secimi(2xF9 Gerekmektedir.)","Ingilizce", "Turkce","Almanca","Korece",
-- Extrass// 
"Komboyu ulti ile baslat ",
-- rework// 171
"Otomatik w eger can >","Her zaman","Local Ayarlara Bagli","Asla","Dusman Sayisi","Otomatik W Eger Dusman >","                        [Local Ayarlar]","W>R>Q>E modunda W yerine geri don",
"W>Q>R>E modunda W yerine geri don ","Q icin minimum minion  >","W icin minimum minion  >","E icin minimum minion  >","R icin minimum minion >","                        [Mana Menajeri]",
"Q Yetenegi Mana Menajeri  %","W Yetenegi Mana Menajeri  %","E Yetenegi Mana Menajeri  %","R Yetenegi Mana Menajeri  %","Otomatik Son Vurus","Eger otomatik Saldiri Yapamiyorsa","Son Vurus Ayarlari","Otomatik Pot","Otomatik Pot Kullan",
"Auto Potion if Health under -> %","Anti-AFK Ayarlari","Anti Afk Kullan","E -Hedef Cizimi","Renk Ayarlari","Q Rengi","W Rengi","E Rengi","R Rengi","E -Hedef Rengi","Otomatik Saldiri Rengi",
"Secili Karakter Rengi","Kalinlik Ayarlari","E -Hedef Kalinlik","Secili Karakter Kalinlik","Otomatik Saldiri Kalinlik","Q Yetenegi kalinlik","W Yetenegi kalinlik","E Yetenegi kalinlik",
"R Yetenegi kalinlik","Hasar cizimi goster",
"Son vurus tusu","Talimatlar icin tiklayiniz","Gerekli ise kullan","Farm Tus Ayarlari","[" .. myHero.charName.. "] - Anti Gap-Close","W Yetenegi ile Anti Gap-Close","Anti Gap-Close icin insanlastirma",
"Otomatik W Ayarlari","Otomatik W Kullan ","Otomatik W Eger Dusman >","R -Hedef Cizim","R -Hedef Rengi","R -Hedef Kalinlik"
}
---//==================================================\\---
--|| > German Translation details               ||--
---\\==================================================//---
loc_gr = {
--General Menu(Combo) // 8 // 1
"Combo Einstellungen", "Benutze Q im Combo Modus", "Benutze W im Combo Modus", "Benutze E im Combo Modus", "Benutze R im Combo Modus" ,
"Benutze Ignite wenn das Ziel dadurch stirbt","Combo Logik","Mana Manager %",
--General Menu(Harass) // 5 // 9
"Harass Einstellungen","Harass mit Q","Harass mit W","Harass mit E","Harass mit R",
--General Menu(Clear) // 16 // 14
"Farm Einstellungen","LaneClear Einstellungen","Benutze Q im Laneclear Modus","Benutze W im Laneclear Modus","Benutze E im Laneclear Modus","Benutze im Laneclear Modus",
"JungleClear Einstellungen","Benutze Q im jungleclear Modus","Benutze W im jungleclear Modus","Benutze E im jungleclear Modus","Benutze R im jungleclear Modus",
"Lasthit Einstellungen","Benutze Q im Lasthit Modus","Benutze W im Lasthit Modus","Benutze E im Lasthit Modus","Benutze R im Lasthit Modus",
--General Menu(Escape) // 5 // 30
"Escape Einstellungen","Benutze Q beim Fliehen","Benutze W beim Fliehen","Benutze E beim Fliehen","Benutze R beim Fliehen",
--General Menu(Killsteal) // 7 // 35
"KillSteal Einstellungen","Killsteal Ein/Aus","Stiehl mit Q","Stiehl mit W","Stiehl mit E","Stiehl mit R","Stiehl mit Ignite",
--General Menu(item) // 5 // 42
"Item Einstellungen","Auto Zhonya", "Benutzte Zhonya wenn Leben unter -> %", "Benutze Hextech Gunblade", "Benutze Bilgewater Cutlass",
--General Menu(vip Einstellungen) // 19 // 47
"VIP Einstellungen","Benutze Packet Casting","Um VIP Einstellungen, zu benutzten muss Package Casting moglich sein", "Auto Level Einstellungen","Benutze Auto Level",
"Select Skill Order","Skin Hack Einstellungen","Benutze Skin Hack","Stelle sicher, dass Packet Casting activiert ist",
"Um VIP Einstellungen zu benutzten, musst du VIP sein","Wahle einen Skin",
"Focus Q>W>E", "Focus Q>E>W","Focus W>Q>E","Focus W>E>Q","Focus E>W>Q", "Focus E>Q>W", "Smart" ,
--General Menu(Graphik Einstellungen) // 12 // 65
"Graphik Einstellungen","Skill Anzeige Einstellungen","Q Anzeigen","W  Anzeigen","E Anzeigen","R Anzeigen","Standart Attacken Reichweite",
"Zeige Combo Modus","Zeige Permabox","Zeige Permabox ( Benotigt 2x F9 )","Zeichne Zirkel um dein gewahltes Ziel","Ziel berechnung",
--General Menu(Target Selectors) // 2 // 77
"Ziel Sortierung","Linksclick fur manuelles Auswahlen von Zielen",
--General Menu(Key Einstellungen) // 13 // 79
"Key Einstellungen", "<------------------Combo Key Einstellungen------------------>","Combo Key","<------------------Harass Key Einstellungen------------------>", 
"Smart Harass Key","<------------------Clear Key Einstellungen-------------------->","LaneClear Key","JungleClear Key", 
"<------------------Andere Key Einstellungen-------------------->","Escape Key", "Stelle sicher, dass deine Orbwalker Keys die gleichen wie hier sind.","OrwWalkerKey Einstellungen",
"Auto Harass Q",
--General Menu(Misc Einstellungen) // 7 // 92
"Andere Einstellungen", "[" .. myHero.charName.. "] - Auto-Abrechen","Abruch mit Q","Abruch mit W","Abruch mit E",
"Abruch mit R","                  [Supported Skills]",
-- General Menu(Skill Logic) // 6 // 99
"Skill Logik","Q Logik","W Logik","E Logik","R Logik","Health Manager %",
-- General Menu(Hitchance Einstellungen) // 5 // 105
"Trefferchance","Q Trefferchance","W Trefferchance","E Trefferchance","R Trefferchance",
-- General Menu(Orbwalk Einstellungen) // 5  // 110
"OrbWalkerKey Einstellungen",
"                 Script Version:  "..Version.. "         ","            Script wurde gemacht von  "..Author.. "         ",
"       Leauge Of Legends Version:  "..LVersion.. "         ","Aktueller Orbwalker:                      Sidas Auto Carry",
"Aktueller Orbwalker:                             SxOrbWalk", 
-- Leblanc Menu // 13 // 116
"Q>E>W>R", "Q>R>E>W", "E>Q>W>R", "E>W>Q>R" ,"Zufällige Benutzung","W Skill zuruckkomm Einstellungen","Gehe zuruck zum W Spot im Q>E>W>R modus ",
"Gehe zuruck zum W Spot im Q>R>E>W modus ","Gehe zuruck zum W Spot im E>Q>W>R modus ","Gehe zuruck zum W Spot im E>W>Q>R modus",
"Gehe zuruck zum W Spot im Zufälligen Modus ","Stiehl mit QW","Benutze nur E (Nur Stunnen)"," Wähle Combomodus Key",
-- Akali Menu // 9
"2 Gegner", "3 Gegner" , "4 Gegner","5 Gegner","Benutze R wenn Q das Ziel getroffen hat", "Rush Skills","Benutze Verbergen wenn gegner >","Benutze Verbergen wenn Leben %","Benutze Verbergen (W)",
-- Diana Menu // 4
"Smart Combo", "Benutze R wenn Ziel markiert" , "Benutzte alles schnell hintereinander","Benutze E nur wenn die Distanz zum gegner > 280",
-- Lissandraa Menu // 17
"E Logik fur combo modus","E Logic fur harass modus","Engage mit Zweiten E", "Benutze nicht den Zweiten E ( Empfohlen)" ,
"Benutze nicht den Zweiten E ( Empfohlen)", "Engage mit Zweiten E" ,"Smart", "Rette dich selbst", "Benutze gegen Gegner" ,"Auto R fur dichselbst",
"AutoR wenn Leben unter -> %", "Die 'Engage mit Zweiten E' Option ist im Beta Stadium", "R Logik fur den combo modus", "Um Smart R Logik zu benutzten, sollte AutoR aktiviert sein",
"Benutze W fur Anti-GapClose","Diese Function befindet sich in der Beta Phase",
-- Viktor Menu // 5
"Ulti Logik","Benutze Ultimate wenn das Ziel dadurch stribt","Benutze die Ultimate direkt" ,"E Trefferwarscheinlichkeit (Standart Wert = 1.6)","E Trefferwarscheinlichkeit (Standart Wert = 2)","Smart Auto Harass",
-- language menu// 5
"Sprachen(2xF9)","English", "Turkish","Deutsch","Korean",
-- Extrass// 
"Starte Engange's mit deiner Ultimate",
-- rework// 171
"Auto W back if health >","Always","Depends on local Settings","Never","Enemy Number","Auto W back if enemy >","                        [Local Settings]","Turn back to W spot on W>R>Q>E mode ",
"Turn back to W spot on W>Q>R>E mode ","Minimum minion to Q >","Minimum minion to W >","Minimum minion to E >","Minimum minion to R >","                        [Mana Manager]",
"Q Skill Mana Manager  %","W Skill Mana Manager  %","E Skill Mana Manager  %","R Skill Mana Manager  %","Use Auto Lasthit","Only if cannot AA","Lasthit Logic","Auto Potion","Use Auto Potion",
"Auto Potion if Health under -> %","Anti-AFK Settings","Use Anti Afk","E -Target draw","Color Settings","Q Color","W Color","E Color","R Color","E -Target Color","Auto Attack Color",
"Selected Target Color","Draw Width Settings","E -Target Width","Selected Target Width","Auto Attack Width","Q Skill Width","W Skill Width","E Skill Width","R Skill Width","Draw Damage Indicator",
"Lasthit Key","Click For Instructions","Use if needed","Clear Key Settings","[" .. myHero.charName.. "] - Anti Gap-Close","Gap-Close With W Skill","Humanizer for Anti Gap Close",
"Auto W Settings","Use Auto W ","Auto W if enemy >","R -Target draw","R -Target Color","R -Target Width"
}
lbspot = {
{x = 3078.2177734375 , y = 95.748046875, z = 4303.9643554688},
{x = 2153.0966796875 , y = 95.748046875, z = 4493.1884765625},
{x = 4395.9223632813 , y = 95.748168945313, z = 3125.4541015625},
{x = 4524.7241210938 , y = 95.748168945313, z = 2084.6958007813},
{x = 5380.0322265625 , y = 51.261352539063, z = 2490.5747070313},
{x = 6214.2373046875 , y = 50.011840820313, z = 3461.103515625},
{x = 6281.7963867188 , y = 48.528076171875, z = 5089.8540039063},
{x = 7254.994140625 , y = 52.451171875, z = 5991.65625},
{x = 8116.4321289063 , y = 52.890258789063, z = 5751.265625},
{x = 8965.8251953125 , y = 52.623413085938, z = 4474.44921875},
{x = 9034.9921875 , y = 53.795166015625, z = 3890.2607421875},
{x = 9287.0341796875 , y = 58.37451171875, z = 3511.9157714844},
{x = 9867.59765625 , y = 57.9990234375, z = 3118.6665039063},
{x = 8189.5307617188 , y = 51.60595703125, z = 3209.5812988281},
{x = 3359.3425292969 , y = 52.47412109375, z = 6241.1318359375},
{x = 3771.423828125 , y = 51.000732421875, z = 7254.4926757813},
{x = 4495.3837890625 , y = 49.123657226563, z = 8071.3657226563},
{x = 5118.5659179688 , y = 51.157348632813, z = 7832.5595703125},
{x = 5629.3662109375 , y = 51.654296875, z = 7679.3193359375},
{x = 8539.6025390625 , y = 51.1298828125, z = 2087.4418945313},
{x = 10205.384765625 , y = 49.22314453125, z = 2187.3041992188},
{x = 7604.810546875 , y = 51.273681640625, z = 2096.0678710938},
{x = 7557.9194335938 , y = 48.730102539063, z = 4686.337890625},
{x = 2212.1691894531 , y = 50.411865234375, z = 7797.4438476563},
{x = 1652.8302001953 , y = 52.838134765625, z = 8647.6708984375},
{x = 2160.7019042969 , y = 53.1201171875, z = 10001.190429688},
{x = 2514.5668945313 , y = 51.77490234375, z = 9193.083984375},
{x = 3071.609375 , y = 52.812622070313, z = 9864.0703125},
{x = 2831.2150878906 , y = 54.32568359375, z = 10353.356445313},
{x = 8954.75390625 , y = 51.528076171875, z = 4903.7778320313},
{x = 8418.10546875 , y = 53.97119140625, z = 3763.158203125},
-- -------------------------------------mavi taraf bitti
{x = 10224.888671875 , y = 91.430053710938, z = 12704.100585938},
{x = 10429.840820313 , y = 91.429809570313, z = 11703.564453125},
{x = 11582.235351563 , y = 91.429809570313, z = 10554.192382813},
{x = 12668.779296875 , y = 91.430053710938, z = 10328.741210938},
{x = 11852.047851563 , y = 50.3076171875, z = 8894.05859375},
{x = 12117.778320313 , y = 52.48046875, z = 8043.8427734375},
{x = 11148.4140625 , y = 52.204711914063, z = 7751.361328125},
{x = 10362.048828125 , y = 61.070068359375, z = 8575.6318359375},
{x = 10950.1953125 , y = 52.203979492188, z = 7506.3989257813},
{x = 10353.25390625 , y = 51.999267578125, z = 6711.8408203125},
{x = 10437.215820313 , y = 53.444458007813, z = 9096.6904296875},
{x = 12971.645507813 , y = 51.981201171875, z = 6886.2333984375},
{x = 13101.166015625 , y = 53.143432617188, z = 5653.0639648438},
{x = 12408.293945313 , y = 51.729370117188, z = 5222.7763671875},
{x = 12139.694335938 , y = 51.7294921875, z = 4567.697265625},
{x = 11617.538085938 , y = 51.679321289063, z = 5176.0625},
{x = 9070.85546875 , y = 53.036010742188, z = 7165.3149414063},
{x = 7072.7900390625 , y = 52.87255859375, z = 8811.623046875},
{x = 7598.4057617188 , y = 52.872436523438, z = 8878.0712890625},
{x = 8826.94140625 , y = 52.596069335938, z = 9295.0693359375},
{x = 8573.7900390625 , y = 51.770141601563, z = 11260.03515625},
{x = 9409.0888671875 , y = 52.306396484375, z = 12289.697265625},
{x = 6559.1030273438 , y = 53.944580078125, z = 11621.458007813},
{x = 5281.6518554688 , y = 56.848266601563, z = 11749.409179688},
{x = 6328.6049804688 , y = 54.5703125, z = 12774.705078125},
{x = 7206.1005859375 , y = 56.4765625, z = 12770.250976563},
{x = 4976.4399414063 , y = 56.671020507813, z = 11446.337890625},
{x = 5699.2983398438 , y = 56.692016601563, z = 10907.643554688},
{x = 5812.009765625 , y = 54.16015625, z = 10189.111328125},
{x = 7286.1147460938 , y = 51.417358398438, z = 10186.866210938}
}

lbspotend = {
{x = 3360.7543945313 , y = 54.14990234375, z = 4812.75},
{x = 2190.0805664063 , y = 52.7880859375, z = 5119.3852539063},
{x = 4987.3720703125 , y = 50.947265625, z = 3204.5400390625},
{x = 5115.9340820313 , y = 51.991333007813, z = 2112.9604492188},
{x = 6006.2861328125 , y = 52.13916015625, z = 2439.6027832031},
{x = 6717.298828125 , y = 48.523559570313, z = 3892.9299316406},
{x = 6118.3544921875 , y = 51.7763671875, z = 5708.7084960938},
{x = 7109.2329101563 , y = 53.19287109375, z = 5437.3901367188},
{x = 8229.4609375 , y = -71.240600585938, z = 6389.2055664063},
{x = 9430.9189453125 , y = -71.240600585938, z = 4516.9462890625},
{x = 9438.8330078125 , y = -70.579711914063, z = 4275.380859375},
{x = 9656.0322265625 , y = -70.806518554688, z = 4005.1967773438},
{x = 9739.7646484375 , y = 49.222900390625, z = 2702.9108886719},
{x = 8254.1640625 , y = 51.130126953125, z = 2679.1723632813},
{x = 2864.1623535156 , y = 57.044799804688, z = 5993.6665039063},
{x = 3698.5791015625 , y = 52.7587890625, z = 7761.037109375},
{x = 4003.1398925781 , y = 51.234252929688, z = 7891.3862304688},
{x = 5114.298828125 , y = -40.389038085938, z = 8537.78515625},
{x = 5995.3530273438 , y = -68.9873046875, z = 8241.912109375},
{x = 8574.029296875 , y = 49.453735351563, z = 1673.580078125},
{x = 10102.54296875 , y = 50.260009765625, z = 1717.2194824219},
{x = 7392.90625 , y = 49.446655273438, z = 1641.5682373047},
{x = 7658.3383789063 , y = 53.982421875, z = 4227.2319335938},
{x = 2337.2009277344 , y = 51.789916992188, z = 8228.5986328125},
{x = 2047.6506347656 , y = 51.777587890625, z = 8631.96875},
{x = 1683.5931396484 , y = 52.83837890625, z = 10189.442382813},
{x = 2872.6669921875 , y = 50.676025390625, z = 9213.484375},
{x = 3521.923828125 , y = -66.380126953125, z = 10094.618164063},
{x = 3020.0129394531 , y = -70.343872070313, z = 10846.442382813},
{x = 9041.140625 , y = -71.240600585938, z = 5496.4653320313},
{x = 8034.2280273438 , y = 53.720825195313, z = 3940.2602539063},
-- ---------------------------------------mavi taraf bitti
{x = 9689.9365234375 , y = 52.322875976563, z = 12663.056640625},
{x = 9955.4375 , y = 52.30615234375, z = 11460.467773438},
{x = 11371.384765625 , y = 52.306274414063, z = 10065.577148438},
{x = 12632.4765625 , y = 52.306274414063, z = 9777.009765625},
{x = 11431.650390625 , y = 59.111206054688, z = 8522.919921875},
{x = 11585.361328125 , y = 52.824584960938, z = 8031.7602539063},
{x = 10906.69921875 , y = 62.66259765625, z = 8239.5224609375},
{x = 10791.670898438 , y = 63.077880859375, z = 8360.7275390625},
{x = 10998.96875 , y = 51.723510742188, z = 7037.748046875},
{x = 10872.008789063 , y = 51.72265625, z = 6888.4609375},
{x = 10173.395507813 , y = 52.117553710938, z = 9537.7919921875},
{x = 12673.555664063 , y = 51.702758789063, z = 6491.19921875},
{x = 12617.803710938 , y = 52.173828125, z = 5782.1801757813},
{x = 11973.099609375 , y = 53.644165039063, z = 5227.3408203125},
{x = 11925.876953125 , y = -68.921142578125, z = 4045.8798828125},
{x = 11377.123046875 , y = -71.240600585938, z = 4801.3989257813},
{x = 8648.61328125 , y = -71.240600585938, z = 6735.1474609375},
{x = 6728.6801757813 , y = -71.240600585938, z = 8495.57421875},
{x = 7703.7436523438 , y = 52.408813476563, z = 9384.001953125},
{x = 8699.5771484375 , y = 50.383911132813, z = 9775.046875},
{x = 8129.8115234375 , y = 50.467163085938, z = 10956.14453125},
{x = 8863.501953125 , y = 56.47705078125, z = 12406.870117188},
{x = 6391.2529296875 , y = 56.47705078125, z = 12191.615234375},
{x = 5376.2807617188 , y = 56.460815429688, z = 12158.2109375},
{x = 6293.357421875 , y = 52.837890625, z = 13276.076171875},
{x = 7261.732421875 , y = 52.838134765625, z = 13321.002929688},
{x = 4941.2719726563 , y = -71.240478515625, z = 10840.948242188},
{x = 5309.9711914063 , y = -71.240600585938, z = 10677.38671875},
{x = 5346.1616210938 , y = -71.240600585938, z = 10363.08984375},
{x = 7158.8759765625 , y = 56.380126953125, z = 10707.299804688}
}
function pointOnLine(myHero, unit, minion, extra)
    local tominion = {x = minion.x - unit.x, z = minion.z - unit.z}
    local tomyHero = {x = myHero.x - unit.x, z = myHero.z - unit.z}

    local magitudeTomyHero = tomyHero.x ^ 2 + tomyHero.z ^ 2
    local dotP = tominion.x * tomyHero.x + tominion.z * tomyHero.z

    local distance = dotP / magitudeTomyHero

    return unit.x + tomyHero.x * (distance + extra), unit.z + tomyHero.z * (distance + extra)
end
function DrawLineHPBar(damage, text, unit, enemyTeam)
    if unit.dead or not unit.visible then return end
    local p = WorldToScreen(1 , Vector(unit.x, unit.y, unit.z))
    if not OnScreen(p.x, p.y) then return end
    local thedmg = 0
    local line = 1.4
    local linePosA  = {x = 0, y = 0 }
    local linePosB  = {x = 0, y = 0 }
    local TextPos   = {x = 0, y = 0 }
    
    
    if damage >= unit.maxHealth then
        thedmg = unit.maxHealth - 1
    else
        thedmg = damage
    end
    
    thedmg = math.round(thedmg)
    
    local StartPos = GetHPBarPos(unit)
    local  EndPos = GetHPBarPos(unit)
    local Real_X = StartPos.x + 150
    local Offs_X = (Real_X + ((unit.health - thedmg) / unit.maxHealth) * (EndPos.x - StartPos.x - 2))
    if Offs_X < Real_X then Offs_X = Real_X end 
    local mytrans = 350 - math.round(255*((unit.health-thedmg)/unit.maxHealth))
    if mytrans >= 255 then mytrans=254 end
    local my_bluepart = math.round(400*((unit.health-thedmg)/unit.maxHealth))
    if my_bluepart >= 255 then my_bluepart=254 end

    
    if enemyTeam then
        linePosA.x = Offs_X-150
        linePosA.y = (StartPos.y-(30+(line*15)))    
        linePosB.x = Offs_X-150
        linePosB.y = (StartPos.y-5)
        TextPos.x = Offs_X-148
        TextPos.y = (StartPos.y-(30+(line*15)))
    else
        linePosA.x = Offs_X-125
        linePosA.y = (StartPos.y-(30+(line*15)))    
        linePosB.x = Offs_X-125
        linePosB.y = (StartPos.y-15)
    
        TextPos.x = Offs_X-122
        TextPos.y = (StartPos.y-(30+(line*15)))
    end

    DrawLine(linePosA.x, linePosA.y, linePosB.x, linePosB.y , 2, ARGB(mytrans, 255, my_bluepart, 0))
    DrawText(tostring(thedmg).." "..tostring(text), 15, TextPos.x, TextPos.y , ARGB(mytrans, 255, my_bluepart, 0))
end


function CurrentTimeInMillis()
  return (os.clock() * 1000);
end
    function CircleIntersection(v1, v2, c, radius)
    assert(VectorType(v1) and VectorType(v2) and VectorType(c) and type(radius) == "number", "CircleIntersection: wrong argument types (<Vector>, <Vector>, <Vector>, integer expected)")
    
    local x1, y1, x2, y2, x3, y3 = v1.x, v1.z or v1.y, v2.x, v2.z or v2.y, c.x, c.z or c.y
    local r = radius
    local xp, yp, xm, ym = nil, nil, nil, nil
    local IsOnSegment = nil
    
    if x1 == x2 then
    
      local B = math.sqrt(r^2-(x1-x3)^2)
      
      xp, yp, xm, ym = x1, y3+B, x1, y3-B
    else
    
      local m = (y2-y1)/(x2-x1)
      local n = y1-m*x1
      local A = x3-m*(n-y3)
      local B = math.sqrt(A^2-(1+m^2)*(x3^2-r^2+(n-y3)^2))
      
      xp, xm = (A+B)/(1+m^2), (A-B)/(1+m^2)
      yp, ym = m*xp+n, m*xm+n
    end
    
    if x1 <= x2 then
      IsOnSegment = x1 <= xp and xp <= x2
    else
      IsOnSegment = x2 <= xp and xp <= x1        
    end
      if IsOnSegment then
      return Vector(xp, 0, yp)
    else
      return Vector(xm, 0, ym)
    end
    
  end
isAGapcloserUnit = {
  ['Ahri']        = {true, spell = _R,          range = 450,   projSpeed = 2200, },
  ['Aatrox']      = {true, spell = _Q,                  range = 1000,  projSpeed = 1200, },
  ['Akali']       = {true, spell = _R,                  range = 800,   projSpeed = 2200, },
  ['Alistar']     = {true, spell = _W,                  range = 650,   projSpeed = 2000, },
  ['Amumu']       = {true, spell = _Q,                  range = 1100,  projSpeed = 1800, },
  ['Corki']       = {true, spell = _W,                  range = 800,   projSpeed = 650,  },
  ['Diana']       = {true, spell = _R,                  range = 825,   projSpeed = 2000, },
  ['Darius']      = {true, spell = _R,                  range = 460,   projSpeed = math.huge, },
  ['Fiora']       = {true, spell = _Q,                  range = 600,   projSpeed = 2000, },
  ['Fizz']        = {true, spell = _Q,                  range = 550,   projSpeed = 2000, },
  ['Gragas']      = {true, spell = _E,                  range = 600,   projSpeed = 2000, },
  ['Graves']      = {true, spell = _E,                  range = 425,   projSpeed = 2000, exeption = true },
  ['Hecarim']     = {true, spell = _R,                  range = 1000,  projSpeed = 1200, },
  ['Irelia']      = {true, spell = _Q,                  range = 650,   projSpeed = 2200, },
  ['JarvanIV']    = {true, spell = _Q,                  range = 770,   projSpeed = 2000, },
  ['Jax']         = {true, spell = _Q,                  range = 700,   projSpeed = 2000, },
  ['Jayce']       = {true, spell = 'JayceToTheSkies',   range = 600,   projSpeed = 2000, },
  ['Khazix']      = {true, spell = _E,                  range = 900,   projSpeed = 2000, },
  ['Leblanc']     = {true, spell = _W,                  range = 600,   projSpeed = 2000, },
  --['LeeSin']      = {true, spell = 'blindmonkqtwo',     range = 1300,  projSpeed = 1800, },
  ['Leona']       = {true, spell = _E,                  range = 900,   projSpeed = 2000, },
  ['Lucian']      = {true, spell = _E,                  range = 425,   projSpeed = 2000, },
  ['Malphite']    = {true, spell = _R,                  range = 1000,  projSpeed = 1500, },
  ['Maokai']      = {true, spell = _W,                  range = 525,   projSpeed = 2000, },
  ['MonkeyKing']  = {true, spell = _E,                  range = 650,   projSpeed = 2200, },
  ['Pantheon']    = {true, spell = _W,                  range = 600,   projSpeed = 2000, },
  ['Poppy']       = {true, spell = _E,                  range = 525,   projSpeed = 2000, },
  ['Riven']       = {true, spell = _E,                  range = 150,   projSpeed = 2000, },
  ['Renekton']    = {true, spell = _E,                  range = 450,   projSpeed = 2000, },
  ['Sejuani']     = {true, spell = _Q,                  range = 650,   projSpeed = 2000, },
  ['Shen']        = {true, spell = _E,                  range = 575,   projSpeed = 2000, },
  ['Shyvana']     = {true, spell = _R,                  range = 1000,  projSpeed = 2000, },
  ['Tristana']    = {true, spell = _W,                  range = 900,   projSpeed = 2000, },
  ['Tryndamere']  = {true, spell = 'Slash',             range = 650,   projSpeed = 1450, },
  ['XinZhao']     = {true, spell = _E,                  range = 650,   projSpeed = 2000, },
  ['Yasuo']       = {true, spell = _E,                  range = 475,   projSpeed = 1000, },
  ['Vayne']       = {true, spell = _Q,                  range = 300,   projSpeed = 1000, },
}
  Interrupt = {
    ["Katarina"] = {charName = "Katarina", stop = {["KatarinaR"] = {name = "Death lotus(R)", spellName = "KatarinaR", ult = true }}},
    ["Nunu"] = {charName = "Nunu", stop = {["AbsoluteZero"] = {name = "Absolute Zero(R)", spellName = "AbsoluteZero", ult = true }}},
    ["Malzahar"] = {charName = "Malzahar", stop = {["AlZaharNetherGrasp"] = {name = "Nether Grasp(R)", spellName = "AlZaharNetherGrasp", ult = true}}},
    ["Caitlyn"] = {charName = "Caitlyn", stop = {["CaitlynAceintheHole"] = {name = "Ace in the hole(R)", spellName = "CaitlynAceintheHole", ult = true, projectileName = "caitlyn_ult_mis.troy"}}},
    ["FiddleSticks"] = {charName = "FiddleSticks", stop = {["Crowstorm"] = {name = "Crowstorm(R)", spellName = "Crowstorm", ult = true}}},
    ["Galio"] = {charName = "Galio", stop = {["GalioIdolOfDurand"] = {name = "Idole of Durand(R)", spellName = "GalioIdolOfDurand", ult = true}}},
    ["Janna"] = {charName = "Janna", stop = {["ReapTheWhirlwind"] = {name = "Monsoon(R)", spellName = "ReapTheWhirlwind", ult = true}}},
    ["MissFortune"] = {charName = "MissFortune", stop = {["MissFortune"] = {name = "Bullet time(R)", spellName = "MissFortuneBulletTime", ult = true}}},
    ["MasterYi"] = {charName = "MasterYi", stop = {["MasterYi"] = {name = "Meditate(W)", spellName = "Meditate", ult = false}}},
    ["Pantheon"] = {charName = "Pantheon", stop = {["PantheonRJump"] = {name = "Skyfall(R)", spellName = "PantheonRJump", ult = true}}},
    ["Shen"] = {charName = "Shen", stop = {["ShenStandUnited"] = {name = "Stand united(R)", spellName = "ShenStandUnited", ult = true}}},
    ["Urgot"] = {charName = "Urgot", stop = {["UrgotSwap2"] = {name = "Position Reverser(R)", spellName = "UrgotSwap2", ult = true}}},
    ["Varus"] = {charName = "Varus", stop = {["VarusQ"] = {name = "Piercing Arrow(Q)", spellName = "Varus", ult = false}}},
    ["Warwick"] = {charName = "Warwick", stop = {["InfiniteDuress"] = {name = "Infinite Duress(R)", spellName = "InfiniteDuress", ult = true}}},
}
---//==================================================\\---
--|| > Skin Hack Table --Credits to Divine                 ||--
---\\==================================================//---
skinMeta = {

  -- A
["Aatrox"]       = {"Classic", "Justicar", "Mecha", "Sea Hunter"},
["Ahri"]         = {"Classic", "Dynasty", "Midnight", "Foxfire", "Popstar", "Challenger", "Academy"},
["Akali"]        = {"Classic", "Stinger", "Crimson", "All-star", "Nurse", "Blood Moon", "Silverfang", "Headhunter"},
["Alistar"]      = {"Classic", "Black", "Golden", "Matador", "Longhorn", "Unchained", "Infernal", "Sweeper", "Marauder"},
["Amumu"]        = {"Classic", "Pharaoh", "Vancouver", "Emumu", "Re-Gifted", "Almost-Prom King", "Little Knight", "Sad Robot", "Surprise Party"},
["Anivia"]       = {"Classic", "Team Spirit", "Bird of Prey", "Noxus Hunter", "Hextech", "Blackfrost", "Prehistoric"},
["Annie"]        = {"Classic", "Goth", "Red Riding", "Annie in Wonderland", "Prom Queen", "Frostfire", "Reverse", "FrankenTibbers", "Panda", "Sweetheart"},
["Ashe"]         = {"Classic", "Freljord", "Sherwood Forest", "Woad", "Queen", "Amethyst", "Heartseeker", "Marauder"},
["Azir"]         = {"Classic", "Galactic", "Gravelord"},
  -- B  
["Bard"]         = {"Classic", "Elderwood", "Chroma Pack: Marigold", "Chroma Pack: Ivy", "Chroma Pack: Sage"},
["Blitzcrank"]   = {"Classic", "Rusty", "Goalkeeper", "Boom Boom", "Piltover Customs", "Definitely Not", "iBlitzcrank", "Riot", "Chroma Pack: Molten", "Chroma Pack: Cobalt", "Chroma Pack: Gunmetal", "Battle Boss"},
["Brand"]        = {"Classic", "Apocalyptic", "Vandal", "Cryocore", "Zombie", "Spirit Fire"},
["Braum"]        = {"Classic", "Dragonslayer", "El Tigre", "Lionheart"},
  -- C  
["Caitlyn"]      = {"Classic", "Resistance", "Sheriff", "Safari", "Arctic Warfare", "Officer", "Headhunter", "Chroma Pack: Pink", "Chroma Pack: Green", "Chroma Pack: Blue"},
["Cassiopeia"]   = {"Classic", "Desperada", "Siren", "Mythic", "Jade Fang", "Chroma Pack: Day", "Chroma Pack: Dusk", "Chroma Pack: Night"},
["Chogath"]      = {"Classic", "Nightmare", "Gentleman", "Loch Ness", "Jurassic", "Battlecast Prime", "Prehistoric"},
["Corki"]        = {"Classic", "UFO", "Ice Toboggan", "Red Baron", "Hot Rod", "Urfrider", "Dragonwing", "Fnatic"},
  -- D
["Darius"]       = {"Classic", "Lord", "Bioforge", "Woad King", "Dunkmaster", "Chroma Pack: Black Iron", "Chroma Pack: Bronze", "Chroma Pack: Copper", "Academy"},
["Diana"]        = {"Classic", "Dark Valkyrie", "Lunar Goddess"},
["DrMundo"]      = {"Classic", "Toxic", "Mr. Mundoverse", "Corporate Mundo", "Mundo Mundo", "Executioner Mundo", "Rageborn Mundo", "TPA Mundo", "Pool Party"},
["Draven"]       = {"Classic", "Soul Reaver", "Gladiator", "Primetime", "Pool Party"},
  -- E 
["Ekko"]         = {"Classic", "Sandstorm", "Academy"},
["Elise"]        = {"Classic", "Death Blossom", "Victorious", "Blood Moon"},
["Evelynn"]      = {"Classic", "Shadow", "Masquerade", "Tango", "Safecracker"},
["Ezreal"]       = {"Classic", "Nottingham", "Striker", "Frosted", "Explorer", "Pulsefire", "TPA", "Debonair", "Ace of Spades"},
  -- F 
["FiddleSticks"] = {"Classic", "Spectral", "Union Jack", "Bandito", "Pumpkinhead", "Fiddle Me Timbers", "Surprise Party", "Dark Candy", "Risen"},
["Fiora"]        = {"Classic", "Royal Guard", "Nightraven", "Headmistress", "PROJECT"},
["Fizz"]         = {"Classic", "Atlantean", "Tundra", "Fisherman", "Void", "Chroma Pack: Orange", "Chroma Pack: Black", "Chroma Pack: Red", "Cottontail"},
  -- G  
["Galio"]        = {"Classic", "Enchanted", "Hextech", "Commando", "Gatekeeper", "Debonair"},
["Gangplank"]    = {"Classic", "Spooky", "Minuteman", "Sailor", "Toy Soldier", "Special Forces", "Sultan", "Captain"},
["Garen"]        = {"Classic", "Sanguine", "Desert Trooper", "Commando", "Dreadknight", "Rugged", "Steel Legion", "Chroma Pack: Garnet", "Chroma Pack: Plum", "Chroma Pack: Ivory", "Rogue Admiral"},
["Gnar"]         = {"Classic", "Dino", "Gentleman"},
["Gragas"]       = {"Classic", "Scuba", "Hillbilly", "Santa", "Gragas, Esq.", "Vandal", "Oktoberfest", "Superfan", "Fnatic", "Caskbreaker"},
["Graves"]       = {"Classic", "Hired Gun", "Jailbreak", "Mafia", "Riot", "Pool Party", "Cutthroat"},
  -- H 
["Hecarim"]      = {"Classic", "Blood Knight", "Reaper", "Headless", "Arcade", "Elderwood"},
["Heimerdinger"] = {"Classic", "Alien Invader", "Blast Zone", "Piltover Customs", "Snowmerdinger", "Hazmat"},
  -- I 
["Illaoi"]       = {"Classic", "Void Bringer"},
["Irelia"]       = {"Classic", "Nightblade", "Aviator", "Infiltrator", "Frostblade", "Order of the Lotus"},
  -- J 
["Janna"]        = {"Classic", "Tempest", "Hextech", "Frost Queen", "Victorious", "Forecast", "Fnatic"},
["JarvanIV"]     = {"Classic", "Commando", "Dragonslayer", "Darkforge", "Victorious", "Warring Kingdoms", "Fnatic"},
["Jax"]          = {"Classic", "The Mighty", "Vandal", "Angler", "PAX", "Jaximus", "Temple", "Nemesis", "SKT T1", "Chroma Pack: Cream", "Chroma Pack: Amber", "Chroma Pack: Brick", "Warden"},
["Jayce"]        = {"Classic", "Full Metal", "Debonair", "Forsaken"},
["Jinx"]         = {"Classic", "Mafia", "Firecracker", "Slayer"},
  -- K 
["Kalista"]      = {"Classic", "Blood Moon", "Championship"},
["Karma"]        = {"Classic", "Sun Goddess", "Sakura", "Traditional", "Order of the Lotus", "Warden"},
["Karthus"]      = {"Classic", "Phantom", "Statue of", "Grim Reaper", "Pentakill", "Fnatic", "Chroma Pack: Burn", "Chroma Pack: Blight", "Chroma Pack: Frostbite"},
["Kassadin"]     = {"Classic", "Festival", "Deep One", "Pre-Void", "Harbinger", "Cosmic Reaver"},
["Katarina"]     = {"Classic", "Mercenary", "Red Card", "Bilgewater", "Kitty Cat", "High Command", "Sandstorm", "Slay Belle", "Warring Kingdoms"},
["Kayle"]        = {"Classic", "Silver", "Viridian", "Unmasked", "Battleborn", "Judgment", "Aether Wing", "Riot"},
["Kennen"]       = {"Classic", "Deadly", "Swamp Master", "Karate", "Kennen M.D.", "Arctic Ops"},
["Khazix"]       = {"Classic", "Mecha", "Guardian of the Sands"},
["Kindred"]      = {"Classic", "Shadowfire"},
["KogMaw"]       = {"Classic", "Caterpillar", "Sonoran", "Monarch", "Reindeer", "Lion Dance", "Deep Sea", "Jurassic", "Battlecast"},
  -- L 
["Leblanc"]      = {"Classic", "Wicked", "Prestigious", "Mistletoe", "Ravenborn"},
["LeeSin"]       = {"Classic", "Traditional", "Acolyte", "Dragon Fist", "Muay Thai", "Pool Party", "SKT T1", "Chroma Pack: Black", "Chroma Pack: Blue", "Chroma Pack: Yellow", "Knockout"},
["Leona"]        = {"Classic", "Valkyrie", "Defender", "Iron Solari", "Pool Party", "Chroma Pack: Pink", "Chroma Pack: Azure", "Chroma Pack: Lemon", "PROJECT"},
["Lissandra"]    = {"Classic", "Bloodstone", "Blade Queen"},
["Lucian"]       = {"Classic", "Hired Gun", "Striker", "Chroma Pack: Yellow", "Chroma Pack: Red", "Chroma Pack: Blue", "PROJECT"},
["Lulu"]         = {"Classic", "Bittersweet", "Wicked", "Dragon Trainer", "Winter Wonder", "Pool Party"},
["Lux"]          = {"Classic", "Sorceress", "Spellthief", "Commando", "Imperial", "Steel Legion", "Star Guardian"},
  -- M 
["Malphite"]     = {"Classic", "Shamrock", "Coral Reef", "Marble", "Obsidian", "Glacial", "Mecha", "Ironside"},
["Malzahar"]     = {"Classic", "Vizier", "Shadow Prince", "Djinn", "Overlord", "Snow Day"},
["Maokai"]       = {"Classic", "Charred", "Totemic", "Festive", "Haunted", "Goalkeeper"},
["MasterYi"]     = {"Classic", "Assassin", "Chosen", "Ionia", "Samurai Yi", "Headhunter", "Chroma Pack: Gold", "Chroma Pack: Aqua", "Chroma Pack: Crimson", "PROJECT"},
["MissFortune"]  = {"Classic", "Cowgirl", "Waterloo", "Secret Agent", "Candy Cane", "Road Warrior", "Mafia", "Arcade", "Captain"},
["Mordekaiser"]  = {"Classic", "Dragon Knight", "Infernal", "Pentakill", "Lord", "King of Clubs"},
["Morgana"]      = {"Classic", "Exiled", "Sinful Succulence", "Blade Mistress", "Blackthorn", "Ghost Bride", "Victorious", "Chroma Pack: Toxic", "Chroma Pack: Pale", "Chroma Pack: Ebony"},
  -- N 
["Nami"]         = {"Classic", "Koi", "River Spirit", "Urf", "Chroma Pack: Sunbeam", "Chroma Pack: Smoke", "Chroma Pack: Twilight"},
["Nasus"]        = {"Classic", "Galactic", "Pharaoh", "Dreadknight", "Riot K-9", "Infernal", "Archduke", "Chroma Pack: Burn", "Chroma Pack: Blight", "Chroma Pack: Frostbite",},
["Nautilus"]     = {"Classic", "Abyssal", "Subterranean", "AstroNautilus", "Warden"},
["Nidalee"]      = {"Classic", "Snow Bunny", "Leopard", "French Maid", "Pharaoh", "Bewitching", "Headhunter", "Warring Kingdoms"},
["Nocturne"]     = {"Classic", "Frozen Terror", "Void", "Ravager", "Haunting", "Eternum"},
["Nunu"]         = {"Classic", "Sasquatch", "Workshop", "Grungy", "Nunu Bot", "Demolisher", "TPA", "Zombie"},
  -- O 
["Olaf"]         = {"Classic", "Forsaken", "Glacial", "Brolaf", "Pentakill", "Marauder"},
["Orianna"]      = {"Classic", "Gothic", "Sewn Chaos", "Bladecraft", "TPA", "Winter Wonder"},
  -- P 
["Pantheon"]     = {"Classic", "Myrmidon", "Ruthless", "Perseus", "Full Metal", "Glaive Warrior", "Dragonslayer", "Slayer"},
["Poppy"]        = {"Classic", "Noxus", "Lollipoppy", "Blacksmith", "Ragdoll", "Battle Regalia", "Scarlet Hammer"},
  -- Q 
["Quinn"]        = {"Classic", "Phoenix", "Woad Scout", "Corsair"},
  -- R 
["Rammus"]       = {"Classic", "King", "Chrome", "Molten", "Freljord", "Ninja", "Full Metal", "Guardian of the Sands"},
["Reksai"]       = {"Classic", "Eternum", "Pool Party"},
["Renekton"]     = {"Classic", "Galactic", "Outback", "Bloodfury", "Rune Wars", "Scorched Earth", "Pool Party", "Scorched Earth", "Prehistoric"},
["Rengar"]       = {"Classic", "Headhunter", "Night Hunter", "SSW"},
["Riven"]        = {"Classic", "Redeemed", "Crimson Elite", "Battle Bunny", "Championship", "Dragonblade", "Arcade"},
["Rumble"]       = {"Classic", "Rumble in the Jungle", "Bilgerat", "Super Galaxy"},
["Ryze"]         = {"Classic", "Human", "Tribal", "Uncle", "Triumphant", "Professor", "Zombie", "Dark Crystal", "Pirate", "Whitebeard"},
  -- S 
["Sejuani"]      = {"Classic", "Sabretusk", "Darkrider", "Traditional", "Bear Cavalry", "Poro Rider"},
["Shaco"]        = {"Classic", "Mad Hatter", "Royal", "Nutcracko", "Workshop", "Asylum", "Masked", "Wild Card"},
["Shen"]         = {"Classic", "Frozen", "Yellow Jacket", "Surgeon", "Blood Moon", "Warlord", "TPA"},
["Shyvana"]      = {"Classic", "Ironscale", "Boneclaw", "Darkflame", "Ice Drake", "Championship"},
["Singed"]       = {"Classic", "Riot Squad", "Hextech", "Surfer", "Mad Scientist", "Augmented", "Snow Day", "SSW"},
["Sion"]         = {"Classic", "Hextech", "Barbarian", "Lumberjack", "Warmonger"},
["Sivir"]        = {"Classic", "Warrior Princess", "Spectacular", "Huntress", "Bandit", "PAX", "Snowstorm", "Warden", "Victorious"},
["Skarner"]      = {"Classic", "Sandscourge", "Earthrune", "Battlecast Alpha", "Guardian of the Sands"},
["Sona"]         = {"Classic", "Muse", "Pentakill", "Silent Night", "Guqin", "Arcade", "DJ"},
["Soraka"]       = {"Classic", "Dryad", "Divine", "Celestine", "Reaper", "Order of the Banana"},
["Swain"]        = {"Classic", "Northern Front", "Bilgewater", "Tyrant"},
["Syndra"]       = {"Classic", "Justicar", "Atlantean", "Queen of Diamonds"},
  -- T 
["TahmKench"]    = {"Classic", "Master Chef"},
["Talon"]        = {"Classic", "Renegade", "Crimson Elite", "Dragonblade", "SSW"},
["Taric"]        = {"Classic", "Emerald", "Armor of the Fifth Age", "Bloodstone"},
["Teemo"]        = {"Classic", "Happy Elf", "Recon", "Badger", "Astronaut", "Cottontail", "Super", "Panda", "Omega Squad"},
["Thresh"]       = {"Classic", "Deep Terror", "Championship", "Blood Moon", "SSW"},
["Tristana"]     = {"Classic", "Riot Girl", "Earnest Elf", "Firefighter", "Guerilla", "Buccaneer", "Rocket Girl", "Chroma Pack: Navy", "Chroma Pack: Purple", "Chroma Pack: Orange", "Dragon Trainer"},
["Trundle"]      = {"Classic", "Lil' Slugger", "Junkyard", "Traditional", "Constable"},
["Tryndamere"]   = {"Classic", "Highland", "King", "Viking", "Demonblade", "Sultan", "Warring Kingdoms", "Nightmare"},
["TwistedFate"]  = {"Classic", "PAX", "Jack of Hearts", "The Magnificent", "Tango", "High Noon", "Musketeer", "Underworld", "Red Card", "Cutpurse"},
["Twitch"]       = {"Classic", "Kingpin", "Whistler Village", "Medieval", "Gangster", "Vandal", "Pickpocket", "SSW"},
  -- U 
["Udyr"]         = {"Classic", "Black Belt", "Primal", "Spirit Guard", "Definitely Not"},
["Urgot"]        = {"Classic", "Giant Enemy Crabgot", "Butcher", "Battlecast"},
  -- V 
["Varus"]        = {"Classic", "Blight Crystal", "Arclight", "Arctic Ops", "Heartseeker", "Swiftbolt"},
["Vayne"]        = {"Classic", "Vindicator", "Aristocrat", "Dragonslayer", "Heartseeker", "SKT T1", "Arclight", "Chroma Pack: Green", "Chroma Pack: Red", "Chroma Pack: Silver"},
["Veigar"]       = {"Classic", "White Mage", "Curling", "Veigar Greybeard", "Leprechaun", "Baron Von", "Superb Villain", "Bad Santa", "Final Boss"},
["Velkoz"]       = {"Classic", "Battlecast", "Arclight"},
["Vi"]           = {"Classic", "Neon Strike", "Officer", "Debonair", "Demon"},
["Viktor"]       = {"Classic", "Full Machine", "Prototype", "Creator"},
["Vladimir"]     = {"Classic", "Count", "Marquis", "Nosferatu", "Vandal", "Blood Lord", "Soulstealer", "Academy"},
["Volibear"]     = {"Classic", "Thunder Lord", "Northern Storm", "Runeguard", "Captain"},
  -- W 
["Warwick"]      = {"Classic", "Grey", "Urf the Manatee", "Big Bad", "Tundra Hunter", "Feral", "Firefang", "Hyena", "Marauder"},
["MonkeyKing"]   = {"Classic", "Volcanic", "General", "Jade Dragon", "Underworld"},
  -- X 
["Xerath"]       = {"Classic", "Runeborn", "Battlecast", "Scorched Earth", "Guardian of the Sands"},
["XinZhao"]      = {"Classic", "Commando", "Imperial", "Viscero", "Winged Hussar", "Warring Kingdoms", "Secret Agent"},
  -- Y 
["Yasuo"]        = {"Classic", "High Noon", "PROJECT"},
["Yorick"]       = {"Classic", "Undertaker", "Pentakill"},
  -- Z 
["Zac"]          = {"Classic", "Special Weapon", "Pool Party", "Chroma Pack: Orange", "Chroma Pack: Bubblegum", "Chroma Pack: Honey"},
["Zed"]          = {"Classic", "Shockblade", "SKT T1", "PROJECT"},
["Ziggs"]        = {"Classic", "Mad Scientist", "Major", "Pool Party", "Snow Day", "Master Arcanist"},
["Zilean"]       = {"Classic", "Old Saint", "Groovy", "Shurima Desert", "Time Machine", "Blood Moon"},
["Zyra"]         = {"Classic", "Wildfire", "Haunted", "SKT T1"},

}
