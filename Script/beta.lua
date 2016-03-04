require ('Inspired')
--if not pcall( require, "KLib" )  then  print("<font color=\"#FF0000\"><b> Krystra Mid Series  </b></font><font color=\"#FFFFFF\"> : This Script requires KLib.lua , go download it and safe it into Common folder" )return end
if not pcall( require, "OpenPredict" )  then  print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : OpenPredict should be in Common folder in order to use this script. " ) return end
if FileExist(COMMON_PATH .. "IPrediction.lua") then
  require 'IPrediction'
  ipred = true
end
local lastTimeTickCalled = 0
local loaddac = false
local loadiow = false
Version = "1.29"
LVersion = " 6.4"
Scriptname = "Krystra Mid Series"
Author = "Krystra"
list = "Leblanc , Lissandra , Viktor, Akali, Diana, Yasuo,Zed, Orianna , Twisted Fate "
link = "http://gamingonsteroids.com/topic/10502-beta-stage-krystra-mid-series-leblanc-viktor-lissandra-diana-akali-multi-prediction-orbwalk-support-expert-drawings-and-much-more/"
date = "27.02.2016"

--AutoUpdate("/Lonsemaria/Gos/master/Script/KrystraMidBundle.lua","/Lonsemaria/Gos/master/Version/midbundle.version",SCRIPT_PATH.."KrystraMidBundle.lua",1.29)
local Update  = {}
    Update.ScriptVersion = 1.27
    Update.UseHttps = true
    Update.Host = "raw.githubusercontent.com"
    Update.VersionPath = "/Lonsemaria/Gos/master/Version/Klib.version"
    Update.ScriptPath = "/Lonsemaria/Gos/master/Script/beta.lua"
    Update.SavePath = SCRIPT_PATH.."/beta.lua"
    Update.CallbackUpdate = function(new) print("<font color=\"#FF0000\"><b> "..Scriptname.."   </b></font><font color=\"#FFFFFF\"> : Updated to "..new..". Please F6 x2 to reload." ) end
    Update.CallbackNoUpdate = function(new)  print("<font color=\"#FF0000\"><b> "..Scriptname.."   </b></font><font color=\"#FFFFFF\"> :You are using Lastest Version ("..new..")" ) sayhello() end
    Update.Callbacknew = function(new)  print("<font color=\"#FF0000\"><b> "..Scriptname.."   </b></font><font color=\"#FFFFFF\"> : New Version found ("..new.."). Please wait..." ) end
    Update.CallbackError = function() print("<font color=\"#FF0000\"><b> "..Scriptname.."   </b></font><font color=\"#FFFFFF\"> : Error when checking update. Please try again." ) end
    Callback.Add("Load", function() AutoUpdater(Update.ScriptVersion, Update.UseHttps, Update.Host, Update.VersionPath, Update.ScriptPath, Update.SavePath, Update.CallbackUpdate, Update.CallbackNoUpdate, Update.Callbacknew, Update.CallbackError) end)
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
  "To use vip settings, You need to be a VIP user on   community.","Select Skin",
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

yasuospot = {
  {x = 3633.6062011719 , y = 51.888549804688, z = 7397.85546875},-- +
  {x = 1684.1527099609 , y = 52.838134765625, z = 8451.1015625}, --+
  {x = 3545.6989746094 , y = 50.916137695313, z = 6976.63671875},
  {x = 7281.1123046875 , y = 52.48046875, z = 5892.6801757813},
  {x = 8154.3564453125 , y = 51.550659179688, z = 3142.1145019531},

  {x = 13148.944335938 , y = 54.646240234375, z = 6437.7163085938},
  {x = 11132.174804688 , y = 52.203369140625, z = 7848.6010742188},
  {x = 10995.295898438 , y = 52.20361328125, z = 7482.541015625},

}

yasuospotend = {
  {x = 3589.552734375 , y = 52.169189453125, z = 7707.8466796875},-- +
  {x = 1992.1899414063 , y = 51.777709960938, z = 8496.0576171875}, --+
  {x = 3648.572265625 , y = 52.458862304688, z = 6701.93359375},
  {x = 7104.0532226563 , y = 58.594970703125, z = 5623.9267578125},
  {x = 8275.32421875 , y = 51.1298828125, z = 2851.9223632813},

  {x = 12853.529296875 , y = 51.646118164063, z = 6436.1352539063},
  {x = 11079.994140625 , y = 62.517578125, z = 8093.0014648438},
  {x = 11150.340820313 , y = 51.724975585938, z = 7232.6801757813},


}

class "Leblanc"
---//==================================================\\---
--|| > Leblanc İnit                          ||--
---\\==================================================//---
local qbuff1 = false
function Leblanc:__init()
  self.Q = {  range = 700 }
  self.W = { delay = 0.50, speed = 1300, width = 125, range = 600 , radius = 250 } --AOE true , Col false
  self.E = { delay = 0.25, speed = 1700, width = 55, range = 900 } --AOE false , Col true
  self.RW = { delay = 0.50, speed = 1300, width = 125, range = 600 , radius = 250 } --AOE true , Col false
  self.RE = { delay = 0.25, speed = 1750, width = 55, range = 925 } --AOE false , Col true
  if ipred then
    rSpell = IPrediction.Prediction({range = 600, speed = 1300, delay = 0.50, width = 125, type = "linear", name =myHero:GetSpellData(_R).name, collision = false})
    wSpell  = IPrediction.Prediction({range = 600, speed = 1300, delay = 0.50, width = 125, type = "linear",name =myHero:GetSpellData(_W).name,  collision = false})
    eSpell = IPrediction.Prediction({range = 925, speed = 1750, delay = 0.25, width = 55, type = "linear", name =myHero:GetSpellData(_E).name, collision = true})
  end
  self.tse = TargetSelector(925,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
  self.tsg = TargetSelector(950,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
  self:LoadMenu()
  lastSkin = 0
  Last_LevelSpell = 0
  Callback.Add("Load", function() self:onload() end)
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
  Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
  Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)
  Callback.Add("Draw", function() self:Draw() end)
  -- Callback.Add("ProcessSpell", function(x,y) self:ProcessSpell(x,y) end)
  --Callback.Add("ProcessSpellComplete", function(x,y) self:ProcessSpellComplete(x,y) end)
end
---//==================================================\\---
--|| > Leblanc Menu                            ||--
---\\==================================================//---
function Leblanc:onload()
  self:findorb()
end
function Leblanc:LoadMenu()
  self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )
  self.Config:Menu("combo",loc_eng[1])
  self.Config.combo:Boolean("useQ", loc_eng[2], true)
  self.Config.combo:Boolean("useW", loc_eng[3], true)
  self.Config.combo:Boolean("useE", loc_eng[4], true)
  self.Config.combo:Boolean("useR", loc_eng[5], true)
  self.Config.combo:Boolean("useI", loc_eng[6], true)
  --self.Config.combo:Boolean("gapclose", "Use W as a gapclose ( Beta )", false)
  self.Config.combo:DropDown("logic", loc_eng[7],   1, {loc_eng[116], loc_eng[117], loc_eng[118], loc_eng[119] ,"W>R>Q>E","W>Q>R>E","Q>R>W>E","Double Stun",loc_eng[120]})
  self.Config.combo:Menu( "turnw",loc_eng[121])
  self.Config.combo.turnw:DropDown("wbackhp", loc_eng[171]  ,  1, {loc_eng[172],loc_eng[173],loc_eng[174]})
  self.Config.combo.turnw:Slider("hp",loc_eng[104]   , 30, 10, 100, 1)
  self.Config.combo.turnw:DropDown("wbackcp", loc_eng[176] ,   1, {loc_eng[172],loc_eng[173],loc_eng[174]})
  self.Config.combo.turnw:DropDown("enemy",loc_eng[175]  ,  1, {loc_eng[130], loc_eng[131] , loc_eng[132],loc_eng[133] })
  self.Config.combo.turnw:Info("info2", loc_eng[177]   )
  self.Config.combo.turnw:Boolean("w1",loc_eng[122], false)
  self.Config.combo.turnw:Boolean("w2",loc_eng[123], false)
  self.Config.combo.turnw:Boolean("w3",loc_eng[124], false)
  self.Config.combo.turnw:Boolean("w4",loc_eng[125], false)
  self.Config.combo.turnw:Boolean("w5",loc_eng[178], false)
  self.Config.combo.turnw:Boolean("w6",loc_eng[179], false)
  self.Config.combo.turnw:Boolean("w7"," Q>R>E>W mode ", false)
  self.Config.combo.turnw:Boolean("w8"," Double Stun mode ", false)
  self.Config.combo.turnw:Boolean("w9",loc_eng[126], false)
  self.Config.combo:Slider("delay", "Delay For Double Stun" , 1650, 0, 3000, 1)
  self.Config.combo:Slider("Mana",loc_eng[8]   , 10, 10, 100, 1)

  self.Config:Menu( "harass",loc_eng[9])
  self.Config.harass:DropDown("logic","Harass Logic" ,   1, {"[ Q-W ]","[ Q-E ]","[ W-R ]"})
  self.Config.harass:Boolean("useQ", loc_eng[10], true)
  self.Config.harass:Boolean("useW", loc_eng[11], true)
  self.Config.harass:Boolean("useE", loc_eng[12], true)
  self.Config.harass:Boolean("useR", loc_eng[13], true)
  self.Config.harass:Slider("Mana",loc_eng[8]   , 10, 10, 100, 1)

  self.Config:Menu( "farm",loc_eng[14])

  self.Config.farm:Menu("laneclear",loc_eng[15])
  self.Config.farm.laneclear:Boolean("useQ",loc_eng[16], true)
  self.Config.farm.laneclear:Boolean("useW",loc_eng[17], true)
  self.Config.farm.laneclear:Slider("wcount",loc_eng[181]   , 2, 1, 10, 1)
  self.Config.farm.laneclear:Boolean("useR",loc_eng[19], false)
  self.Config.farm.laneclear:Slider("rcount",loc_eng[183]   , 2, 1, 10, 1)
  self.Config.farm.laneclear:Info("blank", ""   )
  self.Config.farm.laneclear:Info("blank", ""   )
  self.Config.farm.laneclear:Info("info2", loc_eng[184]   )
  self.Config.farm.laneclear:Slider("QMana",loc_eng[185]   , 30, 10, 100, 1)
  self.Config.farm.laneclear:Slider("WMana",loc_eng[186]   , 30, 10, 100, 1)
  self.Config.farm.laneclear:Slider("EMana",loc_eng[187]   , 30, 10, 100, 1)
  self.Config.farm.laneclear:Slider("RMana",loc_eng[188]   , 30, 10, 100, 1)

  self.Config.farm:Menu("jungleclear",loc_eng[20])
  self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21], true)
  self.Config.farm.jungleclear:Boolean("useW",loc_eng[22], true)
  self.Config.farm.jungleclear:Boolean("useE",loc_eng[23], true)
  self.Config.farm.jungleclear:Boolean("useR",loc_eng[24], false)
  self.Config.farm.jungleclear:Info("blank", ""   )
  self.Config.farm.jungleclear:Info("blank", ""   )
  self.Config.farm.jungleclear:Info("info2", loc_eng[184]   )
  self.Config.farm.jungleclear:Slider("QMana",loc_eng[185]   , 30, 10, 100, 1)
  self.Config.farm.jungleclear:Slider("WMana",loc_eng[186]   , 30, 10, 100, 1)
  self.Config.farm.jungleclear:Slider("EMana",loc_eng[187]   , 30, 10, 100, 1)
  self.Config.farm.jungleclear:Slider("RMana",loc_eng[188]   , 30, 10, 100, 1)

  self.Config.farm:Menu("lasthit",loc_eng[25])
  self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189], false)
  self.Config.farm.lasthit:Boolean("useQ",loc_eng[26], true)
  self.Config.farm.lasthit:Boolean("useE",loc_eng[28], true)
  self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191],   1, {loc_eng[172],loc_eng[174]})
  self.Config.farm.lasthit:Info("blank", ""   )
  self.Config.farm.lasthit:Info("blank", ""   )
  self.Config.farm.lasthit:Info("info2", loc_eng[184]   )
  self.Config.farm.lasthit:Slider("QMana",loc_eng[185]   , 30, 10, 100, 1)
  self.Config.farm.lasthit:Slider("EMana",loc_eng[187]   , 30, 10, 100, 1)

  self.Config:Menu("escape",loc_eng[30])
  self.Config.escape:Boolean("useW",loc_eng[32], true)
  self.Config.escape:Boolean("useR",loc_eng[34], false)


  self.Config:Menu("killsteal",loc_eng[35])
  self.Config.killsteal:Boolean("ks",loc_eng[36], true)
  self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
  self.Config.killsteal:Boolean("useW", loc_eng[38], true)
  self.Config.killsteal:Boolean("useE", loc_eng[39], true)
  self.Config.killsteal:Boolean("useR", loc_eng[40], true)
  self.Config.killsteal:Boolean("useQW", loc_eng[127], true)
  self.Config.killsteal:Boolean("useI", loc_eng[41], true)

  self.Config:Menu( "item",loc_eng[42])
  self.Config.item:Menu( "autopot",loc_eng[192])
  self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
  self.Config.item.autopot:Slider("autopothp", loc_eng[194] , 10, 0, 100, 1)
  self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
  self.Config.item:Slider("autozhonya", loc_eng[44] , 10, 0, 100, 1)
  self.Config.item:Boolean("usehg", loc_eng[45],  false)
  self.Config.item:Boolean("usebg", loc_eng[46],  false)

  self.Config:Menu( "misc",loc_eng[92])
  self.Config.misc:Menu( "walljump","[" .. myHero.charName.. "] - Wall Jump Settings")
  self.Config.misc.walljump:Boolean("Draw", "Draw Wall Jump Locations", true)
  self.Config.misc.walljump:Boolean("Drawr", "Use Range While Drawing", false)
  self.Config.misc.walljump:Slider("Drawrrange", "Draw Locations If Range >" , 10, 1000, 10000, 1)
  self.Config.misc.walljump:Info("blank", ""   )
  self.Config.misc.walljump:Info("blank", "        [Color Settings]"   )
  self.Config.misc.walljump:ColorPick("fcolor", "Location 1 Color",   {255, 255, 255, 255})
  self.Config.misc.walljump:ColorPick("f2color", "Location 2 Color",   {255, 255, 255, 255})
  self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
  self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
  self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
  self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
  self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
  self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
  self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
  self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)

  Clock = os.clock()


  self.Config:Menu("other",loc_eng[65])
  self.Config.other:Menu( "draw",loc_eng[66])
  self.Config.other.draw:Boolean("qdraw",loc_eng[67], true)
  self.Config.other.draw:Boolean("wdraw",loc_eng[68], true)
  self.Config.other.draw:Boolean("edraw",loc_eng[69], true)
  self.Config.other.draw:Boolean("rdraw",loc_eng[70], true)
  self.Config.other.draw:Boolean("aadraw",loc_eng[71], false)
  --self.Config.other.draw:Boolean("rtdraw",loc_eng[197], false)
  self.Config.other:Menu( "color", loc_eng[198])
  self.Config.other.color:ColorPick("Qcolor", loc_eng[199],   {255, 255, 255, 255})
  self.Config.other.color:ColorPick("Wcolor", loc_eng[200],   {255, 255, 255, 255})
  self.Config.other.color:ColorPick("Ecolor", loc_eng[201],   {255, 255, 255, 255})
  self.Config.other.color:ColorPick("Rcolor", loc_eng[202],   {255, 255, 255, 255})
  self.Config.other.color:ColorPick("E2color", loc_eng[203],   {255, 255, 255, 255})
  self.Config.other.color:ColorPick("AAcolor", loc_eng[204],   {255, 255,0,0})
  -- self.Config.other.color:ColorPick("targetselect", loc_eng[205],   {255, 255,0,0})
  self.Config.other:Boolean("combomode",loc_eng[72], true)
  --self.Config.other:Menu( "perma",loc_eng[73])
  --self.Config.other.perma:Boolean("perma",loc_eng[74], true)
  -- self.Config.other:Boolean("target",loc_eng[75], true)
  self.Config.other:Boolean("damage",loc_eng[214], true)
  self.Config.other:Boolean("targetcal",loc_eng[76], true)

  self.Config:Menu("targetsel",loc_eng[77])
  self.Config.targetsel:Info("infoK2", ""   )
  self.Config.targetsel:Info("infoK", ""   )
  self.Config.targetsel:Boolean("ts",loc_eng[78], false)


  self.Config:Menu("orb","Orbwalker Settings")
  self.Config.orb:Menu( "selectorb","Current Orbwalker :")

  self.Config:Menu("pred","Prediction Settings")
  self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
  self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
  self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
  self.Config.pred.hcgeneral.hcop:Slider("hcopw", "W Hitchance " , 30, 0, 100, 1)
  self.Config.pred.hcgeneral.hcop:Slider("hcope", "E Hitchance " , 30, 0, 100, 1)
  self.Config.pred.hcgeneral.hcop:Slider("hcopr", "r Hitchance " , 30, 0, 100, 1)
  self.Config.pred:Info("blank", "    Currently Open Prediction "   )
  self.Config.pred:Info("blank", "      is best with this bundle"   )


  self.Config:Menu( "Keys",loc_eng[79])
  self.Config.Keys:Info("infoK3", loc_eng[80]   )
  self.Config.Keys:Key("combokey", loc_eng[81], string.byte(" "))
  self.Config.Keys:Key("onlye", loc_eng[128], string.byte("O"))
  self.Config.Keys:Key("combomode", loc_eng[129],  string.byte("2"))
  self.Config.Keys:Info("infoK4", loc_eng[82]   )
  self.Config.Keys:Key("harasskey", loc_eng[83],    string.byte("C"))
  -- self.Config.Keys:Boolean("harasstoglekey", "Harass Togle Key",, string.byte("T"))
  self.Config.Keys:Info("infoK5", loc_eng[84]   )
  self.Config.Keys:Key("lasthitkey",loc_eng[215],    string.byte("X"))
  self.Config.Keys:Key("laneclearkey", loc_eng[85],    string.byte("V"))
  self.Config.Keys:Key("jungleclearkey", loc_eng[86],    string.byte("V"))
  --self.Config.Keys:Boolean("lasthitkey", "Lasthit Key",    string.byte("X"))
  self.Config.Keys:Info("infoK6", loc_eng[87]   )
  self.Config.Keys:Key("escapekey", loc_eng[88],    string.byte("Y"))
  self.Config.Keys:Key("wallkey", "Wall Jump Key",    string.byte("T"))
  self.Config.Keys:Info("infoK", "Make Sure That Your Orbwalker"   )
  self.Config.Keys:Info("infoK2", loc_eng[89]   )

  --self.Config:Boolean("lang", loc_eng[165]    1, {loc_eng[166], loc_eng[167],loc_eng[168]})
  self.Config:Info("infoK","           "..Scriptname.."" )
  self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
  self.Config:Info("infoK","   Script was made by  "..Author.. "" )
  self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
  self.Config:Boolean("instruct", loc_eng[216], false)


end
---//==================================================\\---
--|| > Leblanc Tick                         ||--
---\\==================================================//---
function Leblanc:Tick()
  self:Checks()
  if(self.Config.Keys.combokey:Value() )then
    self:combo()
  end
  self:autowback()
  if self.Config.Keys.wallkey:Value() then self:walljump() end
  self:Antiafk()
  self:autolevel()
  self:skinhack()
  self:autopot()
  self:items()
  if( self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
    self:LastHit()
  end
  if(self.Config.Keys.onlye:Value()   )then
    self:onlye()
  end
  if(self.Config.Keys.escapekey:Value() )then
    self:escape()
  end
  if(self.Config.killsteal.ks:Value() ) then
    self:killsteal()
  end
  if(self.Config.Keys.harasskey:Value()   ) then
    self:harass()
  end
  if(self.Config.Keys.laneclearkey:Value() )then
    self:LaneClear()
  end
  if(self.Config.Keys.jungleclearkey:Value() )then
    self:JungleClear()
  end
  if self.Config.instruct:Value() then
    self.Config.instruct:Value(false)
    PopUp1 = true
  end
  self:checkothers()
end
function Leblanc:Checks()
  Gtarget = self.tsg:GetTarget()
  if not ValidTarget(Gtarget, 925) or not self.Config.targetsel.ts:Value()  then
    target = GetCurrentTarget()
  elseif  ValidTarget(Gtarget, 925) and not self.selectedTar then
    target = GetCurrentTarget()
  elseif (ValidTarget(Gtarget, 925) and self.selectedTar) then
    target = self.selectedTar
  end
  Etarget = self.tse:GetTarget()
  mousePos = GetMousePos()
end
---//==================================================\\---
--|| > Leblanc Drawings                                ||--
---\\==================================================//---
function Leblanc:combomode()
  local drawpos = GetHPBarPos(myHero)
  if self.Config.combo.logic:Value()  == 1 then
    DrawText("Current Combo Mode: Q>E>W>R", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
    if self.Config.combo.logic:Value()  == 2 then
      DrawText("Current Combo Mode: Q>R>E>W", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
      if self.Config.combo.logic:Value()  == 3 then
        DrawText("Current Combo Mode: E>Q>W>R", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
        if self.Config.combo.logic:Value()  == 4 then
          DrawText("Current Combo Mode: E>W>Q>R", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
          if self.Config.combo.logic:Value()  == 5 then
            DrawText("Current Combo Mode: W>R>Q>E", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
            if self.Config.combo.logic:Value()  == 6 then
              DrawText("Current Combo Mode: W>Q>R>E", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
              if self.Config.combo.logic:Value()  == 7 then
                DrawText("Current Combo Mode: Q>R>W>E", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
                if self.Config.combo.logic:Value()  == 8 then
                  DrawText("Current Combo Mode: Double Stun", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
                  if self.Config.combo.logic:Value()  == 9 then
                    DrawText("Current Combo Mode: Random Skill Order", 12, drawpos.x-40, drawpos.y+16, 0xff00ffff) end
                  end
                  function Leblanc:Draw()
                    if self.Config.other.combomode:Value() then
                      self:combomode()
                    end
                    if self.Config.misc.walljump.Draw:Value()then
                      if self.Config.misc.walljump.Drawr:Value() then
                        for k, v in pairs(lbspot) do
                          if GetDistance(v, myHero) < self.Config.misc.walljump.Drawrrange:Value() then
                            DrawCircle(v.x, v.y, v.z, 100,1,0,self.Config.misc.walljump.fcolor:Value())
                          end
                        end
                        for k, v in pairs(lbspotend) do
                          if GetDistance(v, myHero) < self.Config.misc.walljump.Drawrrange:Value() then
                            DrawCircle(v.x, v.y, v.z, 100,1,0, self.Config.misc.walljump.f2color:Value())
                          end
                        end
                      elseif not self.Config.misc.walljump.Drawr:Value() then
                        for k, v in pairs(lbspot) do
                          DrawCircle(v.x, v.y, v.z, 100,1,0,self.Config.misc.walljump.fcolor:Value())
                        end
                        for k, v in pairs(lbspotend) do
                          DrawCircle(v.x, v.y, v.z, 100,1,0, self.Config.misc.walljump.f2color:Value())
                        end
                      end
                    end

                    if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
                      DrawCircle(myHero.x, myHero.y, myHero.z, 650,1,0,self.Config.other.color.Qcolor:Value())
                    end

                    if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
                      DrawCircle(myHero.x, myHero.y, myHero.z, 600,1,0,self.Config.other.color.Wcolor:Value())
                    end

                    if self.Config.other.draw.edraw:Value() and IsReady(_E) then
                      DrawCircle(myHero.x, myHero.y, myHero.z, 925,1,0,self.Config.other.color.Ecolor:Value())
                    end

                    if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
                      DrawCircle(myHero.x, myHero.y, myHero.z, 700,1,0,self.Config.other.color.Rcolor:Value())
                    end
                    if self.Config.other.draw.aadraw:Value() then
                      DrawCircle(myHero.x, myHero.y, myHero.z, 550,1,0, self.Config.other.color.AAcolor:Value())
                    end

                    for _, target in pairs(GetEnemyHeroes()) do
                      if ValidTarget(target, 15000) then
                        if target.visible and not target.dead and self.Config.other.damage:Value() then
                          currLine = 1
                          -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
                          DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
                          currLine = currLine + 1
                          DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
                        end
                      end
                    end
                    if self.Config.other.targetcal:Value() and not myHero.dead then
                      if target and target ~= nil then
                        --  local target= GetOrigin(target)
                        local drawpos=WorldToScreen(1,target.x, target.y, target.z)
                        local comboText,color = self:GetDraws(target)
                        if comboText then
                          DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
                        end
                      end
                    end
                    local rs = GetResolution()
                    if PopUp1 then
                      local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
                      DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
                      DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
                      DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
                      DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
                      DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
                      DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
                      DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
                      DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
                      DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
                      DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
                      DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
                      DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
                      -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
                      -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
                      -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
                      -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
                      local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
                      --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
                      --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
                      FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
                      DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
                    end
                  end
                  ---//==================================================\\---
                  --|| > Leblanc Harass             ||--
                  ---\\==================================================//---
                  function Leblanc:harass()
                    if self.Config.harass.logic:Value() == 1 then
                      if self.Config.Keys.harasskey:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 )  then
                        self:CastQWH(target)
                      end
                    elseif self.Config.harass.logic:Value() == 2 then
                      if self.Config.Keys.harasskey:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 )  then
                        self:CastQEH(target)
                      end
                    elseif self.Config.harass.logic:Value() == 3 then
                      if self.Config.Keys.harasskey:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 )  then
                        self:CastWRH(target)
                      end
                    end
                  end
                  ---//==================================================\\---
                  --|| > Leblanc Wall Jump            ||--
                  ---\\==================================================//---
                  function Leblanc:walljump()
                    if not IsReady(_W) or self:wUsed() then return end
                    for k, loc in pairs(lbspot) do
                      if GetDistance(loc, myHero) < 250 and GetDistance(loc, myHero) > 50 then
                        MoveToXYZ(loc.x, loc.y, loc.z)
                      end
                      if GetDistance(loc, myHero) < 20 and not self:wUsed()  then
                        CastSkillShot(_W, lbspotend[k].x,lbspotend[k].y, lbspotend[k].z)
                        --myHero:MoveTo(lbspotend[k].x, lbspotend[k].z)
                      end
                    end

                    for k, loc in pairs(lbspotend) do
                      if GetDistance(loc, myHero) < 250 and GetDistance(loc, myHero) > 50 then
                        MoveToXYZ(loc.x, loc.y, loc.z)
                      end
                      if GetDistance(loc, myHero) < 20 and not self:wUsed()  then
                        CastSkillShot(_W, lbspot[k].x,lbspot[k].y, lbspot[k].z)
                        --myHero:MoveTo(lbspot[k].x, lbspot[k].z)
                      end
                    end
                  end
                  function Leblanc:escape()
                    if self.Config.Keys.escapekey:Value()  and self.Config.escape.useW:Value() and not self:wUsed() then
                      CastSkillShot(_W, mousePos)
                    end
                    if self.Config.Keys.escapekey:Value()  then
                      self:walk()
                    end
                    if self.Config.Keys.escapekey:Value()  and self.Config.escape.useR:Value() and not  self:rUsed() then
                      CastSkillShot(_R, mousePos)
                    end
                  end
                  function Leblanc:walk()
                    MoveToXYZ(mousePos)
                  end
                  function Leblanc:autowback()
                    if GetCastName(myHero,_W) == "LeblancSlideReturn" then
                      if self.Config.combo.turnw.wbackhp:Value() == 1 and self.Config.Keys.combokey:Value() then
                        if myHero.health <= (myHero.maxHealth * self.Config.combo.turnw.hp:Value() / 100) then
                          CastSpell(_W)
                        end
                      end
                    end
                    if GetCastName(myHero,_W) == "LeblancSlideReturn" then
                      if self.Config.combo.turnw.wbackcp:Value() == 1 and self.Config.Keys.combokey:Value() then
                        if self.Config.combo.turnw.enemy:Value() == 1 then
                          if EnemiesAround(myHeroPos() , 550) >= 2 then
                            CastSpell(_W)
                          end
                        elseif self.Config.combo.turnw.enemy:Value() == 2 then
                          if EnemiesAround(myHeroPos() , 550) >= 3 then
                            CastSpell(_W)
                          end
                        elseif self.Config.combo.turnw.enemy:Value() == 3 then
                          if EnemiesAround(myHeroPos() , 550) >= 4 then
                            CastSpell(_W)
                          end
                        elseif self.Config.combo.turnw.enemy:Value() == 4 then
                          if EnemiesAround(myHeroPos() , 550) >= 5 then
                            CastSpell(_W)
                          end
                        end
                      end
                    end
                  end
                  ---//==================================================\\---
                  --|| > Leblanc Clear Settings                 ||--
                  ---\\==================================================//---
                  function Leblanc:LaneClear()
                    for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_ENEMY then
                        if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useQ:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.QMana:Value() /100 ) and GetDistance(minion) <= 700 then
                          self:CastQ(minion)
                        end
                      end
                    end
                    if (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.WMana:Value() /100 ) then
                      local NumberOfHits = self.Config.farm.laneclear.wcount:Value()
                      if IsReady(_W) then
                        if  self.Config.farm.laneclear.useW:Value()   then
                          local BestPos, BestHit =  GetFarmPosition(self.W.range, self.W.width, MINION_ENEMY)
                          if BestPos   and  BestHit >= NumberOfHits then
                            CastSkillShot(_W, BestPos)
                          end
                        end
                      end
                    end
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.RMana:Value() /100 ) then
                      local NumberOfHits = self.Config.farm.laneclear.rcount:Value()
                      if IsReady(_R) then
                        if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useR:Value() and GetCastName(myHero,_R) == 'LeblancSlideM'  then
                          local BestPos, BestHit = GetFarmPosition(self.RW.range, self.RW.width, MINION_ENEMY)
                          if BestPos  and BestHit >= NumberOfHits then
                            CastSkillShot(_R, BestPos)
                          end
                        end
                      end
                    end
                  end


                  function Leblanc:LastHit()
                    for _, target in pairs(minionManager.objects) do
                      if IsObjectAlive(target) and GetTeam(target) == MINION_ENEMY then
                        if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
                          local Qdamage = self:GetQ2Dmg(target)
                          if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.QMana:Value() /100 ) and ValidTarget(target,700)   and Qdamage >= GetCurrentHP(target)) then
                            self:CastQ(target)
                          end
                          local Edamage = self:GetE2Dmg(target)
                          if(IsReady(_E)and self.Config.farm.lasthit.useE:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.EMana:Value() /100 )and  ValidTarget(target,925) and Edamage >= GetCurrentHP(target)) then
                            self:CastE(target)
                          end
                        end
                      end
                    end
                  end
                  function Leblanc:UpdateBuff(unit,buff)
                    if unit and unit.team ~= myHero.team and unit.type == myHero.type then
                      if buff.Name:lower():find("leblancchaosorb") then
                        qbuff1 = true
                      end
                    end
                  end
                  function Leblanc:RemoveBuff(unit, buff)
                    if unit and unit.team ~= myHero.team and unit.type == myHero.type then
                      if buff.Name:lower():find("leblancchaosorb") then

                        qbuff1 = false
                      end
                    end
                  end
                  function Leblanc:JungleClear()
                    for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_JUNGLE then
                        if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useQ:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.QMana:Value() /100 ) and GetDistance(minion) <= 700 then
                          self:CastQ(minion)
                        end
                      end
                    end
                    for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_JUNGLE then
                        if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useE:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.EMana:Value() /100 ) and GetDistance(minion) <= 700 then
                          self:CastE(minion)
                        end
                      end
                    end
                    if (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.WMana:Value() /100 ) then
                      if IsReady(_W) then
                        if  self.Config.farm.jungleclear.useW:Value()   then
                          local BestPos, BestHit =  GetFarmPosition(self.W.range, self.W.width, MINION_JUNGLE)
                          if BestPos   and  BestHit >= 1 then
                            CastSkillShot(_W, BestPos)
                          end
                        end
                      end
                    end
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.RMana:Value() /100 ) then
                      if IsReady(_R) then
                        if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useR:Value() and GetCastName(myHero,_R) == 'LeblancSlideM'  then
                          local BestPos, BestHit = GetFarmPosition(self.RW.range, self.RW.width, MINION_JUNGLE)
                          if BestPos  and BestHit >= 1 then
                            CastSkillShot(_R, BestPos)
                          end
                        end
                      end
                    end
                  end



                  ---//==================================================\\---
                  --|| > Leblanc Extras                  ||--
                  ---\\==================================================//---
                  function Leblanc:Antiafk()
                    if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
                    Clock = os.clock() + math.random(60,120)
                    MoveToXYZ(myHeroPos())
                  end
                  function Leblanc:skinhack()
                    if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
                      lastTimeTickCalled = CurrentTimeInMillis()
                      if  self.Config.misc.skinhack.useskin:Value() then
                        if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                          lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
                          HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
                        end
                      end
                    end
                  end
                  local spellLevel = 0
                  function Leblanc:autolevel()
                    if GetLevelPoints(myHero) >= 1 then
                      if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =   { _W,_Q,_E,_W,_Q,_R,_W,_W,_Q,_E,_R,_W,_Q,_Q,_E,_R,_E,_E}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                    end
                  end
                  lastPotion = 0
                  function Leblanc:autopot()
                    if os.clock() - lastPotion < 15 then return end
                    for SLOT = ITEM_1, ITEM_6 do
                      if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
                        if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
                          CastSpell(SLOT)
                          lastPotion = os.clock()
                        end
                      end
                    end
                  end
                  function Leblanc:items()
                    if self.Config.item.usebg:Value() and self.Config.Keys.combokey:Value() then
                      for _ = ITEM_1, ITEM_7 do
                        if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
                      end
                    end
                  end
                  if self.Config.item.usehg:Value() and self.Config.Keys.combokey:Value() then
                    for _ = ITEM_1, ITEM_7 do
                      if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastTargetSpell(target, _)
                    end
                  end
                end
                if self.Config.item.enableautozhonya:Value() then
                  for _ = ITEM_1, ITEM_7 do
                    if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya:Value() / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
                  end
                end
              end
            end
            ---//==================================================\\---
            --|| > Leblanc Casting    // Basics                    ||--
            ---\\==================================================//---
            function Leblanc:CastQ(unit)
              if IsReady(_Q) then
                CastTargetSpell(unit, _Q)
              end
            end
            function Leblanc:CastW(unit)
              if self.Config.pred.selectpred:Value() == 1 then
                local WPred = GetCircularAOEPrediction(unit, self.W)
                if IsReady(_W) then
                  if WPred  and WPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopw:Value()/100) then
                    CastSkillShot(_W, WPred.castPos)
                  end
                end
              elseif  self.Config.pred.selectpred:Value() == 2 then
                if ipred then
                  local HitChance, y = wSpell:Predict(unit)
                  if IsReady(_W) and HitChance >= 3 then
                    CastSkillShot(_W, y.x, y.y, y.z)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 3 then
                local wPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1300, 500, 600, 125, false, true)
                if IsReady(_W) and wPred.HitChance == 1 then
                  CastSkillShot(_W, wPred.PredPos.x, wPred.PredPos.y, wPred.PredPos.z)
                end
              end
            end
            function Leblanc:CastE(unit)
              if self.Config.pred.selectpred:Value() == 1 then
                local EPred = GetPrediction(unit, self.E)
                if IsReady(_E) then
                  if EPred  and EPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcope:Value()/100) and not EPred:mCollision(1) then
                    CastSkillShot(_E, EPred.castPos)
                  end
                end
              elseif  self.Config.pred.selectpred:Value() == 2 then
                if ipred then
                  local HitChance, y = eSpell:Predict(unit)
                  if IsReady(_E) and HitChance >= 3 then
                    CastSkillShot(_E, y.x, y.y, y.z)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 3 then
                local wPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1750, 250, 925, 55, true, true)
                if IsReady(_W) and wPred.HitChance == 1 then
                  CastSkillShot(_E, wPred.PredPos.x, wPred.PredPos.y, wPred.PredPos.z)
                end
              end
            end
            function Leblanc:CastR(unit)
              if self.Config.pred.selectpred:Value() == 1 then
                local WPred = GetCircularAOEPrediction(unit, self.W)
                if IsReady(_R) then
                  if WPred  and WPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopr:Value()/100) then
                    CastSkillShot(_R, WPred.castPos)
                  end
                end
              elseif  self.Config.pred.selectpred:Value() == 2 then
                if ipred then
                  local HitChance, y = rSpell:Predict(unit)
                  if IsReady(_R) and HitChance >= 3 then
                    CastSkillShot(_R, y.x, y.y, y.z)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 3 then
                local wPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1300, 500, 600, 125, false, true)
                if IsReady(_R) and eSpell.HitChance == 1 then
                  CastSkillShot(_R, wPred.PredPos.x, wPred.PredPos.y, wPred.PredPos.z)
                end
              end
            end
            function Leblanc:CastRQ(unit)
              if GetCastName(myHero,_R) == 'LeblancChaosOrbM' then
                if IsReady(_R) then
                  CastTargetSpell(unit, _R)
                end
              end
            end
            function Leblanc:CastRE(unit)
              if self.Config.pred.selectpred:Value() == 1 then
                local EPred = GetPrediction(unit, self.E)
                if GetCastName(myHero,_R) == 'LeblancSoulShackleM' then
                  if IsReady(_R) then
                    if EPred  and EPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopr:Value()/100) and not EPred:mCollision(1) then
                      CastSkillShot(_R, EPred.castPos)
                    end
                  end
                end
              elseif  self.Config.pred.selectpred:Value() == 2 then
                if ipred then
                  local HitChance, y = rSpell:Predict(target)
                  if IsReady(_R) and HitChance >= 3 then
                    CastSkillShot(_R, y.x, y.y, y.z)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 3 then
                local wPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1750, 250, 925, 55, true, true)
                if IsReady(_R) and wPred.HitChance == 1 then
                  CastSkillShot(_R, wPred.PredPos.x, wPred.PredPos.y, wPred.PredPos.z)
                end
              end
            end
            function Leblanc:CastI(unit)
              local Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
              if Ignite then
                if IsReady(Ignite) then
                  CastTargetSpell(unit, Ignite)
                end
              end
            end
            ---//==================================================\\---
            --|| > Leblanc Casting    // Detailed                   ||--
            ---\\==================================================//---

            function Leblanc:CastQE(unit)
              if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value()and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                self:CastQ(unit)
              end
              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_E)) then
                self:CastE(unit)
              end
            end
            function Leblanc:CastEW(unit)
              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_E))then
                self:CastE(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()   and not self:wUsed() and IsReady(_W)) then
                self:CastW(unit)
              end
            end
            function Leblanc:CastEWB(unit)

              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_E))then
                self:CastE(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_W)) then
                self:CastW(unit)
              end
            end
            function Leblanc:CastQW(unit)

              if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                self:CastQ(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()   and not self:wUsed() and IsReady(_W)) then
                self:CastW(unit)
              end
            end
            function Leblanc:CastQWB(unit)

              if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                self:CastQ(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_W)) then
                self:CastW(unit)
              end
            end
            function Leblanc:CastWE(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()   and not self:wUsed() and IsReady(_W)) then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_E))then
                self:CastE(unit)
              end
            end
            function Leblanc:CastWEB(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_W)) then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_E))then
                self:CastE(unit)
              end
            end
            function Leblanc:CastQR(unit)


              if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                self:CastQ(unit)
              end

              if(GetDistance(target) <= 600  and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_R)) then
                self:CastRQ(unit)
              end
            end
            function Leblanc:CastWR(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_W)and not self:wUsed())then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_R)) and not self:rUsed()  then
                self:CastR(unit)
              end
            end
            function Leblanc:CastWR2(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_W)and not self:wUsed())then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_R)) then
                self:CastR(unit)
              end
            end
            function Leblanc:CastWQ(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_W)and not self:wUsed())then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_Q))  then
                self:CastQ(unit)
              end
            end
            function Leblanc:CastRE1(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_R))   then
                self:CastRQ(unit)
              end

              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_E)) then
                self:CastE(unit)
              end
            end
            function Leblanc:CastER(unit)

              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_E)) then
                self:CastE(target)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()   and GetCastName(myHero,_R) == 'LeblancSoulShackleM' and IsReady(_R))   then
                DelayAction(function() self:CastRE(target)end ,self.Config.combo.delay:Value()/1000)
              end
            end
            function Leblanc:CastWRB(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_W))then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_R)) and not self:rUsed()  then
                self:CastR(unit)
              end
            end
            function Leblanc:CastWRB2(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_W))then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.combo.use:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_R)) then
                self:CastR(unit)
              end
            end
            function Leblanc:CastWQB(unit)

              if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_W))then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_Q))  then
                self:CastQ(unit)
              end
            end
            function Leblanc:CastQWH(unit)

              if(GetDistance(target) <= 700 and self.Config.harass.useQ:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_Q) and IsReady(_W))then
                self:CastQ(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.harass.useW:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_W) and not IsReady(_Q))then
                self:CastW(unit)
              end
            end
            function Leblanc:CastQEH(unit)

              if(GetDistance(target) <= 700 and self.Config.harass.useQ:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_Q) and IsReady(_E))then
                self:CastQ(unit)
              end

              if(GetDistance(target) <= 925 and self.Config.harass.useE:Value() and  self.Config.Keys.harasskey:Value() and qbuff1 and IsReady(_E) and not IsReady(_Q))then
                self:CastE(unit)
              end
            end
            function Leblanc:CastWRH(unit)

              if(GetDistance(target) <= 600 and self.Config.harass.useW:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_W) and not self:wUsed() and IsReady(_R))then
                self:CastW(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.harass.useR:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_R) )then
                self:CastR(unit)
              end
              if not IsReady(_R) then
                self:CastW(unit)
              end
            end
            function Leblanc:CastQWK(unit)

              if(GetDistance(target) <= 700 and self.Config.killsteal.useQW:Value() and  self.Config.killsteal.ks:Value() and IsReady(_Q))then
                self:CastQ(unit)
              end

              if(GetDistance(target) <= 600 and self.Config.killsteal.useQW:Value() and not self:wUsed() and self.Config.killsteal.ks:Value()and IsReady(_W))then
                self:CastW(unit)
              end
            end
            function Leblanc:CastEQ(unit)


              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_E))then
                self:CastE(unit)
              end

              if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()   and IsReady(_Q)) then
                self:CastQ(unit)
              end
            end
            ---//==================================================\\---
            --|| > Leblanc Combo                             ||--
            ---\\==================================================//---
            function Leblanc:combo()
              if self.Config.combo.logic:Value() == 1 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                self:comboQEWR()
              end
              if self.Config.combo.logic:Value() == 2 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                self:comboQREW()
              end
              if self.Config.combo.logic:Value() == 3 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                self:comboEQWR()
              end
              if self.Config.combo.logic:Value() == 4 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                --  print "no"
                self:comboEWQR()
              end
              if self.Config.combo.logic:Value() == 5 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                --print "denem1"
                self:comboWRQE()
              end
              if self.Config.combo.logic:Value() == 6 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                self:comboWQRE()
              end
              if self.Config.combo.logic:Value() == 7 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                self:comboQRWE()
              end
              if self.Config.combo.logic:Value() == 8 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                self:comboDB()
              end
              if self.Config.combo.logic:Value() == 9 and (myHero.mana / myHero.maxMana >= self.Config.combo.Mana:Value() /100 ) then
                self:randomcombo()
              end
              if(self.Config.combo.useI:Value() and self.Config.Keys.combokey:Value()   )then
                for _, unit in pairs(GetEnemyHeroes()) do
                  local dmgI =(50+ ((myHero.level)*20))
                  local health=unit.health
                  if(health<dmgI and self.Config.combo.useI:Value() and GetDistance(unit)<600)then
                    self:CastI(unit)
                  end
                end
              end
            end
            function Leblanc:comboQEWR()

              if not self.Config.combo.turnw.w1:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastQE(target)
                end
                if(GetDistance(target) <= 600 ) and self:QEused() then
                  self:CastWR(target)
                end
              end
              if self.Config.combo.turnw.w1:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastQE(target)
                end
                if(GetDistance(target) <= 600 ) and self:QEused() then
                  self:CastWRB(target)
                end
              end
            end
            function Leblanc:comboQREW()

              if not self.Config.combo.turnw.w2:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastQR(target)
                end
                if(GetDistance(target) <= 600 ) and self:QRused() then
                  self:CastEW(target)
                end
              end
              if self.Config.combo.turnw.w2:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastQR(target)
                end
                if(GetDistance(target) <= 600 ) and self:QRused() then
                  self:CastEWB(target)
                end
              end
            end
            function Leblanc:comboEQWR()

              if not self.Config.combo.turnw.w3:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastEQ(target)
                end
                if(GetDistance(target) <= 600 ) and self:EQused() then
                  self:CastWR(target)
                end
              end
              if  self.Config.combo.turnw.w3:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastEQ(target)
                end
                if(GetDistance(target) <= 600 ) and self:EQused() then
                  self:CastWRB(target)
                end
              end
            end
            function Leblanc:comboEWQR()

              if not self.Config.combo.turnw.w4:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastEW(target)
                end
                if(GetDistance(target) <= 600 ) and self:EWused() then
                  self:CastQR(target)
                end
              end
              if  self.Config.combo.turnw.w4:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastEWB(target)
                end
                if(GetDistance(target) <= 600 ) and self:EWused() then
                  self:CastQR(target)
                end
              end
            end
            function Leblanc:comboWRQE()

              if not self.Config.combo.turnw.w5:Value() then
                if(GetDistance(target) <= 600 )  then
                  self:CastWR2(target)
                end
                if (GetDistance(target) <= 600 ) and self:R2used() then
                  self:CastQE(target)
                end
              end
              if self.Config.combo.turnw.w5:Value() then
                if(GetDistance(target) <= 600 ) then
                  self:CastWRB2(target)
                end
                if (GetDistance(target) <= 600 ) and self:R2used() then
                  self:CastQE(target)
                end
              end
            end
            function Leblanc:comboWQRE()

              if not self.Config.combo.turnw.w6:Value() then
                if(GetDistance(target) <= 600 )  then
                  self:CastWQ(target)
                end
                if (GetDistance(target) <= 600 ) and self:Qused()then
                  self:CastRE1(target)
                end
              end
              if self.Config.combo.turnw.w6:Value() then
                if(GetDistance(target) <= 600 ) then
                  self:CastWQB(target)
                end
                if (GetDistance(target) <= 600 ) and self:Qused()then
                  self:CastRE1(target)
                end
              end
            end
            function Leblanc:comboQRWE()

              if not self.Config.combo.turnw.w7:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastQR(target)
                end
                if(GetDistance(target) <= 600 ) and self:QRused() then
                  self:CastWE(target)
                end
              end
              if self.Config.combo.turnw.w7:Value() then
                if (GetDistance(target) <= 600 )then
                  self:CastQR(target)
                end
                if(GetDistance(target) <= 600 ) and self:QRused() then
                  self:CastWEB(target)
                end
              end
            end
            function Leblanc:comboDB() -- QWER

              if not self.Config.combo.turnw.w8:Value() then
                if(GetDistance(target) <= 600 )  then
                  self:CastQW(target)
                end
                if (GetDistance(target) <= 600 ) and self:QWused()then
                  self:CastER(target)
                end
              end
              if self.Config.combo.turnw.w8:Value() then
                if(GetDistance(target) <= 600 ) then
                  self:CastQWB(target)
                end
                if (GetDistance(target) <= 600 ) and self:QWused()then
                  self:CastER(target)
                end
              end
            end
            function Leblanc:randomcombo()
              if self.Config.combo.turnw.w9:Value() then

                if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                  self:CastQ(target)
                end

                if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.comboke:Value()    and IsReady(_E))then
                  self:CastE(target)
                end
                if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_W))then
                  self:CastW(target)
                end
                if(GetDistance(target) <= 600 and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                  self:CastR(target)
                end
              end
              if not self.Config.combo.turnw.w9:Value() then

                if(GetDistance(target) <= 700 and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                  self:CastQ(target)
                end


                if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_E))then
                  self:CastE(target)
                end

                if(GetDistance(target) <= 600 and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value() and not self:wUsed() and IsReady(_W))then
                  self:CastW(target)
                end
                if(GetDistance(target) <= 600 and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
                  self:CastR(target)
                end
              end
            end
            function Leblanc:onlye()
              if(GetDistance(target) <= 925 and self.Config.combo.useE:Value() and  self.Config.Keys.onlye:Value()   and IsReady(_E)) then
                self:CastE(Etarget)
              end
            end
            ---//==================================================\\---
            --|| > Leblanc Damage Checks                      ||--
            ---\\==================================================//---
            function Leblanc:GetQDmg(target)
              if GetCastLevel(myHero, _Q)< 1 then
                return 0
              end
              if IsReady(_Q) then
                local FinalDamage = (30 + (GetCastLevel(myHero, _Q)* 25) + (GetBonusAP(myHero)*.4))
                return CalcDamage(myHero,target, 0,FinalDamage)
              else
                return 0
              end
            end
            function Leblanc:GetQ2Dmg(target)
              if GetCastLevel(myHero, _Q) < 1 then
                return 0
              end
              if IsReady(_Q) then
                local FinalDamage = (30 + (GetCastLevel(myHero, _Q) * 25) + (GetBonusAP(myHero))* .4)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Leblanc:GetWDmg(target)
              if GetCastLevel(myHero, _W) < 1 then
                return 0
              end
              if IsReady(_W) then
                local FinalDamage = (45 + (GetCastLevel(myHero, _W) * 40) + (GetBonusAP(myHero))* .6)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Leblanc:GetEDmg(target)
              if GetCastLevel(myHero, _E) < 1 then
                return 0
              end
              if IsReady(_E) then
                local FinalDamage = 2*(15 + (GetCastLevel(myHero, _E) * 25) + (GetBonusAP(myHero))* .5)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Leblanc:GetE2Dmg(target)
              if GetCastLevel(myHero, _E) < 1 then
                return 0
              end
              if IsReady(_E) then
                local FinalDamage = (15 + (GetCastLevel(myHero, _E) * 25) + (GetBonusAP(myHero))* .5)
                return CalcDamage(myHero,target, 0, FinalDamage)
              else
                return 0
              end
            end
            function Leblanc:GetRDmg(target)
              if GetCastLevel(myHero, _R) < 1 then
                return 0
              end
              if IsReady(_R) and GetCastName(myHero,_R)  == "LeblancSoulShackleM" then
                local FinalDamage = ((GetCastLevel(myHero, _R) * 100) + (GetBonusAP(myHero)) * .6)
                return CalcDamage(myHero,target,0, FinalDamage)
              elseif IsReady(_R) and GetCastName(myHero,_R) == "LeblancSlideM" then
                local FinalDamage = ((GetCastLevel(myHero, _R) * 150) + (GetBonusAP(myHero)) * .9)
                return CalcDamage(myHero,target,0, FinalDamage)
              elseif IsReady(_R) and GetCastName(myHero,_R) == "LeblancChaosOrbM" then
                local FinalDamage = ((GetCastLevel(myHero, _R) * 100) + (GetBonusAP(myHero)) * .6)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Leblanc:GetMyDmg(target)
              if IsReady(_Q) and IsReady(_W) and IsReady(_R)and IsReady(_E) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
              elseif IsReady(_Q) and IsReady(_W) and IsReady(_R)then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target) + self:GetQ2Dmg(target)
              elseif IsReady(_Q) and IsReady(_W) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
              elseif IsReady(_Q) and IsReady(_R)and IsReady(_E) then
                return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
              elseif IsReady(_R)and IsReady(_W) and IsReady(_E) then
                return self:GetRDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
              elseif IsReady(_Q) and IsReady(_W) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetQ2Dmg(target)
              elseif IsReady(_E) and IsReady(_W) then
                return self:GetEDmg(target) + self:GetWDmg(target)
              elseif IsReady(_R)and IsReady(_W) then
                return self:GetRDmg(target) + self:GetWDmg(target)
              elseif IsReady(_Q) and IsReady(_R)then
                return self:GetQDmg(target) + self:GetRDmg(target)+ self:GetQ2Dmg(target)
              elseif IsReady(_E) and IsReady(_R)then
                return self:GetEDmg(target) + self:GetRDmg(target)
              elseif IsReady(_Q) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetEDmg(target) + self:GetQ2Dmg(target)
              elseif IsReady(_R)then
                return self:GetRDmg(target)
              elseif IsReady(_E) then
                return self:GetEDmg(target)
              elseif IsReady(_Q) then
                return self:GetQDmg(target)
              elseif IsReady(_W) then
                return self:GetWDmg(target)
              else
                return 0
              end
            end
            function Leblanc:GetDraws(target)
              local qdamage = self:GetQDmg(target)
              local q2damage =self:GetQ2Dmg(target)
              local wdamage = self:GetWDmg(target)
              local edamage = self:GetEDmg(target)
              local rdamage = self:GetRDmg(target)
              local Idmg=(50+ ((GetLevel(myHero))*20))

              if qdamage >GetCurrentHP(target) then
                return 'Q', GoS.White
              elseif qdamage+ Idmg>GetCurrentHP(target) then
                return 'Q + Ignite', GoS.White
              elseif wdamage >GetCurrentHP(target) then
                return 'W', GoS.White
              elseif wdamage+ Idmg>GetCurrentHP(target) then
                return 'W + Ignite', GoS.White
              elseif edamage >GetCurrentHP(target) then
                return 'E', GoS.White
              elseif edamage + Idmg>GetCurrentHP(target) then
                return 'E + Ignite', GoS.White
              elseif rdamage  >GetCurrentHP(target) then
                return 'R', GoS.White
              elseif rdamage + Idmg>GetCurrentHP(target) then
                return 'R + Ignite', GoS.White
              elseif rdamage +edamage  >GetCurrentHP(target) then
                return 'R + E',GoS.White
              elseif rdamage +edamage+ Idmg>GetCurrentHP(target) then
                return 'R + E + Ignite',GoS.White
              elseif edamage+wdamage >GetCurrentHP(target) then
                return 'E + W',GoS.White
              elseif edamage+wdamage+ Idmg>GetCurrentHP(target) then
                return 'E + W + Ignite',GoS.White
              elseif rdamage+wdamage >GetCurrentHP(target) then
                return 'R + W',GoS.White
              elseif rdamage+wdamage+ Idmg>GetCurrentHP(target) then
                return 'R + W + Ignite',GoS.White
              elseif qdamage+q2damage+wdamage >GetCurrentHP(target) then
                return 'Q + W',GoS.White
              elseif qdamage+q2damage+edamage>GetCurrentHP(target) then
                return 'Q + E',GoS.White
              elseif qdamage+q2damage+rdamage >GetCurrentHP(target) then
                return 'Q + R',GoS.White
              elseif qdamage+q2damage+wdamage+ Idmg>GetCurrentHP(target) then
                return 'Q + W + Ignite',GoS.White
              elseif qdamage+q2damage+edamage+ Idmg>GetCurrentHP(target) then
                return 'Q + E + Ignite',GoS.White
              elseif qdamage+q2damage+rdamage+ Idmg>GetCurrentHP(target) then
                return 'Q + R + Ignite',GoS.White
              elseif qdamage+q2damage+edamage+wdamage >GetCurrentHP(target) then
                return 'Q + W + E',GoS.White
              elseif qdamage+q2damage+rdamage+wdamage >GetCurrentHP(target) then
                return 'Q + W + R',GoS.White
              elseif qdamage+q2damage+edamage+rdamage >GetCurrentHP(target) then
                return 'Q + R + E',GoS.White
              elseif qdamage+q2damage+edamage+wdamage+ Idmg>GetCurrentHP(target) then
                return 'Q + W + E + Ignite',GoS.White
              elseif qdamage+q2damage+wdamage+edamage+rdamage >GetCurrentHP(target) then
                return 'Kill with full combo',GoS.White
              elseif qdamage+q2damage+wdamage+edamage+rdamage+Idmg>GetCurrentHP(target) then
                return 'Full Combo + Ignite',GoS.White
              else
                return "Cant Kill yet", GoS.White
              end
            end
            function Leblanc:killsteal()
              for _, unit in pairs(GetEnemyHeroes()) do
                local health = GetCurrentHP(unit)
                local dmgE = self:GetEDmg(unit)
                if(GetDistance(target) <= self.E.range and  IsReady(_E) and not self.Config.Keys.combokey:Value()   and health<dmgE and self.Config.killsteal.useE:Value()   and self.Config.killsteal.ks:Value())then
                  self:CastE(unit)
                end
                local dmgQ = self:GetQDmg(unit)
                if(GetDistance(target) <= self.Q.range and  IsReady(_Q) and not self.Config.Keys.combokey:Value()   and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
                  self:CastQ(unit)
                end
                local dmgQW = self:GetQDmg(unit)+self:GetWDmg(unit)
                if(GetDistance(target) <= self.W.range and  health<dmgQ and not self.Config.Keys.combokey:Value()   and self.Config.killsteal.useQW:Value() and self.Config.killsteal.ks:Value() )then
                  self:CastQWK(unit)
                end
                local dmgW = self:GetWDmg(unit)
                if(GetDistance(target) <= self.W.range and  IsReady(_W) and not self.Config.Keys.combokey:Value() and not self:wUsed()   and health<dmgQ and self.Config.killsteal.useW:Value() and self.Config.killsteal.ks:Value() )then
                  self:CastW(unit)
                end
                local dmgI =(50+ ((myHero.level)*20))
                if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<600)then
                  self:CastI(unit)
                end
                local dmgR =self:GetRDmg(unit)
                if(GetDistance(target) <= 600 and  IsReady(_R) and not self.Config.Keys.combokey:Value()   and health<dmgR and self.Config.killsteal.useR:Value() and self.Config.killsteal.ks:Value() )then
                  self:CastR(unit)
                end
              end
            end
            ---//==================================================\\---
            --|| > Leblanc Used Checks                          ||--
            ---\\==================================================//---
            function Leblanc:wUsed()
              if GetCastName(myHero,_W) == "LeblancSlideReturn" then
                return true
              else
                return false
              end
            end
            function Leblanc:rUsed()
              if GetCastName(myHero,_R) == "LeblancSlideM" then
                return false
              else
                return true
              end
            end
            function Leblanc:R2used()
              local leblancQ =  CanUseSpell(myHero, _R) == ONCOOLDOWN
              if (leblancQ ) then
                return true
              else
                return false
              end
            end
            function Leblanc:QEused()
              local leblancQ = IsReady(_Q)
              local leblancE = IsReady(_E)
              if (leblancQ and leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:WRused()
              local leblancQ = IsReady(_W)
              local leblancE = IsReady(_R)
              if (leblancQ and leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:WQused()
              local leblancQ = IsReady(_W)
              local leblancE = IsReady(_Q)
              if (leblancQ and leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:Qused()
              local leblancE = IsReady(_Q)
              if ( leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:EQused()
              local leblancW = IsReady(_E)
              local leblancE = IsReady(_Q)
              if (leblancW and leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:EWused()
              local leblancW = IsReady(_E)
              local leblancE = IsReady(_W)
              if (leblancW and leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:QRused()
              local leblancW = IsReady(_Q)
              local leblancE = IsReady(_R)
              if (leblancW and leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:QWused()
              local leblancW = IsReady(_Q)
              local leblancE = IsReady(_W)
              if (leblancW and leblancE) then
                return false
              else
                return true
              end
            end
            function Leblanc:WndMsg(Msg, Key)
              if self.Config.Keys.combomode:Value() then
                self.Config.combo.logic:Value((self.Config.combo.logic:Value() + 1))
                self.Config.Keys.combomode:Value(false)
                if self.Config.combo.logic:Value() > 9 then self.Config.combo.logic:Value(1) end
              end
              if self.Config.targetsel.ts:Value() then
                if Msg == WM_LBUTTONDOWN then
                  local minD = 10
                  local starget = nil
                  for i, enemy in ipairs(GetEnemyHeroes()) do
                    if ValidTarget(enemy) then
                      if GetDistance(enemy, mousePos) <= minD or starget == nil then
                        minD = GetDistance(enemy, mousePos)
                        starget = enemy
                      end
                    end
                  end
                  if starget and minD < 150 then
                    if self.selectedTar and starget.charName == self.selectedTar.charName then
                      self.selectedTar = nil
                      print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
                    else
                      self.selectedTar = starget
                      print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
                    end
                  end
                end
              end
              if Msg == WM_LBUTTONDOWN then
                if PopUp1 then
                  PopUp1 = false
                end
              end
            end
            class "Diana"
            local abuff = false
            ---//==================================================\\---
            --|| > Diana Starts                         ||--
            ---\\==================================================//---
            function Diana:__init()
              self.Q = { delay = 0.25, speed = 2000 ,width = 75, range = 830  } --aoe false, Col false, lınear
              self.W = {range = 200  }
              self.E = {range = 350  }
              self.R = {range = 825  }
              if ipred then
                qSpell = IPrediction.Prediction({range = 830, speed = 2000, delay = 0.25, width = 75, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
              end
              self.tsg = TargetSelector(1000,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
              Last_LevelSpell = 0
              self:LoadMenu()
              Callback.Add("Load", function() self:onload() end)
              Callback.Add("Tick", function() self:Tick() end)
              Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
              Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)
              Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
              Callback.Add("Draw", function() self:Draw() end)
              Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
              --Callback.Add("ProcessSpellComplete", function(x,y) self:ProcessSpellComplete(x,y) end)
            end
            function Diana:onload()
              self:findorb()
            end
            function Diana:LoadMenu()
              self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )

              self.Config:Menu( "combo",loc_eng[1])
              self.Config.combo:Boolean("useQ", loc_eng[2], true)
              self.Config.combo:Boolean("useW", loc_eng[3], true)
              self.Config.combo:Boolean("useE", loc_eng[4], true)
              self.Config.combo:Boolean("useR", loc_eng[5], true)
              self.Config.combo:Boolean("useI", loc_eng[6], true)
              self.Config.combo:Slider("Mana",loc_eng[8], 10, 10, 100, 1)
              --self.Config.combo:Boolean("logicgap", "Use QR to gapclose",1, {"Only if target Killable", "Always" , "Never" })
              self.Config.combo:DropDown("logic", loc_eng[7],1, {loc_eng[139], loc_eng[140] , loc_eng[141] })


              self.Config:Menu( "harass",loc_eng[9])
              self.Config.harass:Boolean("useQ", loc_eng[10], true)
              self.Config.harass:Boolean("useW", loc_eng[11], true)
              self.Config.harass:Boolean("useE", loc_eng[12], true)
              self.Config.harass:Slider("Mana",loc_eng[8], 10, 10, 100, 1)


              self.Config:Menu( "farm",loc_eng[14])

              self.Config.farm:Menu("laneclear",loc_eng[15])
              self.Config.farm.laneclear:Boolean("useQ",loc_eng[16],true)
              self.Config.farm.laneclear:Slider("qcount",loc_eng[180], 2, 1, 10, 1)
              self.Config.farm.laneclear:Boolean("useW",loc_eng[17],true)
              self.Config.farm.laneclear:Slider("wcount",loc_eng[181], 2, 1, 10, 1)
              self.Config.farm.laneclear:Info("blank","" )
              self.Config.farm.laneclear:Info("blank", "")
              self.Config.farm.laneclear:Info("info2", loc_eng[184])
              self.Config.farm.laneclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.laneclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)

              self.Config.farm:Menu("jungleclear",loc_eng[20])
              self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21],true)
              self.Config.farm.jungleclear:Boolean("useW",loc_eng[22],true)
              self.Config.farm.jungleclear:Boolean("useE",loc_eng[23],true)
              self.Config.farm.jungleclear:Boolean("useR",loc_eng[24],true)
              self.Config.farm.jungleclear:Info("blank","" )
              self.Config.farm.jungleclear:Info("blank","" )
              self.Config.farm.jungleclear:Info("info2", loc_eng[184])
              self.Config.farm.jungleclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.jungleclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)
              self.Config.farm.jungleclear:Slider("EMana",loc_eng[187], 30, 10, 100, 1)
              self.Config.farm.jungleclear:Slider("RMana",loc_eng[188], 30, 10, 100, 1)

              self.Config.farm:Menu("lasthit",loc_eng[25])
              self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189],false)
              self.Config.farm.lasthit:Boolean("useQ",loc_eng[26],true)
              self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191],1, {loc_eng[172],loc_eng[174]})
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("info2", loc_eng[184])
              self.Config.farm.lasthit:Slider("QMana",loc_eng[185], 30, 10, 100, 1)

              self.Config:Menu( "killsteal",loc_eng[35])
              self.Config.killsteal:Boolean("ks",loc_eng[36],true)
              self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
              self.Config.killsteal:Boolean("useR", loc_eng[40], true)
              self.Config.killsteal:Boolean("useI", loc_eng[41], true)

              --[[  self.Config:Menu("Escape Settings","escape")
              self.Config.escape:Boolean("useR","Use R Minion To Escape",true)
              self.Config.escape:Boolean("useQR","Use QR Minion To Escape",true)]]
              self.Config:Menu( "item",loc_eng[42])
              self.Config.item:Menu( "autopot",loc_eng[192])
              self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
              self.Config.item.autopot:Slider("autopothp", loc_eng[194],  10, 0, 100, 1)
              self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
              self.Config.item:Slider("autozhonya", loc_eng[44],  10, 0, 100, 1)
              self.Config.item:Boolean("usehg", loc_eng[45], false)
              self.Config.item:Boolean("usebg", loc_eng[46], false)

              self.Config:Menu("misc",loc_eng[92])
              self.Config.misc:Menu( "interrupt",loc_eng[93])
              self.Config.misc.interrupt:Boolean("r", loc_eng[96], true)
              self.Config.misc.interrupt:Info("info3", loc_eng[98])
      DelayAction(function()
  local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
  for i, spell in pairs(CHANELLING_SPELLS) do
    for _,k in pairs(GetEnemyHeroes()) do
        if spell["Name"] == GetObjectName(k) then
        self.Config.misc.interrupt:Boolean(GetObjectName(k).."Inter", "On "..GetObjectName(k).." "..(type(spell.Spellslot) == 'number' and str[spell.Spellslot]), true)
        end
    end
  end
end, 0.35)

              self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
              self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
              self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
              self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
              self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
              self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
              self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
              self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)

              self.Config.misc:Boolean("emax", "Use E if distance > 280", true)
              --self.Config.misc:Boolean("useW", "Auto W skill if enemy attacks.", true)
              Clock = os.clock()
              self.Config:Menu("other",loc_eng[66])
              --self.Config.other:Menu("Show Damage On Hp Bar", "HPBAR")
              --self.Config.other.HPBAR:Boolean("key","ON/OFF",true)
              self.Config.other:Menu( "draw",loc_eng[66])
              self.Config.other.draw:Boolean("qdraw",loc_eng[67],true)
              self.Config.other.draw:Boolean("wdraw",loc_eng[68],true)
              self.Config.other.draw:Boolean("edraw",loc_eng[69],true)
              self.Config.other.draw:Boolean("rdraw",loc_eng[70],true)
              self.Config.other.draw:Boolean("aadraw",loc_eng[71],false)
              self.Config.other:Menu( "color",loc_eng[198])
              self.Config.other.color:ColorPick("Qcolor", loc_eng[199],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Wcolor", loc_eng[200],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Ecolor", loc_eng[201],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Rcolor", loc_eng[202],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("AAcolor", loc_eng[204],{255, 255,0,0})
              -- self.Config.other.color:ColorPick("targetselect", loc_eng[205],{255, 255,0,0})
              self.Config.other:Menu( "width",loc_eng[206])
              self.Config.other.width:Slider("Qwidth", loc_eng[210],  1, 1, 10, 1)
              self.Config.other.width:Slider("Wwidth", loc_eng[211],  1, 1, 10, 1)
              self.Config.other.width:Slider("Ewidth", loc_eng[212],  1, 1, 10, 1)
              self.Config.other.width:Slider("Rwidth", loc_eng[213],  1, 1, 10, 1)
              self.Config.other.width:Slider("AAwidth", loc_eng[209], 1, 1, 10, 1)
              -- self.Config.other.width:Slider("STwidth", loc_eng[208], 1, 1, 10, 1)
              self.Config.other:Boolean("target",loc_eng[75],true)
              self.Config.other:Boolean("damage",loc_eng[214],true)
              self.Config.other:Boolean("targetcal",loc_eng[76],true)
              --          self.Config.other:Menu( "perma",loc_eng[73])
              -- self.Config.other.perma:Boolean("perma",loc_eng[74],true)

              self.Config:Menu("targetsel",loc_eng[77])
              self.Config.targetsel:Boolean("ts",loc_eng[78],false)

              self.Config:Menu("orb","Orbwalker Settings")
              self.Config.orb:Menu( "selectorb","Current Orbwalker :")


              self.Config:Menu("pred","Prediction Settings")
              self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
              self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
              self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
              self.Config.pred.hcgeneral.hcop:Slider("hcopq", "Q Hitchance " , 60, 0, 100, 1)
              self.Config.pred:Info("blank", "    Currently Open Prediction "   )
              self.Config.pred:Info("blank", "      is best with this bundle"   )


              self.Config:Menu( "Keys",loc_eng[79])
              self.Config.Keys:Info("infoK3", loc_eng[80])
              self.Config.Keys:Key("combokey", loc_eng[81],string.byte(" "))
              self.Config.Keys:Info("infoK4", loc_eng[82])
              self.Config.Keys:Key("harasskey", loc_eng[83],string.byte("C"))
              self.Config.Keys:Key("autoq", loc_eng[91], string.byte("T"))
              self.Config.Keys:Info("infoK5", loc_eng[84])
              self.Config.Keys:Key("laneclearkey", loc_eng[85],string.byte("V"))
              self.Config.Keys:Key("jungleclearkey", loc_eng[86],string.byte("V"))
              self.Config.Keys:Key("lasthitkey",loc_eng[215],string.byte("X"))
              self.Config.Keys:Info("infoK6", loc_eng[87])
              self.Config.Keys:Key("escapekey", loc_eng[88],string.byte("Y"))
              --self.Config.Keys:Boolean("lasthitkey", "Lasthit Key",string.byte("X"))
              self.Config.Keys:Info("infoK","" )
              self.Config.Keys:Info("infoK2", loc_eng[89])

              self.Config:Info("infoK","           "..Scriptname.."" )
              self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
              self.Config:Info("infoK","   Script was made by  "..Author.. "" )
              self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
              self.Config:Boolean("instruct", loc_eng[216], false)



            end
            function Diana:Draw()
              if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
                DrawCircle(myHero.x, myHero.y, myHero.z, 830,  self.Config.other.width.Qwidth:Value(),0,self.Config.other.color.Qcolor:Value())
              end

              if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
                DrawCircle(myHero.x, myHero.y, myHero.z, 200,  self.Config.other.width.Wwidth:Value(),0, self.Config.other.color.Wcolor:Value())
              end

              if self.Config.other.draw.edraw:Value() and IsReady(_E) then
                DrawCircle(myHero.x, myHero.y, myHero.z, 350,  self.Config.other.width.Ewidth:Value(),0, self.Config.other.color.Ecolor:Value())
              end

              if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
                DrawCircle(myHero.x, myHero.y, myHero.z, 825, self.Config.other.width.Rwidth:Value(),0, self.Config.other.color.Rcolor:Value())
              end
              if self.Config.other.draw.aadraw:Value() then
                DrawCircle(myHero.x, myHero.y, myHero.z, 125, self.Config.other.width.AAwidth:Value(),0, self.Config.other.color.AAcolor:Value())
              end
              --[[ if self.Config.other.draw.rtdraw and IsReady(_R)  then
                if self.tsr.target~=nil then
                  DrawLine3D(myHero.x, myHero.y, myHero.z,self.tsr.target.x, self.tsr.target.y, self.tsr.target.z,self.Config.other.width.E2width,self.Config.other.color.E2color:Value())))
                end
                end]]
                local rs = GetResolution()
                if PopUp1 then
                  local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
                  DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
                  DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
                  DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
                  DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
                  DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
                  DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
                  DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
                  DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
                  DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
                  DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
                  DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
                  DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
                  -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
                  -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
                  -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
                  -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
                  local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
                  --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
                  --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
                  FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
                  DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
                end
                --[[ if self.Config.other.target and self.selectedTar ~= nil then
                  DrawCircle(self.selectedTar.x, self.selectedTar.y, self.selectedTar.z, 80,6, ARGB(255, 255,0,0))
                  end]]
                  for _, target in pairs(GetEnemyHeroes()) do
                    if ValidTarget(target, 15000) then
                      if target.visible and not target.dead and self.Config.other.damage:Value() then
                        currLine = 1
                        -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
                        DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
                        currLine = currLine + 1
                        DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
                      end
                    end
                  end
                  if self.Config.other.targetcal:Value() and not myHero.dead then
                    if target and target ~= nil then
                      --  local target= GetOrigin(target)
                      local drawpos=WorldToScreen(1,target.x, target.y, target.z)
                      local comboText,color = self:GetDraws(target)
                      if comboText then
                        DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
                      end
                    end
                  end
                end
                function Diana:Checks()
                  Gtarget = self.tsg:GetTarget()
                  if not ValidTarget(Gtarget, 925) or not self.Config.targetsel.ts:Value()  then
                    target = GetCurrentTarget()
                  elseif  ValidTarget(Gtarget, 925) and not self.selectedTar then
                    target = GetCurrentTarget()
                  elseif (ValidTarget(Gtarget, 925) and self.selectedTar) then
                    target = self.selectedTar
                  end
                  mousePos = GetMousePos()
                end
                function Diana:Tick()
                  self:Checks()
                  self:autoq()
                  self:Antiafk()
                  self:autolevel()
                  self:skinhack()
                  self:autopot()
                  self:items()
                  if(self.Config.Keys.jungleclearkey:Value() )then
                    self:JungleClear()
                  end
                  if(self.Config.Keys.combokey:Value() and self.Config.combo.logic:Value() == 1 )then
                    self:combo1()
                  end
                  if(self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
                    self:LastHit()
                  end
                  if self.Config.instruct then
                    self.Config.instruct = false
                    PopUp1 = true
                  end
                  if(self.Config.Keys.combokey:Value() and self.Config.combo.logic:Value() == 2 )then
                    self:combo2()
                  end
                  if(self.Config.Keys.combokey:Value() and self.Config.combo.logic:Value() == 3 )then
                    self:combo3()
                  end
                  if(self.Config.Keys.laneclearkey:Value() )then
                    self:LaneClear()
                  end
                  if(self.Config.killsteal.ks:Value() ) then
                    self:killsteal()
                  end
                  if(self.Config.Keys.harasskey:Value()  ) then
                    self:harass()
                  end
                  if(self.Config.Keys.escapekey:Value() )then
                    self:escape()
                  end
                  self:checkothers()
                end
                function Diana:CastQ(unit)
                  if self.Config.pred.selectpred:Value() == 1 then
                    local QPred = GetPrediction(unit, self.Q)
                    if IsReady(_Q) then
                      if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100) then
                        CastSkillShot(_Q, QPred.castPos)
                      end
                    end
                  elseif self.Config.pred.selectpred:Value() == 2 then
                    if ipred then
                      local HitChance, y = qSpell:Predict(unit)
                      if IsReady(_Q) and HitChance >= 3 then
                        CastSkillShot(_Q, y.x, y.y, y.z)
                      end
                    end
                  elseif self.Config.pred.selectpred:Value() == 3 then
                    local qPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 2000, 250, 830, 75, false, true)
                    if IsReady(_Q) and qPred.HitChance == 1 then
                      CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
                    end
                  end
                end
                function Diana:CastW(unit)
                  if IsReady(_W) then
                    CastTargetSpell(unit, _W)
                  end
                end

                function Diana:CastE(unit)
                  if IsReady(_E) then
                    CastTargetSpell(unit, _E)
                  end
                end

                function Diana:CastR(unit)
                  if IsReady(_R) then
                    CastTargetSpell(unit, _R)
                  end
                end
                function Diana:CastI(unit)
                  if Ignite then
                    if IsReady(Ignite) then
                      CastTargetSpell(unit, Ignite)
                    end
                  end
                end
                function Diana:killsteal()
                  for _, unit in pairs(GetEnemyHeroes()) do
                    local health = unit.health
                    local dmgQ = self:GetQDmg(unit)
                    if(GetDistance(target) <= self.Q.range and  IsReady(_Q) and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
                      self:CastQ(unit)
                    end
                    local dmgI =(50+ ((myHero.level)*20))
                    if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<600)then
                      self:CastI(unit)
                    end
                    local dmgR =self:GetRDmg(unit)
                    if(GetDistance(target) <= self.R.range and  IsReady(_R) and health<dmgR and self.Config.killsteal.useR:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<550)then
                      self:CastR(unit)
                    end
                  end
                end
                function Diana:ProcessSpell(unit, spell)
                  if GetObjectType(unit) == Obj_AI_Hero and GetTeam(unit) ~= GetTeam(myHero) and IsReady(_E) then
      if CHANELLING_SPELLS[spell.name] then
        if ValidTarget(unit, 1000) and GetObjectName(unit) == CHANELLING_SPELLS[spell.name].Name and  self.Config.misc.interrupt[GetObjectName(unit).."Inter"]:Value() and self.Config.misc.interrupt.r:Value() then 
         self:CastE(unit)
        end
      end
    end
                end
                function Diana:UpdateBuff(unit,buff)
                  if unit and unit.team ~= myHero.team and unit.type == myHero.type then
                    if buff.Name == "dianamoonlight" then

                      abuff = true
                    end
                  end
                end
                function Diana:RemoveBuff(unit, buff)
                  if unit and unit.team ~= myHero.team and unit.type == myHero.type then
                    if buff.Name == "dianamoonlight" then

                      abuff = false
                    end
                  end
                end
                function Diana:walk()
                  MoveToXYZ(mousePos)
                end
                function Diana:escape()
                  if self.Config.Keys.escapekey  then
                    self:walk()
                  end
                end
                function Diana:harass()
                  if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_Q))then
                    self:CastQ(target)
                  end
                  if(GetDistance(target) <= self.W.range  and self.Config.harass.useW:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_W))then
                    self:CastW(target)
                  end
                  if(GetDistance(target) <= self.E.range  and self.Config.harass.useE:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_E))then
                    self:CastE(target)
                  end
                end
                function Diana:autoq()
                  if(GetDistance(target) <= self.Q.range and self.Config.Keys.autoq:Value() and  IsReady(_Q))then
                    self:CastQ(target)
                  end
                end
                function Diana:GetQDmg(target)
                  if GetCastLevel(myHero, _Q) < 1 then
                    return 0
                  end
                  if IsReady(_Q) then
                    local FinalDamage = (25 + (GetCastLevel(myHero, _Q) * 35) + (GetBonusAP(myHero))*.7)
                    return CalcDamage(myHero,target,0, FinalDamage)
                  else
                    return 0
                  end
                end
                function Diana:GetWDmg(target)
                  if GetCastLevel(myHero, _W) < 1 then
                    return 0
                  end
                  if IsReady(_W) then
                    local FinalDamage = 3*(10 + (GetCastLevel(myHero, _W) * 12) + (GetBonusAP(myHero))* .2)
                    return CalcDamage(myHero,target,0, FinalDamage)
                  else
                    return 0
                  end
                end
                function Diana:GetRDmg(target)
                  if GetCastLevel(myHero, _R) < 1 then
                    return 0
                  end
                  if IsReady(_R) then
                    local FinalDamage = (40 + (GetCastLevel(myHero, _R) * 60) + (GetBonusAP(myHero))* .6)
                    return CalcDamage(myHero,target,0, FinalDamage)
                  else
                    return 0
                  end
                end
                function Diana:GetMyDmg(target)
                  if IsReady(_Q) and IsReady(_R) and IsReady(_W) then
                    return self:GetQDmg(target) + self:GetRDmg(target) + self:GetWDmg(target)
                  elseif IsReady(_Q)  and IsReady(_R) then
                    return self:GetQDmg(target) + self:GetRDmg(target)
                  elseif IsReady(_Q)  and IsReady(_W) then
                    return self:GetQDmg(target) + self:GetWDmg(target)
                  elseif IsReady(_R) and IsReady(_W) then
                    return self:GetRDmg(target) +self:GetWDmg(target)
                  elseif IsReady(_Q) then
                    return self:GetQDmg(target)
                  elseif IsReady(_W) then
                    return self:GetWDmg(target)
                  elseif IsReady(_R) then
                    return self:GetRDmg(target)
                  elseif IsReady(_Q) and IsReady(_R) then
                    return self:GetQDmg(target) + self:GetRDmg(target)
                  else
                    return 0
                  end
                end
                function Diana:GetDraws(target)
                  local qdamage = self:GetQDmg(target)
                  local wdamage = self:GetWDmg(target)
                  local rdamage = self:GetRDmg(target)
                  local Idmg=(50+ ((myHero.level)*20))

                  if qdamage >target.health then
                    return 'Q', GoS.White
                  elseif qdamage+ Idmg>target.health then
                    return 'Q + Ignite', GoS.White
                  elseif wdamage >target.health then
                    return 'W', GoS.White
                  elseif wdamage + Idmg>target.health then
                    return 'W + Ignite', GoS.White
                  elseif rdamage  >target.health then
                    return 'R', GoS.White
                  elseif rdamage + Idmg>target.health then
                    return 'R + Ignite', GoS.White
                  elseif rdamage +wdamage  >target.health then
                    return 'R + W',GoS.White
                  elseif rdamage +wdamage+ Idmg>target.health then
                    return 'R + W + Ignite',GoS.White
                  elseif qdamage+wdamage>target.health then
                    return 'Q + W',GoS.White
                  elseif qdamage+rdamage >target.health then
                    return 'Q + R',GoS.White
                  elseif qdamage+wdamage+ Idmg>target.health then
                    return 'Q + W + Ignite',GoS.White
                  elseif qdamage+rdamage+ Idmg>target.health then
                    return 'Q + R + Ignite',GoS.White
                  elseif qdamage+wdamage+rdamage >target.health then
                    return 'Kill with full combo',GoS.White
                  elseif qdamage+wdamage+rdamage+ Idmg>target.health then
                    return 'Full Combo + Ignite',GoS.White
                  else
                    return "Cant Kill yet", GoS.White
                  end
                end
                ---//==================================================\\---
                --|| > Diana Extras                  ||--
                ---\\==================================================//---
                function Diana:Antiafk()
                  if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
                  Clock = os.clock() + math.random(60,120)
                  MoveToXYZ(myHeroPos())
                end
                function Diana:skinhack()
                  if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
                    lastTimeTickCalled = CurrentTimeInMillis()
                    if  self.Config.misc.skinhack.useskin:Value() then
                      if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                        lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
                        HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
                      end
                    end
                  end
                end
                local spellLevel = 0
                function Diana:autolevel()
                  if GetLevelPoints(myHero) >= 1 then
                    if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                      LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                      Last_LevelSpell = os.clock()
                    end
                    if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
                      LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                      Last_LevelSpell = os.clock()
                    end
                    if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
                      LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
                      LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
                      LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                      Last_LevelSpell = os.clock()
                    end
                    if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
                      LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                      Last_LevelSpell = os.clock()
                    end
                    if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
                      local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                      LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                      Last_LevelSpell = os.clock()
                    end
                  end
                end
                lastPotion = 0

                function Diana:autopot()
                  if os.clock() - lastPotion < 15 then return end
                  for SLOT = ITEM_1, ITEM_6 do
                    if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
                      if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
                        CastSpell(SLOT)
                        lastPotion = os.clock()
                      end
                    end
                  end
                end
                function Diana:items()
                  if self.Config.item.usebg:Value() and self.Config.Keys.combokey:Value() then
                    for _ = ITEM_1, ITEM_7 do
                      if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
                    end
                  end
                end
                if self.Config.item.usehg:Value() and self.Config.Keys.combokey:Value() then
                  for _ = ITEM_1, ITEM_7 do
                    if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastTargetSpell(target, _)
                  end
                end
              end
              if self.Config.item.enableautozhonya:Value() then
                for _ = ITEM_1, ITEM_7 do
                  if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya:Value() / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
                end
              end
            end
          end
          function Diana:CastRQ(unit)
            if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value()  and  self.Config.Keys.combokey:Value()    and IsReady(_Q))then
              self:CastQ(target)
            end
            if(GetDistance(target) <= self.R.range and self.Config.combo.useR:Value()  and  self.Config.Keys.combokey:Value()    and IsReady(_R)) then
              DelayAction(function()self:CastR(target) end, 0.5)
            end
          end
          function Diana:CastQR(unit)

            if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value()  and  self.Config.Keys.combokey:Value()     and IsReady(_Q))then
              self:CastQ(minion)
            end
            if(GetDistance(target) <= self.R.range and self.Config.combo.useR:Value()  and abuff and  self.Config.Keys.combokey:Value()    and IsReady(_R)) then
              self:CastR(minion)
            end
          end
          function Diana:combo1()
            self:CastRQ(target)
            if(GetDistance(target) <= self.W.range  and self.Config.combo.useW:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_W) and not IsReady(_Q))then
              self:CastW(target)
            end
            if self.Config.misc.emax:Value()  then
              if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value()  and GetDistance(target)>280 and self.Config.Keys.combokey:Value()   and IsReady(_E))then
                self:CastE(target)
              end
            elseif not self.Config.misc.emax:Value()  then
              if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_E))then
                self:CastE(target)
              end
            end
            if(self.Config.combo.useI:Value()  and self.Config.Keys.combokey:Value()  )then
              for _, unit in pairs(GetEnemyHeroes()) do
                local dmgI =(50+ ((myHero.level)*20))
                local health=unit.health
                if(health<dmgI and self.Config.combo.useI:Value()  and GetDistance(unit)<600)then
                  self:CastI(unit)
                end
              end
            end
          end
          function Diana:combo2()
            if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_Q))then
              self:CastQ(target)
            end
            if(GetDistance(target) <= self.R.range and self.Config.combo.useR:Value()  and abuff and  self.Config.Keys.combokey:Value()   and not IsReady(_Q) and IsReady(_R))then
              self:CastR(target)
            end
            if(GetDistance(target) <= self.W.range  and self.Config.combo.useW:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_W))then
              self:CastW(target)
            end
            if self.Config.misc.emax:Value()  then
              if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value()  and GetDistance(target)>280 and self.Config.Keys.combokey:Value()   and IsReady(_E)  )then
                self:CastE(target)
              end
            elseif not self.Config.misc.emax:Value()  then
              if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_E))then
                self:CastE(target)
              end
            end
            if(self.Config.combo.useI:Value()  and self.Config.Keys.combokey:Value() )then
              for _, unit in pairs(GetEnemyHeroes()) do
                local dmgI =(50+ ((myHero.level)*20))
                local health=unit.health
                if(health<dmgI and self.Config.combo.useI:Value()  and GetDistance(unit)<600)then
                  self:CastI(unit)
                end
              end
            end
          end
          function Diana:combo3()
            if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_Q))then
              self:CastQ(target)
            end
            if(GetDistance(target) <= self.W.range  and self.Config.combo.useW:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_W))then
              self:CastW(target)
            end
            if(GetDistance(target) <= self.R.range and self.Config.combo.useR:Value()  and  self.Config.Keys.combokey:Value()   and not IsReady(_Q) and IsReady(_R))then
              self:CastR(target)
            end
            if self.Config.misc.emax:Value()  then
              if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value()  and GetDistance(target)>280 and self.Config.Keys.combokey:Value()   and IsReady(_E) )then
                self:CastE(target)
              end
            elseif not self.Config.misc.emax:Value()  then
              if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value()  and  self.Config.Keys.combokey:Value()   and IsReady(_E))then
                self:CastE(target)
              end
            end
            if(self.Config.combo.useI:Value()  and self.Config.Keys.combokey:Value() )then
              for _, unit in pairs(GetEnemyHeroes()) do
                local dmgI =(50+ ((myHero.level)*20))
                local health=unit.health
                if(health<dmgI and self.Config.combo.useI:Value()  and GetDistance(unit)<600)then
                  self:CastI(unit)
                end
              end
            end
          end
          function Diana:JungleClear()
            for i, minion in pairs(minionManager.objects) do
              if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_ENEMY then
                if self.Config.farm.jungleclear.useW:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.WMana:Value() /100 ) and GetDistance(minion) <= 200 then
                  self:CastW(minion)
                end
              end
            end
            local NumberOfHits = self.Config.farm.laneclear.qcount:Value()
            if NumberOfHits >= 1 and #minionManager.objects >= NumberOfHits then
              if self.Config.farm.jungleclear.useQ:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.QMana:Value() /100 )  then
                local BestPos, BestHit =  GetLineFarmPosition(self.Q.range, self.Q.width, MINION_ENEMY)
                if BestPos  and  BestHit >= NumberOfHits then
                  CastSkillShot(_Q, BestPos)
                end
              end
            end
          end
          function Diana:LastHit()
            for _, target in pairs(minionManager.objects) do
              if IsObjectAlive(target) and GetTeam(target) == MINION_ENEMY then
                if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
                  local Qdamage = self:GetQDmg(target)
                  if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.QMana:Value() /100 ) and ValidTarget(target,700)   and Qdamage >= GetCurrentHP(target)) then
                    self:CastQ(target)
                  end
                end
              end
            end
          end
          function Diana:LaneClear()
            for i, minion in pairs(minionManager.objects) do
              if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_ENEMY then
                if  self.Config.farm.laneclear.useW:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.WMana:Value() /100 ) and GetDistance(minion) <= 200 then
                  self:CastW(minion)
                end
              end
            end
            local NumberOfHits = self.Config.farm.laneclear.qcount:Value()
            if NumberOfHits >= 1 and #minionManager.objects >= NumberOfHits then
              if self.Config.farm.laneclear.useQ:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.QMana:Value() /100 )  then
                local BestPos, BestHit =  GetLineFarmPosition(self.Q.range, self.Q.width, MINION_ENEMY)
                if BestPos and  BestHit >= NumberOfHits then
                  CastSkillShot(_Q, BestPos)
                end
              end
            end
          end
          function Diana:WndMsg(Msg, Key)
            if self.Config.targetsel.ts:Value() then
              if Msg == WM_LBUTTONDOWN then
                local minD = 10
                local starget = nil
                for i, enemy in ipairs(GetEnemyHeroes()) do
                  if ValidTarget(enemy) then
                    if GetDistance(enemy, mousePos) <= minD or starget == nil then
                      minD = GetDistance(enemy, mousePos)
                      starget = enemy
                    end
                  end
                end
                if starget and minD < 150 then
                  if self.selectedTar and starget.charName == self.selectedTar.charName then
                    self.selectedTar = nil
                    print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
                  else
                    self.selectedTar = starget
                    print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
                  end
                end
              end
            end
            if Msg == WM_LBUTTONDOWN then
              if PopUp1 then
                PopUp1 = false
              end
            end
          end
          class "Lissandra"

          function Lissandra:__init()
            self.Q = { delay = 0.25, speed = math.huge ,width = 20, range = 725 } --aoe false, Col false, lınear
            self.W = { range = 450 }
            self.E = { delay = 0.25, speed = math.huge ,width = 110, range = 1050 } --aoe false, Col false, lınear
            self.R = { range = 550 }
            if ipred then
              eSpell = IPrediction.Prediction({range = 1050, speed =  math.huge, delay = 0.25, width = 110, type = "linear", name =myHero:GetSpellData(_E).name, collision = false})
              qSpell = IPrediction.Prediction({range = 725, speed = math.huge, delay = 0.25, width = 20, type = "linear", name =myHero:GetSpellData(_Q).name, collision = true})
            end
            self:LoadMenu()
            AddGapcloseEvent(_W, 450, false,  self.Config.misc.gapClose1.gapClose1w)
            -- AddGapcloseEvent(_R, 550, true,  self.Config.misc.gapClose1.gapClose1r)
            self.tsg = TargetSelector(1200,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
            Last_LevelSpell = 0
            spells = {}
            spells.q = { rangeMax = 925}
            global_ticks = 0
            Callback.Add("Load", function() self:onload() end)
            Callback.Add("Tick", function() self:Tick() end)
            Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
            Callback.Add("Draw", function() self:Draw() end)
            Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
            --Callback.Add("ProcessSpellComplete", function(x,y) self:ProcessSpellComplete(x,y) end)
          end
          function  Lissandra:Checks()
            Gtarget = self.tsg:GetTarget()
            if not ValidTarget(Gtarget, 1200) or not self.Config.targetsel.ts:Value()  then
              target = GetCurrentTarget()
            elseif  ValidTarget(Gtarget, 1200) and not self.selectedTar then
              target = GetCurrentTarget()
            elseif (ValidTarget(Gtarget, 1200) and self.selectedTar) then
              target = self.selectedTar
            end
            mousePos = GetMousePos()
          end
          function Lissandra:Tick()
            self:Checks()
            self:Antiafk()
            self:autolevel()
            self:skinhack()
            self:autopot()
            self:items()
            self:autoR()
            self:autoq()
            if(self.Config.Keys.combokey:Value() )then
              self:combo()
            end
            if(self.Config.Keys.jungleclearkey:Value() )then
              self:JungleClear()
            end
            if(self.Config.Keys.laneclearkey:Value() )then
              self:LaneClear()
            end
            if(self.Config.Keys.combokeyr:Value() )then
              self:engagewithr()
            end
            if(self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
              self:LastHit()
            end
            if(self.Config.Keys.escapekey:Value())then
              self:escape()
            end
            if(self.Config.killsteal.ks:Value() ) then
              self:killsteal()
            end
            if(self.Config.Keys.harasskey:Value() or self.Config.Keys.harasstoglekey:Value()  ) then
              self:harass()
            end
            if self.Config.instruct:Value() then
              self.Config.instruct:Value(false)
              PopUp1 = true
            end
            self:checkothers()
          end
          function Lissandra:Draw()
            if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
              DrawCircle(myHero.x, myHero.y, myHero.z, 725,  self.Config.other.width.Qwidth:Value(),0,self.Config.other.color.Qcolor:Value())
            end

            if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
              DrawCircle(myHero.x, myHero.y, myHero.z, 450,  self.Config.other.width.Wwidth:Value(),0, self.Config.other.color.Wcolor:Value())
            end

            if self.Config.other.draw.edraw:Value() and IsReady(_E) then
              DrawCircle(myHero.x, myHero.y, myHero.z, 1050,  self.Config.other.width.Ewidth:Value(),0, self.Config.other.color.Ecolor:Value())
            end

            if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
              DrawCircle(myHero.x, myHero.y, myHero.z, 550, self.Config.other.width.Rwidth:Value(),0, self.Config.other.color.Rcolor:Value())
            end
            if self.Config.other.draw.aadraw:Value() then
              DrawCircle(myHero.x, myHero.y, myHero.z, 550, self.Config.other.width.AAwidth:Value(),0, self.Config.other.color.AAcolor:Value())
            end
            --[[ if self.Config.other.draw.rtdraw and IsReady(_R)  then
              if self.tsr.target~=nil then
                DrawLine3D(myHero.x, myHero.y, myHero.z,self.tsr.target.x, self.tsr.target.y, self.tsr.target.z,self.Config.other.width.E2width,self.Config.other.color.E2color:Value())))
              end
              end]]
              local rs = GetResolution()
              if PopUp1 then
                local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
                DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
                DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
                DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
                DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
                DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
                DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
                DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
                DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
                DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
                DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
                DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
                DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
                -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
                -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
                -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
                -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
                local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
                --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
                --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
                FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
                DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
              end
              for _, target in pairs(GetEnemyHeroes()) do
                if ValidTarget(target, 15000) then
                  if target.visible and not target.dead and self.Config.other.damage:Value() then
                    currLine = 1
                    -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
                    DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
                    currLine = currLine + 1
                    DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
                  end
                end
              end

              if self.Config.other.targetcal:Value() and not myHero.dead then
                if target and target ~= nil then
                  --  local target= GetOrigin(target)
                  local drawpos=WorldToScreen(1,target.x, target.y, target.z)
                  local comboText,color = self:GetDraws(target)
                  if comboText then
                    DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
                  end
                end
              end
            end
            --[[ function Lissandra:CastQ2(unit) -- sonra bakıcam unutma
            if ValidTarget(unit) and IsReady(_Q) then
              if GetDistance(unit) < self.Q.range then
                self:CastQ(unit)
              elseif GetDistance(unit) < spells.q.rangeMax then
                local collision = false
                local x, z = 0, 0
                for i, minion in pairs(minionManager.objects) do
                  if minion ~= nil and not minion.dead and GetDistance(minion) <= self.Q.range then
                    x, z = pointOnLine(myHero, unit, minion, 0)

                    if math.sqrt((minion.x - x) ^ 2 + (minion.z - z) ^ 2) < self.Q.width / 2 then
                      collision = true
                    end
                  end
                end

                if collision == true and GetDistance(unit) < spells.q.rangeMax then
                  Position = pred:GetPredictedPos(unit, self.QSpell.Delay + (GetDistance(unit) / self.QSpell.Speed))

                  local castX = myHero.x + self.Q.range * ((Position.x - myHero.x) / GetDistance(Position))
                  local castY = myHero.y + self.Q.range * ((Position.y - myHero.y) / GetDistance(Position))
                  local castZ = myHero.z + self.Q.range* ((Position.z - myHero.z) / GetDistance(Position))
                  CastSkillShot(_Q, castX,castY, castZ)
                end
              end
            end
            end]]
            function Lissandra:CastQ(unit)
              if self.Config.pred.selectpred:Value() == 1 then
                local QPred = GetPrediction(unit, self.Q)
                if IsReady(_Q) then
                  if QPred  and QPred.hitChance >= 0.25 then
                    CastSkillShot(_Q, QPred.castPos)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 2 then
                if ipred then
                  local HitChance, y = qSpell:Predict(unit)
                  if IsReady(_Q) and HitChance >= 3 then
                    CastSkillShot(_Q, y.x, y.y, y.z)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 3 then
                local qPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), math.huge, 250, 725, 20, false, true)
                if IsReady(_Q) and qPred.HitChance == 1 then
                  CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
                end
              end
            end
            function Lissandra:CastW(unit)
              if IsReady(_W) and ValidTarget(unit,450) then
                CastSpell(_W)
              end
            end

            function Lissandra:CastE(unit)
              if self.Config.pred.selectpred:Value() == 1 then
                local EPred = GetPrediction(unit, self.E)
                if IsReady(_E) then
                  if EPred  and EPred.hitChance >= 0.25 then
                    CastSkillShot(_E, EPred.castPos)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 2 then
                if ipred then
                  local HitChance, y = eSpell:Predict(unit)
                  if IsReady(_Q) and HitChance >= 3 then
                    CastSkillShot(_E, y.x, y.y, y.z)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 3 then
                local ePred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), math.huge, 250, 725, 20, false, true)
                if IsReady(_Q) and ePred.HitChance == 1 then
                  CastSkillShot(_E, ePred.PredPos.x, ePred.PredPos.y, ePred.PredPos.z)
                end
              end
            end

            function Lissandra:CastR(unit)
              if IsReady(_R) then
                CastTargetSpell(unit, _R)
              end
            end
            function Lissandra:CastRS(unit)
              if IsReady(_R) then
                CastSpell(_R)
              end
            end

            function Lissandra:CastI(unit)
              local Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
              if Ignite then
                if IsReady(Ignite) then
                  CastTargetSpell(unit, Ignite)
                end
              end
            end
            function Lissandra:autoR()
              if ( self.Config.skilllogic.Rlogic.enableautoR:Value() and (self.Config.skilllogic.Rlogic.Rlogic:Value() == 2 or self.Config.skilllogic.Rlogic.Rlogic:Value() == 1)) then
                if myHero.health <= (myHero.maxHealth * self.Config.skilllogic.Rlogic.autoR:Value() / 100) then
                  self:CastRS(myHero)
                end
              end
            end

            function Lissandra:engagewithr()
              if self.Config.Keys.combokeyr:Value() then
                self:walk()
              end
              if(IsReady(_Q) and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 )and GetDistance(target) <= self.Q.range  and self.Config.combo.use:Value() and self.Config.Keys.combokeyr:Value()  )then
                self:CastQ(target)
              end

              if(IsReady(_E) and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 )and GetDistance(target) <= self.E.range and self.Config.combo.useE:Value() and self.Config.Keys.combokeyr:Value() )then
                local Ticker = GetTickCount()
                if (global_ticks + 2000) < Ticker then
                  if (IsReady(_E)) then
                    CastSkillShot(_E, target.x,target.y, target.z)
                    global_ticks = Ticker
                    DelayAction(function() CastSpell(_E) end, 1.5)
                  end
                end
              end

              if(IsReady(_W) and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 ) and GetDistance(target) <= self.W.range and self.Config.combo.useW:Value() and  self.Config.Keys.combokeyr:Value()  )then
                self:CastW(target)
              end

              if(IsReady(_R) and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 ) and GetDistance(target) <= self.R.range and self.Config.combo.useR:Value() and  self.Config.Keys.combokeyr:Value() )then
                self:CastR(target)
              end
            end
            function Lissandra:combo()

              if(IsReady(_Q) and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 )and GetDistance(target) <= self.Q.range  and self.Config.combo.useQ:Value() and self.Config.Keys.combokey:Value()  )then
                self:CastQ(target)
              end

              if(self.Config.skilllogic.Elogic.combo:Value() == 1 and  (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 )and self.Config.combo.useE:Value() and self.Config.Keys.combokey:Value()  )then
                local Ticker = GetTickCount()
                if (global_ticks + 2000) < Ticker then
                  if (IsReady(_E) and GetDistance(target) <= self.E.range) then
                    CastSkillShot(_E, target.x,target.y, target.z)
                    global_ticks = Ticker
                    DelayAction(function() CastSpell(_E) end, 1.5)
                  end
                end
              end
              if(self.Config.skilllogic.Elogic.combo:Value() == 2 and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 ) and self.Config.combo.useE:Value() and self.Config.Keys.combokey:Value()  )then
                local Ticker = GetTickCount()
                if (global_ticks + 2000) < Ticker then
                  if (IsReady(_E) and GetDistance(target) <= self.E.range) then
                    CastSkillShot(_E, target.x,target.y, target.z)
                    global_ticks = Ticker
                    DelayAction(function() CastSpell(_E) end, 2)
                  end
                end
              end

              if(IsReady(_W) and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 ) and GetDistance(target) <= self.W.range and self.Config.combo.useW:Value() and  self.Config.Keys.combokey:Value()   )then
                self:CastW(target)
              end
              if(self.Config.skilllogic.Rlogic.Rlogic:Value() == 3 or self.Config.skilllogic.Rlogic.Rlogic:Value() == 1 and IsReady(_R) and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 ) and self.Config.combo.useR:Value() and self.Config.Keys.combokey:Value()  )then
                for _, unit in pairs(GetEnemyHeroes()) do
                  local dmgR =self:GetRDmg(target)
                  local health=unit.health
                  if(health<dmgR and self.Config.combo.useR:Value() and GetDistance(unit)<550)then
                    self:CastR(target)
                  elseif (self.Config.skilllogic.Rlogic.Rlogic:Value() == 2 and  myHero.health <= (myHero.maxHealth * self.Config.skilllogic.Rlogic.autoR:Value() / 100)) then
                    self:CastRS(myHero)
                  end
                end
              end

              if(self.Config.combo.useI:Value()  and self.Config.Keys.combokey:Value()   )then
                for _, unit in pairs(GetEnemyHeroes()) do
                  local dmgI =(50+ ((myHero.level)*20))
                  local health=unit.health
                  if(health<dmgI and self.Config.combo.useI:Value()  and GetDistance(unit)<600)then
                    self:CastI(unit)
                  end
                end
              end
            end
            function Lissandra:autow()
              if self.Config.misc.autow.use:Value()  then
                if self.Config.misc.autow.enemycount:Value()  == 1 then
                  if EnemiesAround(myHeroPos() , 435) >= 2 then
                    self:CastW()
                  end
                elseif self.Config.misc.autow.enemycount:Value()  == 2 then
                  if EnemiesAround(myHeroPos() , 435) >= 3 then
                    self:CastW()
                  end
                elseif self.Config.misc.autow.enemycoun:Value()  == 3 then
                  if EnemiesAround(myHeroPos() , 435) >= 4 then
                    self:CastW()
                  end
                elseif self.Config.misc.autow.enemycount:Value()  == 4 then
                  if EnemiesAround(myHeroPos() , 435) >= 5 then
                    self:CastW()
                  end
                end
              end
            end

            function Lissandra:ProcessSpell(unit, spell)
       if GetObjectType(unit) == Obj_AI_Hero and GetTeam(unit) ~= GetTeam(myHero) and IsReady(_R) then
      if CHANELLING_SPELLS[spell.name] then
        if ValidTarget(unit, 1000) and GetObjectName(unit) == CHANELLING_SPELLS[spell.name].Name and  self.Config.misc.interrupt[GetObjectName(unit).."Inter"]:Value() and self.Config.misc.interrupt.r:Value() then 
         self:CastR(unit)
        end
      end
    end
            end
            function Lissandra:GetQDmg(target)
              if GetCastLevel(myHero, _Q) < 1 then
                return 0
              end
              if IsReady(_Q) then
                local FinalDamage = (40 + (GetCastLevel(myHero, _Q) * 30) + (GetBonusAP(myHero))*.65)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Lissandra:GetWDmg(target)
              if GetCastLevel(myHero, _W) < 1 then
                return 0
              end
              if IsReady(_W) then
                local FinalDamage = (30 + (GetCastLevel(myHero, _W) * 40) + (GetBonusAP(myHero))* .4)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Lissandra:GetEDmg(target)
              if GetCastLevel(myHero, _E) < 1 then
                return 0
              end
              if IsReady(_E) then
                local FinalDamage = (25 + (GetCastLevel(myHero, _E) * 45) + (GetBonusAP(myHero))* .6)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Lissandra:GetRDmg(target)
              if GetCastLevel(myHero, _R) < 1 then
                return 0
              end
              if IsReady(_R) then
                local FinalDamage = (50 + (GetCastLevel(myHero, _R) * 100) + (GetBonusAP(myHero))* .7)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Lissandra:GetMyDmg(target)
              if IsReady(_Q) and IsReady(_W) and IsReady(_R) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
              elseif IsReady(_Q) and IsReady(_W) and IsReady(_R) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target)
              elseif IsReady(_Q) and IsReady(_W) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
              elseif IsReady(_Q) and IsReady(_R) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
              elseif IsReady(_R) and IsReady(_W) and IsReady(_E) then
                return self:GetRDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
              elseif IsReady(_Q) and IsReady(_W) then
                return self:GetQDmg(target) + self:GetWDmg(target)
              elseif IsReady(_E) and IsReady(_W) then
                return self:GetEDmg(target) + self:GetWDmg(target)
              elseif IsReady(_R) and IsReady(_W) then
                return self:GetRDmg(target) + self:GetWDmg(target)
              elseif IsReady(_Q) and IsReady(_R) then
                return self:GetQDmg(target) + self:GetRDmg(target)
              elseif IsReady(_E) and IsReady(_R) then
                return self:GetEDmg(target) + self:GetRDmg(target)
              elseif IsReady(_Q) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetEDmg(target)
              elseif IsReady(_R) then
                return self:GetRDmg(target)
              elseif IsReady(_E) then
                return self:GetEDmg(target)
              elseif IsReady(_Q) then
                return self:GetQDmg(target)
              elseif IsReady(_W) then
                return self:GetWDmg(target)
              else
                return 0
              end
            end
            function Lissandra:GetDraws(target)
              local qdamage = self:GetQDmg(target)
              local wdamage = self:GetWDmg(target)
              local edamage = self:GetEDmg(target)
              local rdamage = self:GetRDmg(target)
              local Idmg=(50+ ((myHero.level)*20))

              if qdamage >target.health then
                return 'Q', GoS.White
              elseif qdamage+ Idmg>target.health then
                return 'Q + Ignite', GoS.White
              elseif wdamage >target.health then
                return 'W', GoS.White
              elseif wdamage+ Idmg>target.health then
                return 'W + Ignite', GoS.White
              elseif edamage >target.health then
                return 'E', GoS.White
              elseif edamage + Idmg>target.health then
                return 'E + Ignite', GoS.White
              elseif rdamage  >target.health then
                return 'R', GoS.White
              elseif rdamage + Idmg>target.health then
                return 'R + Ignite', GoS.White
              elseif rdamage +edamage  >target.health then
                return 'R + E',GoS.White
              elseif rdamage +edamage+ Idmg>target.health then
                return 'R + E + Ignite',GoS.White
              elseif edamage+wdamage >target.health then
                return 'E + W',GoS.White
              elseif edamage+wdamage+ Idmg>target.health then
                return 'E + W + Ignite',GoS.White
              elseif rdamage+wdamage >target.health then
                return 'R + W',GoS.White
              elseif rdamage+wdamage+ Idmg>target.health then
                return 'R + W + Ignite',GoS.White
              elseif qdamage+wdamage >target.health then
                return 'Q + W',GoS.White
              elseif qdamage+edamage>target.health then
                return 'Q + E',GoS.White
              elseif qdamage+rdamage >target.health then
                return 'Q + R',GoS.White
              elseif qdamage+wdamage+ Idmg>target.health then
                return 'Q + W + Ignite',GoS.White
              elseif qdamage+edamage+ Idmg>target.health then
                return 'Q + E + Ignite',GoS.White
              elseif qdamage+rdamage+ Idmg>target.health then
                return 'Q + R + Ignite',GoS.White
              elseif qdamage+edamage+wdamage >target.health then
                return 'Q + W + E',GoS.White
              elseif qdamage+rdamage+wdamage >target.health then
                return 'Q + W + R',GoS.White
              elseif qdamage+edamage+rdamage >target.health then
                return 'Q + R + E',GoS.White
              elseif qdamage+edamage+wdamage+ Idmg>target.health then
                return 'Q + W + E + Ignite',GoS.White
              elseif qdamage+wdamage+edamage+rdamage >target.health then
                return 'Kill with full combo',GoS.White
              elseif qdamage+wdamage+edamage+rdamage+Idmg>target.health then
                return 'Full Combo + Ignite',GoS.White
              else
                return "Cant Kill yet", GoS.White
              end
            end
            function Lissandra:killsteal()
              for _, unit in pairs(GetEnemyHeroes()) do
                local health = unit.health
                local dmgE = self:GetEDmg(unit)
                if(GetDistance(unit) <= self.E.range and  IsReady(_E) and health<dmgE and self.Config.killsteal.useE:Value()    and self.Config.killsteal.ks:Value() )then
                  local Ticker = GetTickCount()
                  if (global_ticks + 2000) < Ticker then
                    if (IsReady(_E) and GetDistance(unit) <= self.E.range) then
                      CastSkillShot(_E, unit.x,unit.y, unit.z)
                      global_ticks = Ticker
                      DelayAction(function() CastSpell(_E) end, 2)
                    end
                  end
                end
                local dmgQ = self:GetQDmg(unit)
                if(GetDistance(target) <= self.Q.range and  IsReady(_Q) and health<dmgQ and self.Config.killsteal.useQ:Value()  and self.Config.killsteal.ks:Value()  )then
                  self:CastQ(unit)
                end
                local dmgW = self:GetWDmg(unit)
                if(GetDistance(target) <= self.W.range and  IsReady(_W) and health<dmgQ and self.Config.killsteal.useW:Value()  and self.Config.killsteal.ks:Value()  )then
                  self:CastW(unit)
                end
                local dmgI =(50+ ((myHero.level)*20))
                if(health<dmgI and self.Config.killsteal.useI:Value()  and self.Config.killsteal.ks:Value()  and GetDistance(unit)<600)then
                  self:CastI(unit)
                end
                local dmgR =self:GetRDmg(unit)
                if(GetDistance(target) <= self.R.range and  IsReady(_R) and health<dmgR and self.Config.killsteal.useR:Value()  and self.Config.killsteal.ks:Value()  and GetDistance(unit)<550)then
                  self:CastR(unit)
                end
              end
            end
            -- burda kaldım ------------------------------------------------------------------
            function Lissandra:escape()
              local Ticker = GetTickCount()
              if (global_ticks + 2000) < Ticker then
                if self.Config.Keys.escapekey:Value()  and self.Config.escape.useE:Value()   then
                  if (myHero:CanUseSpell(_E) == READY ) then
                    CastSkillShot(_E,mousePos.x,mousePos.y,mousePos.z)
                    global_ticks = Ticker
                    DelayAction(function() CastSpell(_E) end, 1.5)
                  end
                end
              end
              if self.Config.Keys.escapekey:Value()  then
                self:walk()
              end
              if self.Config.Keys.escapekey:Value()  and self.Config.escape.useW:Value()  and GetDistance(target) <= self.W.range then
                CastSkillShot(_W,target)
              end
            end
            function Lissandra:walk()
              MoveToXYZ(mousePos)
            end
            function Lissandra:harass()

              if self.Config.Keys.harasskey:Value() or self.Config.Keys.harasstoglekey:Value() then
                if(IsReady(_Q) and (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 ) and GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value() ) then
                  self:CastQ(target)
                end
              end
              if self.Config.Keys.harasskey:Value() or self.Config.Keys.harasstoglekey:Value() then
                if(IsReady(_W) and (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 ) and GetDistance(target) <= self.W.range and self.Config.harass.useW:Value() ) then
                  self:CastW(target)
                end
              end
              if self.Config.Keys.harasskey:Value() or self.Config.Keys.harasstoglekey:Value()  then
                if(self.Config.skilllogic.Elogic.harass:Value() == 1  and (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 )  and self.Config.harass.useE:Value() ) then
                  local Ticker = GetTickCount()
                  if (global_ticks + 2000) < Ticker then
                    if (myHero:CanUseSpell(_E) == READY and GetDistance(target) <= self.E.range) then
                      CastSkillShot(_E, target.x,target.y, target.z)
                      global_ticks = Ticker
                      DelayAction(function() CastSpell(_E) end, 2)
                    end
                  end
                end
              end
              if self.Config.Keys.harasskey:Value() or self.Config.Keys.harasstoglekey:Value()  then
                if(self.Config.skilllogic.Elogic.harass:Value() == 2 and   (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 )  and self.Config.harass.useE:Value() ) then
                  local Ticker = GetTickCount()
                  if (global_ticks + 2000) < Ticker then
                    if (myHero:CanUseSpell(_E) == READY and GetDistance(target) <= self.E.range) then
                      CastSkillShot(_E, target.x,target.y, target.z)
                      global_ticks = Ticker
                      DelayAction(function() CastSpell(_E) end, 1.5)
                    end
                  end
                end
              end
            end
            function Lissandra:LastHit()
              for _, target in pairs(minionManager.objects) do
                if IsObjectAlive(target) and GetTeam(target) == MINION_ENEMY then
                  if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
                    local Qdamage = self:GetQDmg(target)
                    if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.QMana:Value() /100 ) and ValidTarget(target,725)  and Qdamage >= GetCurrentHP(target)) then
                      self:CastQ(target)
                    end
                    local Wdamage = self:GetWDmg(target)
                    if(IsReady(_W) and self.Config.farm.lasthit.useW:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.WMana:Value()/100 )and  ValidTarget(target,450)  and Wdamage >= GetCurrentHP(target)) then
                      self:CastW(target)
                    end
                  end
                end
              end
            end
            function Lissandra:LaneClear()
              for i, minion in pairs(minionManager.objects) do
                if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_ENEMY then
                  local NumberOfHits = self.Config.farm.laneclear.wcount:Value()
                  if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useW:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.WMana:Value() /100 ) and GetDistance(minion) <= 450 then
                    self:CastW(minion)
                  end
                end
              end
              if (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.QMana:Value() /100 ) then
                local NumberOfHits = self.Config.farm.laneclear.qcount:Value()
                if IsReady(_Q) then
                  if  self.Config.farm.laneclear.useQ:Value()   then
                    local BestPos, BestHit =  GetLineFarmPosition(self.Q.range, self.Q.width, MINION_ENEMY)
                    if BestPos   and  BestHit >= NumberOfHits then
                      CastSkillShot(_Q, BestPos)
                    end
                  end
                end
              end
              if (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.EMana:Value() /100 ) then
                local NumberOfHits = self.Config.farm.laneclear.ecount:Value()
                if self.Config.farm.laneclear.useE:Value()   then
                  local BestPos, BestHit = GetLineFarmPosition(self.E.range, self.E.width, MINION_ENEMY)
                  if BestPos and  BestHit >= NumberOfHits then
                    local Ticker = GetTickCount()
                    if (global_ticks + 2000) < Ticker then
                      if (myHero:CanUseSpell(_E) == READY ) then
                        CastSkillShot(_E, BestPos)
                        global_ticks = Ticker
                        DelayAction(function() CastSpell(_E) end, 2)
                      end
                    end
                  end
                end
              end
            end
            function Lissandra:autoq()

              if(IsReady(_Q) and (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value() /100 )  and self.Config.harass.autoq:Value() ) then
                self:CastQ(target)
              end
            end
            function Lissandra:JungleClear()
              for i, minion in pairs(minionManager.objects) do
                if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_JUNGLE then
                  local NumberOfHits = 1
                  if self.Config.farm.jungleclear.useW:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.WMana:Value() /100 ) and GetDistance(minion) <= 450 then
                    self:CastW(minion)
                  end
                end
              end
              if (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.QMana:Value() /100 ) then
                local NumberOfHits = 1
                if IsReady(_Q) then
                  if  self.Config.farm.jungleclear.useQ:Value()   then
                    local BestPos, BestHit =  GetFarmPosition(self.Q.range, self.Q.width, MINION_JUNGLE)
                    if BestPos  and  BestHit >= NumberOfHits then
                      CastSkillShot(_Q, BestPos)
                    end
                  end
                end
              end
              if (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.EMana:Value() /100 ) then
                local NumberOfHits = 1
                if self.Config.farm.jungleclear.useE:Value()   then
                  local BestPos, BestHit = GetLineFarmPosition(self.E.range, self.E.width, MINION_JUNGLE)
                  if BestPos  and  BestHit >= NumberOfHits then
                    local Ticker = GetTickCount()
                    if (global_ticks + 2000) < Ticker then
                      if (myHero:CanUseSpell(_E) == READY ) then
                        CastSkillShot(_E, BestPos)
                        global_ticks = Ticker
                        DelayAction(function() CastSpell(_E) end, 2)
                      end
                    end
                  end
                end
              end
            end
            function Lissandra:onload()
              self:findorb()
            end
            function Lissandra:LoadMenu()
              self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )

              self.Config:Menu("combo",loc_eng[1])
              self.Config.combo:Boolean("useQ", loc_eng[2], true)
              self.Config.combo:Boolean("useW", loc_eng[3], true)
              self.Config.combo:Boolean("useE", loc_eng[4], true)
              self.Config.combo:Boolean("useR", loc_eng[5], true)
              self.Config.combo:Boolean("useI", loc_eng[6], true)
              self.Config.combo:Slider("Mana",loc_eng[8], 10, 10, 100, 1)

              self.Config:Menu( "harass",loc_eng[9])
              self.Config.harass:Boolean("useQ", loc_eng[10], true)
              self.Config.harass:Boolean("useW", loc_eng[11], false)
              self.Config.harass:Boolean("useE", loc_eng[12], true)
              self.Config.harass:Boolean("autoq", loc_eng[91], false)
              self.Config.harass:Slider("Mana",loc_eng[8], 30, 10, 100, 1)

              self.Config:Menu("skilllogic",loc_eng[99])
              self.Config.skilllogic:Menu( "Elogic",loc_eng[102])
              self.Config.skilllogic.Elogic:DropDown("combo", loc_eng[143], 2, {loc_eng[145], loc_eng[146] })
              self.Config.skilllogic.Elogic:DropDown("harass", loc_eng[144], 1, {loc_eng[146], loc_eng[145] })
              self.Config.skilllogic.Elogic:Info("blank", "")
              self.Config.skilllogic.Elogic:Info("infoE", loc_eng[154])
              self.Config.skilllogic:Menu( "Rlogic",loc_eng[103])
              self.Config.skilllogic.Rlogic:DropDown("Rlogic", loc_eng[155], 1, {loc_eng[149], loc_eng[150], loc_eng[151] })
              self.Config.skilllogic.Rlogic:Boolean("enableautoR", loc_eng[152], true)
              self.Config.skilllogic.Rlogic:Slider("autoR", loc_eng[153],  10, 0, 100, 1)
              self.Config.skilllogic.Rlogic:Info("infoR2", "")
              self.Config.skilllogic.Rlogic:Boolean("infoR", loc_eng[156])

              self.Config:Menu("escape",loc_eng[30])
              self.Config.escape:Boolean("useW",loc_eng[32],true)
              self.Config.escape:Boolean("useE",loc_eng[33],true)

              self.Config:Menu( "farm",loc_eng[14])

              self.Config.farm:Menu("laneclear",loc_eng[15])
              self.Config.farm.laneclear:Boolean("useQ",loc_eng[16],true)
              self.Config.farm.laneclear:Slider("qcount",loc_eng[180], 2, 1, 10, 1)
              self.Config.farm.laneclear:Boolean("useW",loc_eng[17],true)
              self.Config.farm.laneclear:Slider("wcount",loc_eng[181], 2, 1, 10, 1)
              self.Config.farm.laneclear:Boolean("useE",loc_eng[18],true)
              self.Config.farm.laneclear:Slider("ecount",loc_eng[182], 2, 1, 10, 1)
              self.Config.farm.laneclear:Info("blank", "")
              self.Config.farm.laneclear:Info("blank", "")
              self.Config.farm.laneclear:Info("info2", loc_eng[184])
              self.Config.farm.laneclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.laneclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)
              self.Config.farm.laneclear:Slider("EMana",loc_eng[187], 30, 10, 100, 1)

              self.Config.farm:Menu("jungleclear",loc_eng[20])
              self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21],true)
              self.Config.farm.jungleclear:Boolean("useW",loc_eng[22],true)
              self.Config.farm.jungleclear:Boolean("useE",loc_eng[23],true)
              self.Config.farm.jungleclear:Info("blank", "")
              self.Config.farm.jungleclear:Info("blank", "")
              self.Config.farm.jungleclear:Info("info2", loc_eng[184])
              self.Config.farm.jungleclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.jungleclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)
              self.Config.farm.jungleclear:Slider("EMana",loc_eng[187], 30, 10, 100, 1)

              self.Config.farm:Menu("lasthit",loc_eng[25])
              self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189],false)
              self.Config.farm.lasthit:Boolean("useQ",loc_eng[26],true)
              self.Config.farm.lasthit:Boolean("useW",loc_eng[27],true)
              self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191], 1, {loc_eng[172],loc_eng[190],loc_eng[174]})
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("info2", loc_eng[184])
              self.Config.farm.lasthit:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.lasthit:Slider("WMana",loc_eng[186], 30, 10, 100, 1)


              self.Config:Menu( "killsteal",loc_eng[35])
              self.Config.killsteal:Boolean("ks",loc_eng[36],true)
              self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
              self.Config.killsteal:Boolean("useW", loc_eng[38], true)
              self.Config.killsteal:Boolean("useE", loc_eng[39], true)
              self.Config.killsteal:Boolean("useR", loc_eng[40], true)
              self.Config.killsteal:Boolean("useI", loc_eng[41], true)

              self.Config:Menu( "item",loc_eng[42])
              self.Config.item:Menu( "autopot",loc_eng[192])
              self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
              self.Config.item.autopot:Slider("autopothp", loc_eng[194],  10, 0, 100, 1)
              self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
              self.Config.item:Slider("autozhonya", loc_eng[44],  10, 0, 100, 1)
              self.Config.item:Boolean("usehg", loc_eng[45], false)
              self.Config.item:Boolean("usebg", loc_eng[46], false)

              self.Config:Menu( "misc",loc_eng[92])
              self.Config.misc:Menu( "gapClose1",loc_eng[219])
              self.Config.misc.gapClose1:Menu( "gapClose1w","Gap Close - W Settings")
              self.Config.misc.gapClose1.gapClose1w:Info("info3", loc_eng[98] )
              self.Config.misc:Menu("interrupt",loc_eng[93])
              self.Config.misc.interrupt:Boolean("r", loc_eng[97], true)
              self.Config.misc.interrupt:Info("info3", loc_eng[98])
DelayAction(function()
  local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
  for i, spell in pairs(CHANELLING_SPELLS) do
    for _,k in pairs(GetEnemyHeroes()) do
        if spell["Name"] == GetObjectName(k) then
        self.Config.misc.interrupt:Boolean(GetObjectName(k).."Inter", "On "..GetObjectName(k).." "..(type(spell.Spellslot) == 'number' and str[spell.Spellslot]), true)
        end
    end
  end
end, 0.35)
              self.Config.misc:Menu( "autow","[" .. myHero.charName.. "] - Auto W Settings")
              self.Config.misc.autow:Boolean("use", loc_eng[223], true)
              self.Config.misc.autow:DropDown("enemycount", loc_eng[224], 1, {loc_eng[130], loc_eng[131] , loc_eng[132],loc_eng[133] })
              self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
              self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
              self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
              self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
              self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
              self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
              self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
              self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)
              Clock = os.clock()


              self.Config:Menu("other",loc_eng[65])
              --self.Config.other:Menu("Show Damage On Hp Bar", "HPBAR")
              --self.Config.other.HPBAR:Boolean("key","ON/OFF",true)
              self.Config.other:Menu("draw",loc_eng[66])
              self.Config.other.draw:Boolean("qdraw",loc_eng[67],true)
              self.Config.other.draw:Boolean("wdraw",loc_eng[68],true)
              self.Config.other.draw:Boolean("edraw",loc_eng[69],true)
              self.Config.other.draw:Boolean("rdraw",loc_eng[70],true)
              self.Config.other.draw:Boolean("aadraw",loc_eng[71],false)
              self.Config.other:Menu( "color",loc_eng[198])
              self.Config.other.color:ColorPick("Qcolor", loc_eng[199],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Wcolor", loc_eng[200],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Ecolor", loc_eng[201],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Rcolor", loc_eng[202],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("E2color", loc_eng[203],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("AAcolor", loc_eng[204],{255, 255,0,0})
              --  self.Config.other.color:ColorPick("targetselect", loc_eng[205],{255, 255,0,0})
              self.Config.other:Menu( "width",loc_eng[206])
              self.Config.other.width:Slider("Qwidth", loc_eng[210], 1, 1, 10, 1)
              self.Config.other.width:Slider("Wwidth", loc_eng[211], 1, 1, 10, 1)
              self.Config.other.width:Slider("Ewidth", loc_eng[212], 1, 1, 10, 1)
              self.Config.other.width:Slider("Rwidth", loc_eng[213], 1, 1, 10, 1)
              self.Config.other.width:Slider("AAwidth", loc_eng[209], 1, 1, 10, 1)
              --  self.Config.other.width:Slider("STwidth", loc_eng[208], 6, 1, 10, 1)
              --self.Config.other:Menu( "perma",loc_eng[73])
              -- self.Config.other.perma:Boolean("perma",loc_eng[74],true)
              self.Config.other:Boolean("target",loc_eng[75],true)
              self.Config.other:Boolean("damage",loc_eng[214],true)
              self.Config.other:Boolean("targetcal",loc_eng[76],true)

              self.Config:Menu("targetsel",loc_eng[77])
              self.Config.targetsel:Boolean("ts",loc_eng[78], false)

              self.Config:Menu("orb","Orbwalker Settings")
              self.Config.orb:Menu( "selectorb","Current Orbwalker :")

              self.Config:Menu("pred","Prediction Settings")
              self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
              self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
              self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
              self.Config.pred.hcgeneral.hcop:Slider("hcopq", "Q Hitchance " , 60, 0, 100, 1)
              self.Config.pred.hcgeneral.hcop:Slider("hcope", "E Hitchance " , 60, 0, 100, 1)
              self.Config.pred:Info("blank", "    Currently Open Prediction "   )
              self.Config.pred:Info("blank", "      is best with this bundle"   )

              self.Config:Menu( "Keys",loc_eng[79])
              self.Config.Keys:Info("infoK3", loc_eng[80])
              self.Config.Keys:Key("combokey", loc_eng[81], string.byte(" "))
              self.Config.Keys:Key("combokeyr", loc_eng[170], string.byte("U"))
              self.Config.Keys:Info("infoK4", loc_eng[82])
              self.Config.Keys:Key("harasskey", loc_eng[83], string.byte("C"))
              self.Config.Keys:Key("harasstoglekey", loc_eng[164], string.byte("T"))
              self.Config.Keys:Info("infoK5", loc_eng[84])
              self.Config.Keys:Key("laneclearkey", loc_eng[85], string.byte("V"))
              self.Config.Keys:Key("jungleclearkey", loc_eng[86], string.byte("V"))
              self.Config.Keys:Key("lasthitkey",loc_eng[215], string.byte("X"))
              --self.Config.Keys:Boolean("lasthitkey", "Lasthit Key", string.byte("X"))
              self.Config.Keys:Info("infoK6", loc_eng[87])
              self.Config.Keys:Key("escapekey", loc_eng[88], string.byte("Y"))
              self.Config.Keys:Info("infoK", "")
              self.Config.Keys:Info("infoK2", loc_eng[89])

              self.Config:Info("infoK","           "..Scriptname.."" )
              self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
              self.Config:Info("infoK","   Script was made by  "..Author.. "" )
              self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
              self.Config:Boolean("instruct", loc_eng[216], false)

            end
            ---//==================================================\\---
            --|| > Leblanc Extras                  ||--
            ---\\==================================================//---
            function Lissandra:Antiafk()
              if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
              Clock = os.clock() + math.random(60,120)
              MoveToXYZ(myHeroPos())
            end
            function Lissandra:skinhack()
              if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
                lastTimeTickCalled = CurrentTimeInMillis()
                if  self.Config.misc.skinhack.useskin:Value() then
                  if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                    lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
                    HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
                  end
                end
              end
            end
            local spellLevel = 0
            function Lissandra:autolevel()
              if GetLevelPoints(myHero) >= 1 then
                if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =   { _Q,_E,_W,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
              end
            end
            lastPotion = 0
            function Lissandra:autopot()
              if os.clock() - lastPotion < 15 then return end
              for SLOT = ITEM_1, ITEM_6 do
                if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
                  if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
                    CastSpell(SLOT)
                    lastPotion = os.clock()
                  end
                end
              end
            end
            function Lissandra:items()
              if self.Config.item.usebg:Value() and self.Config.Keys.combokey:Value() then
                for _ = ITEM_1, ITEM_7 do
                  if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
                end
              end
            end
            if self.Config.item.usehg:Value() and self.Config.Keys.combokey:Value() then
              for _ = ITEM_1, ITEM_7 do
                if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastTargetSpell(target, _)
              end
            end
          end
          if self.Config.item.enableautozhonya:Value() then
            for _ = ITEM_1, ITEM_7 do
              if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya:Value() / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
            end
          end
        end
      end
      function Lissandra:WndMsg(Msg, Key)
        if self.Config.targetsel.ts:Value() then
          if Msg == WM_LBUTTONDOWN then
            local minD = 10
            local starget = nil
            for i, enemy in ipairs(GetEnemyHeroes()) do
              if ValidTarget(enemy) then
                if GetDistance(enemy, mousePos) <= minD or starget == nil then
                  minD = GetDistance(enemy, mousePos)
                  starget = enemy
                end
              end
            end
            if starget and minD < 150 then
              if self.selectedTar and starget.charName == self.selectedTar.charName then
                self.selectedTar = nil
                print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
              else
                self.selectedTar = starget
                print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
              end
            end
          end
        end
        if Msg == WM_LBUTTONDOWN then
          if PopUp1 then
            PopUp1 = false
          end
        end
      end

      local Qbuff = false
      class "Akali"
      function Akali:__init()
        self.Q = {  range = 600 }
        self.E = {  range = 315 }
        self.R = { range = 700  }
        self:LoadMenu()
        Last_LevelSpell = 0
        AddGapcloseEvent(_W, 100, false,  self.Config.misc.gapClose)
        self.tsg = TargetSelector(925,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
        Callback.Add("Tick", function() self:Tick() end)
        Callback.Add("Load", function() self:onload() end)
        Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
        Callback.Add("Draw", function() self:Draw() end)
        --Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
        Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
        Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)

        --Callback.Add("ProcessSpellComplete", function(x,y) self:ProcessSpellComplete(x,y) end)
      end
      function  Akali:Checks()
        Gtarget = self.tsg:GetTarget()
        if not ValidTarget(Gtarget, 925) or not self.Config.targetsel.ts:Value()  then
          target = GetCurrentTarget()
        elseif  ValidTarget(Gtarget, 925) and not self.selectedTar then
          target = GetCurrentTarget()
        elseif (ValidTarget(Gtarget, 925) and self.selectedTar) then
          target = self.selectedTar
        end
        mousePos = GetMousePos()

      end
      function Akali:Tick()
        self:Checks()
        self:autopot()
        self:autoq()
        self:Autostealth()
        self:Antiafk()
        self:autolevel()
        self:skinhack()
        self:items()
        if self.Config.Keys.autoq:Value() then
          self:autoq()
        end
        if(self.Config.Keys.combokey:Value()  and self.Config.skilllogic.Rlogic.logic:Value()  == 1 )then
          self:combo()
        end
        if(self.Config.Keys.combokey:Value()  and self.Config.skilllogic.Rlogic.logic:Value()  == 2 )then
          self:combo2()
        end
        if(self.Config.Keys.jungleclearkey:Value() )then
          self:JungleClear()
        end
        if(self.Config.killsteal.ks:Value() ) then
          self:killsteal()
        end
        if(self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
          self:LastHit()
        end
        if(self.Config.Keys.laneclearkey:Value() )then
          self:LaneClear()
        end
        if(self.Config.Keys.harasskey:Value()  ) then
          self:harass()
        end
        if(self.Config.Keys.escapekey:Value() )then
          self:escape()
        end
        if self.Config.instruct:Value() then
          self.Config.instruct:Value(false)
          PopUp1 = true
        end
      end
      function Akali:Draw()
        if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 600,  self.Config.other.width.Qwidth:Value(),0,self.Config.other.color.Qcolor:Value())
        end

        if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 700,  self.Config.other.width.Wwidth:Value(),0, self.Config.other.color.Wcolor:Value())
        end

        if self.Config.other.draw.edraw:Value() and IsReady(_E) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 325,  self.Config.other.width.Ewidth:Value(),0, self.Config.other.color.Ecolor:Value())
        end

        if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 700, self.Config.other.width.Rwidth:Value(),0, self.Config.other.color.Rcolor:Value())
        end
        if self.Config.other.draw.aadraw:Value() then
          DrawCircle(myHero.x, myHero.y, myHero.z, 125, self.Config.other.width.AAwidth:Value(),0, self.Config.other.color.AAcolor:Value())
        end
        --[[ if self.Config.other.draw.rtdraw and IsReady(_R)  then
          if self.tsr.target~=nil then
            DrawLine3D(myHero.x, myHero.y, myHero.z,self.tsr.target.x, self.tsr.target.y, self.tsr.target.z,self.Config.other.width.E2width,self.Config.other.color.E2color:Value())))
          end
          end]]
          local rs = GetResolution()
          if PopUp1 then
            local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
            DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
            DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
            DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
            DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
            DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
            DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
            DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
            DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
            DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
            DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
            DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
            DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
            -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
            -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
            -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
            -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
            local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
            --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
            --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
            FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
            DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
          end
          --[[ if self.Config.other.target and self.selectedTar ~= nil then
            DrawCircle(self.selectedTar.x, self.selectedTar.y, self.selectedTar.z, 80,6, ARGB(255, 255,0,0))
            end]]
            for _, target in pairs(GetEnemyHeroes()) do
              if ValidTarget(target, 15000) then
                if target.visible and not target.dead and self.Config.other.damage:Value() then
                  currLine = 1
                  -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
                  DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
                  currLine = currLine + 1
                  DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
                end
              end
            end

            if self.Config.other.targetcal:Value() and not myHero.dead then
              if target and target ~= nil then
                --  local target= GetOrigin(target)
                local drawpos=WorldToScreen(1,target.x, target.y, target.z)
                local comboText,color = self:GetDraws(target)
                if comboText then
                  DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
                end
              end
            end
          end
          function Akali:CastQ(unit)
            if IsReady(_Q) then
              CastTargetSpell(unit, _Q)
            end
          end

          function Akali:CastW(unit)
            if IsReady(_W) then
              CastSpell(_W)
            end
          end

          function Akali:CastE(unit)
            if IsReady(_E) then
              CastSpell(_E)
            end
          end

          function Akali:CastR(unit)
            if IsReady(_R) then
              CastTargetSpell(unit, _R)
            end
          end
          function Akali:CastI(unit)
            local Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
            if Ignite then
              if IsReady(Ignite) then
                CastTargetSpell(unit, Ignite)
              end
            end
          end
          function Akali:combo()
            if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_Q))then
              self:CastQ(target)
            end
            if(GetDistance(target) <= self.R.range and self.Config.combo.useR:Value() and Qbuff and  self.Config.Keys.combokey:Value() and not IsReady(_Q) and IsReady(_R))then
              self:CastR(target)
            end
            if(GetDistance(target) <= self.E.range and GetDistance(target)<315 and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_E))then
              self:CastE(target)
            end
            if(self.Config.combo.useI:Value() and self.Config.Keys.combokey:Value()  )then
              for _, unit in pairs(GetEnemyHeroes()) do
                local dmgI =(50+ ((myHero.level)*20))
                local health=unit.health
                if(health<dmgI and self.Config.combo.useI:Value() and GetDistance(unit)<600)then
                  self:CastI(unit)
                end
              end
            end
          end
          function Akali:combo2()
            if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_Q))then
              self:CastQ(target)
            end
            if(GetDistance(target) <= self.R.range and self.Config.combo.useR:Value() and  self.Config.Keys.combokey:Value()  and not IsReady(_Q) and IsReady(_R))then
              self:CastR(target)
            end
            if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value() and  self.Config.Keys.combokey:Value()  and IsReady(_E))then
              self:CastE(target)
            end
            if(self.Config.combo.useI:Value() and self.Config.Keys.combokey:Value() )then
              for _, unit in pairs(GetEnemyHeroes()) do
                local dmgI =(50+ ((myHero.level)*20))
                local health=unit.health
                if(health<dmgI and self.Config.combo.useI:Value() and GetDistance(unit)<600)then
                  self:CastI(unit)
                end
              end
            end
          end
          function Akali:harass()
            if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_Q))then
              self:CastQ(target)
            end
            if(GetDistance(target) <= self.E.range  and self.Config.harass.useE:Value() and  self.Config.Keys.harasskey:Value()  and IsReady(_E))then
              self:CastE(target)
            end
          end
          function Akali:JungleClear()
            for i, minion in pairs(minionManager.objects) do
              if ValidTarget(minion) and minion ~= nil and  GetTeam(minion) == MINION_JUNGLE then
                if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useQ:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.QMana:Value()  /100 ) and GetDistance(minion) <= self.Q.range then
                  self:CastQ(minion)
                end

                if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useE:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.EMana:Value()  /100 ) and GetDistance(minion) <= self.E.range then
                  self:CastE(minion)
                end
                if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useR:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.RMana:Value()  /100 ) and GetDistance(minion) <= self.E.range then
                  self:CastR(minion)
                end
              end
            end
          end
          function Akali:LastHit()
            for _, target in pairs(minionManager.objects) do
              if IsObjectAlive(target) and GetTeam(target) == MINION_ENEMY then
                if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
                  local Qdamage = self:GetQDmg(target)
                  if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.QMana:Value() /100 ) and ValidTarget(target,self.Q.range)   and Qdamage >= GetCurrentHP(target)) then
                    self:CastQ(target)
                  end
                  local Edamage = self:GetEDmg(target)
                  if(IsReady(_E) and self.Config.farm.lasthit.useE:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.EMana:Value() /100 )and  ValidTarget(target,self.E.range)  and Edamage >= GetCurrentHP(target)) then
                    self:CastE(target)
                  end
                end
              end
            end
          end
          function Akali:LaneClear()
            for i, minion in pairs(minionManager.objects) do
              if ValidTarget(minion) and minion ~= nil and  GetTeam(minion) == MINION_ENEMY then
                if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useQ:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.QMana:Value()  /100 ) and GetDistance(minion) <= self.Q.range then
                  self:CastQ(minion)
                end
                local NumberOfHits = self.Config.farm.laneclear.ecount:Value()
                if NumberOfHits >= 1 and #minionManager.objects >= NumberOfHits then
                  if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useE:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.EMana:Value()  /100 ) and GetDistance(minion) <= self.E.range then
                    self:CastE(minion)
                  end
                end
              end
            end
          end
          function Akali:UpdateBuff(unit,buff)
            if unit and unit.team ~= myHero.team and unit.type == myHero.type then
              if buff.Name == "AkaliMota" then
                Qbuff = true
              end
            end
          end
          function Akali:RemoveBuff(unit, buff)
            if unit and unit.team ~= myHero.team and unit.type == myHero.type then
              if buff.Name == "AkaliMota" then

                Qbuff = false
              end
            end
          end
          function Akali:walk()
            MoveToXYZ(mousePos)
          end
          function Akali:escape()
            if self.Config.Keys.escapekey:Value()  and self.Config.escape.useW:Value() then
              CastSkillShot(_W, GetMousePos())
            end
            if self.Config.Keys.escapekey:Value()  then
              self:walk()
            end
            for i, minion in pairs(minionManager.objects) do
              if IsReady(_R) then
                if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_ENEMY then
                  if self.Config.Keys.escapekey:Value()and self.Config.escape.useR:Value() then
                    if GetDistance(minion, GetMousePos()) < 250 then
                      CastTargetSpell(minion, _R)
                    end
                  end
                end
              end
            end
          end
          --[[function Akali:ProcessSpell(unit, spell)
          if unit.type == myHero.type and unit.team ~= myHero.team and isAGapcloserUnit[unit.charName] and GetDistance(unit) < 1000 and spell ~= nil then
            if spell.name == (type(isAGapcloserUnit[unit.charName].spell) == 'number' and unit:GetSpellData(isAGapcloserUnit[unit.charName].spell).name or isAGapcloserUnit[unit.charName].spell) and self.Config.misc.gapClose[unit.charName]:Value() then
              if spell.target ~= nil and spell.target.name == myHero.name or isAGapcloserUnit[unit.charName].spell == 'blindmonkqtwo' then
                CastSpell(_W, myHero.x, myHero.z)
              end
            end
          end
          end]]

          ---//==================================================\\---
          --|| > Akali Extras                  ||--
          ---\\==================================================//---
          function Akali:Antiafk()
            if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
            Clock = os.clock() + math.random(60,120)
            MoveToXYZ(myHeroPos())
          end
          function Akali:skinhack()
            if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
              lastTimeTickCalled = CurrentTimeInMillis()
              if  self.Config.misc.skinhack.useskin:Value() then
                if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                  lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
                  HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value() -1)
                end
              end
            end
          end
          local spellLevel = 0
          function Akali:autolevel()
            if GetLevelPoints(myHero) >= 1 then
              if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
                local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                Last_LevelSpell = os.clock()
              end
              if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
                local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
                LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                Last_LevelSpell = os.clock()
              end
              if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
                local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
                LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                Last_LevelSpell = os.clock()
              end
              if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
                local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
                LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                Last_LevelSpell = os.clock()
              end
              if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
                local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
                LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                Last_LevelSpell = os.clock()
              end
              if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
                local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
                LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                Last_LevelSpell = os.clock()
              end
              if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
                local levelSequence =    { _Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
                LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                Last_LevelSpell = os.clock()
              end
            end
          end
          lastPotion = 0

          function Akali:autopot()
            if os.clock() - lastPotion < 15 then return end
            for SLOT = ITEM_1, ITEM_6 do
              if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
                if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
                  CastSpell(SLOT)
                  lastPotion = os.clock()
                end
              end
            end
          end
          function Akali:items()
            if self.Config.item.usebg:Value() and self.Config.Keys.combokey:Value() then
              for _ = ITEM_1, ITEM_7 do
                if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
              end
            end
          end
          if self.Config.item.usehg:Value() and self.Config.Keys.combokey:Value() then
            for _ = ITEM_1, ITEM_7 do
              if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastTargetSpell(target, _)
            end
          end
        end
        if self.Config.item.enableautozhonya:Value() then
          for _ = ITEM_1, ITEM_7 do
            if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya:Value() / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
          end
        end
      end
    end
    function Akali:autoq()
      if(GetDistance(target) <= self.Q.range and self.Config.Keys.autoq:Value() and  IsReady(_Q))then
        self:CastQ(target)
      end
    end
    function Akali:GetQDmg(target)
      if GetCastLevel(myHero, _Q) < 1 then
        return 0
      end
      if IsReady(_Q) then
        local FinalDamage = (15 + (GetCastLevel(myHero, _Q) * 20) + (GetBonusAP(myHero))*.4)
        return CalcDamage(myHero,target,FinalDamage, 0)
      else
        return 0
      end
    end
    function Akali:GetQ2Dmg(target)
      if GetCastLevel(myHero, _Q) < 1 then
        return 0
      end
      if IsReady(_Q) then
        local FinalDamage = (20 + (GetCastLevel(myHero, _Q) * 25) + (GetBonusAP(myHero))*.5)
        return CalcDamage(myHero,target,0, FinalDamage)
      else
        return 0
      end
    end
    function Akali:GetEDmg(target)
      if GetCastLevel(myHero, _E) < 1 then
        return 0
      end
      if IsReady(_E) then
        local FinalDamage = (5 + (GetCastLevel(myHero, _E) * 25) + ((GetBonusAP(myHero))*.4)+(myHero.totalDamage) *0.6)
        return CalcDamage(myHero,target,FinalDamage, 0)
      else
        return 0
      end
    end
    function Akali:GetRDmg(target)
      if GetCastLevel(myHero, _R) < 1 then
        return 0
      end
      if IsReady(_R) then
        local FinalDamage = (25 + (GetCastLevel(myHero, _R) * 75) + (GetBonusAP(myHero))* .5)
        return CalcDamage(myHero,target, FinalDamage,0)
      else
        return 0
      end
    end
    function Akali:GetMyDmg(target)
      if IsReady(_Q) and IsReady(_R) and IsReady(_E) then
        return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target) +self:GetQ2Dmg(target)
      elseif IsReady(_Q)  and IsReady(_R) then
        return self:GetQDmg(target) + self:GetRDmg(target) +self:GetQ2Dmg(target)
      elseif IsReady(_Q)  and IsReady(_E) then
        return self:GetQDmg(target) + self:GetEDmg(target) +self:GetQ2Dmg(target)
      elseif IsReady(_R) and IsReady(_E) then
        return self:GetRDmg(target) +self:GetEDmg(target)
      elseif IsReady(_Q) then
        return self:GetQDmg(target)
      elseif IsReady(_E) then
        return self:GetEDmg(target)
      elseif IsReady(_R) then
        return self:GetRDmg(target)
      elseif IsReady(_Q) and IsReady(_R) then
        return self:GetQDmg(target) + self:GetRDmg(target)+self:GetQ2Dmg(target)
      else
        return 0
      end
    end
    function Akali:GetDraws(target)
      local Qdmg  = self:GetQDmg(target)
      local Qdmg2 =self:GetQ2Dmg(target)
      local Edmg = self:GetEDmg(target)
      local Rdmg = self:GetRDmg(target)
      local Idmg=(50+ ((GetLevel(myHero))*20))

      if Qdmg > GetCurrentHP(target) then
        return 'Q', GoS.White
      elseif Qdmg+Idmg>GetCurrentHP(target) then
        return 'Q + Ignite', GoS.White
      elseif Edmg>GetCurrentHP(target) then
        return 'E', GoS.White
      elseif Edmg+Idmg>GetCurrentHP(target) then
        return 'E + Ignite', GoS.White
      elseif Rdmg>GetCurrentHP(target) then
        return 'R', GoS.White
      elseif Rdmg+Idmg>GetCurrentHP(target) then
        return 'R + Ignite', GoS.White
      elseif Qdmg+Edmg>GetCurrentHP(target) then
        return 'Q + E',GoS.White
      elseif Qdmg+Rdmg>GetCurrentHP(target) then
        return 'Q + R',GoS.White
      elseif Qdmg+Edmg+Idmg>GetCurrentHP(target) then
        return 'Q + E + Ignite',GoS.White
      elseif Qdmg+Rdmg+Idmg>GetCurrentHP(target) then
        return 'Q + R + Ignite',GoS.White
      elseif Qdmg+Edmg+Rdmg+Idmg>GetCurrentHP(target) then
        return 'Q + R + E + Ignite',GoS.White
      elseif Qdmg+Rdmg+Edmg >GetCurrentHP(target) then
        return 'Q + R + E',GoS.White
      elseif Qdmg+Qdmg2 > GetCurrentHP(target) then
        return 'Q + Q2', GoS.White
      elseif Qdmg+Idmg+Qdmg2>GetCurrentHP(target) then
        return 'Q + Q2 + Ignite', GoS.White
      elseif Edmg>GetCurrentHP(target) then
        return 'E', GoS.White
      elseif Edmg+Idmg>GetCurrentHP(target) then
        return 'E + Ignite', GoS.White
      elseif Rdmg>GetCurrentHP(target) then
        return 'R', GoS.White
      elseif Rdmg+Idmg>GetCurrentHP(target) then
        return 'R + Ignite', GoS.White
      elseif Qdmg+Edmg+Qdmg2>GetCurrentHP(target) then
        return 'Q + Q2 + E',GoS.White
      elseif Qdmg+Rdmg+Qdmg2>GetCurrentHP(target) then
        return 'Q + Q2 + R',GoS.White
      elseif Qdmg+Edmg+Idmg+Qdmg2>GetCurrentHP(target) then
        return 'Q + Q2 + E + Ignite',GoS.White
      elseif Qdmg+Rdmg+Idmg+Qdmg2>GetCurrentHP(target) then
        return 'Q + Q2 + R + Ignite',GoS.White
      elseif Qdmg+Edmg+Rdmg+Idmg+Qdmg2>GetCurrentHP(target) then
        return 'Full Combo + Ignite',GoS.White
      elseif Qdmg+Rdmg+Edmg+Qdmg2 >GetCurrentHP(target) then
        return 'Kill with full combo',GoS.White
      else
        return "Cant Kill yet", GoS.White
      end
    end
    function Akali:killsteal()
      for _, unit in pairs(GetEnemyHeroes()) do
        local health = unit.health
        local dmgE = self:GetEDmg(unit)
        if(GetDistance(target) <= self.E.range and  IsReady(_E) and health<dmgE and self.Config.killsteal.useE:Value()   and self.Config.killsteal.ks:Value())then
          self:CastE(unit)
        end
        local dmgQ = self:GetQDmg(unit)
        if(GetDistance(target) <= self.Q.range and  IsReady(_Q) and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
          self:CastQ(unit)
        end
        local dmgI =(50+ ((GetLevel(myHero))*20))
        if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<600)then
          self:CastI(unit)
        end
        local dmgR =self:GetRDmg(unit)
        if(GetDistance(target) <= self.R.range and  IsReady(_R) and health<dmgR and self.Config.killsteal.useR:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<550)then
          self:CastR(unit)
        end
      end
    end
    function Akali:Autostealth()
      if self.Config.skilllogic.Wlogic.useW:Value() and self.Config.skilllogic.Wlogic.useWen:Value() then
        if self.Config.skilllogic.Wlogic.useWe:Value() == 1 then
          if EnemiesAround(myHeroPos() , 900) >= 2 then
            self:CastW(myHeroPos())
          end
        elseif self.Config.skilllogic.Wlogic.useWe:Value() == 2 then
          if EnemiesAround(myHeroPos() , 900) >= 3 then
            self:CastW(myHeroPos())
          end
        elseif self.Config.skilllogic.Wlogic.useWe:Value() == 3 then
          if EnemiesAround(myHeroPos() , 900) >= 4 then
            self:CastW(myHeroPos())
          end
        elseif self.Config.skilllogic.Wlogic.useWe:Value() == 4 then
          if EnemiesAround(myHeroPos() , 900) >= 5 then
            self:CastW(myHeroPos())
          end
        end
      end
      if self.Config.skilllogic.Wlogic.useWhp:Value() and self.Config.skilllogic.Wlogic.useW:Value() then
        if myHero.health <= (myHero.maxHealth * self.Config.skilllogic.Wlogic.hp:Value() / 100) then
          self:CastW(unit)
        end
      end
    end
    function Akali:onload()
      self:findorb()
    end
    function Akali:LoadMenu()
      self.Config=MenuConfig( "menu",""..Scriptname.." [" .. myHero.charName.."]")


      self.Config:Menu("combo",loc_eng[1])
      self.Config.combo:Boolean("useQ", loc_eng[2], true)
      self.Config.combo:Boolean("useE", loc_eng[4], true)
      self.Config.combo:Boolean("useR", loc_eng[5], true)
      self.Config.combo:Boolean("useI", loc_eng[6], true)
      self.Config.combo:Slider("Mana","Energy Manager", 10, 10, 100, 1)



      self.Config:Menu( "harass",loc_eng[9])
      self.Config.harass:Boolean("useQ", loc_eng[10], true)
      self.Config.harass:Boolean("useE", loc_eng[12], true)
      self.Config.harass:Slider("Mana","Energy Manager", 30, 10, 100, 1)

      self.Config:Menu("skilllogic",loc_eng[99])
      self.Config.skilllogic:Menu( "Wlogic",loc_eng[101])
      self.Config.skilllogic.Wlogic:Boolean("useW", loc_eng[138],true)
      self.Config.skilllogic.Wlogic:Boolean("useWhp", loc_eng[137], false)
      self.Config.skilllogic.Wlogic:Slider("hp",loc_eng[104], 30, 10, 100, 1)
      self.Config.skilllogic.Wlogic:Boolean("useWen", loc_eng[136], false)
      self.Config.skilllogic.Wlogic:DropDown("useWe", loc_eng[136], 1, {loc_eng[130], loc_eng[131] , loc_eng[132],loc_eng[133] })
      self.Config.skilllogic:Menu( "Rlogic",loc_eng[103])
      self.Config.skilllogic.Rlogic:DropDown("logic", loc_eng[103], 1, {loc_eng[134], loc_eng[135]})

      self.Config:Menu( "farm",loc_eng[14])

      self.Config.farm:Menu("laneclear",loc_eng[15])
      self.Config.farm.laneclear:Boolean("useQ",loc_eng[16],true)
      self.Config.farm.laneclear:Boolean("useE",loc_eng[18],true)
      self.Config.farm.laneclear:Slider("ecount",loc_eng[182], 2, 1, 10, 1)
      self.Config.farm.laneclear:Info("blank", "")
      self.Config.farm.laneclear:Info("blank", "")
      self.Config.farm.laneclear:Info("info2", "           [Energy Manager]")
      self.Config.farm.laneclear:Slider("QMana","Q skill Energy Manager", 30, 10, 100, 1)
      self.Config.farm.laneclear:Slider("EMana","E skill Energy Manager", 30, 10, 100, 1)

      self.Config.farm:Menu("jungleclear",loc_eng[20])
      self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21],true)
      self.Config.farm.jungleclear:Boolean("useE",loc_eng[23],true)
      self.Config.farm.jungleclear:Boolean("useR",loc_eng[24],false)
      self.Config.farm.jungleclear:Info("blank", "")
      self.Config.farm.jungleclear:Info("blank", "")
      self.Config.farm.jungleclear:Info("info2", "           [Energy Manager]")
      self.Config.farm.jungleclear:Slider("QMana","Q skill Energy Manager", 30, 10, 100, 1)
      self.Config.farm.jungleclear:Slider("EMana","E skill Energy Manager", 30, 10, 100, 1)
      self.Config.farm.jungleclear:Slider("RMana","R skill Energy Manager", 30, 10, 100, 1)

      self.Config.farm:Menu("lasthit",loc_eng[25])
      self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189],false)
      self.Config.farm.lasthit:Boolean("useQ",loc_eng[26],true)
      self.Config.farm.lasthit:Boolean("useE",loc_eng[28],true)
      self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191], 1, {loc_eng[172],loc_eng[174]})
      self.Config.farm.lasthit:Info("blank", "")
      self.Config.farm.lasthit:Info("info2", "           [Energy Manager]")
      self.Config.farm.lasthit:Slider("QMana","Q skill Energy Manager", 30, 10, 100, 1)
      self.Config.farm.lasthit:Slider("EMana","E skill Energy Manager", 30, 10, 100, 1)


      self.Config:Menu( "killsteal",loc_eng[35])
      self.Config.killsteal:Boolean("ks",loc_eng[36],true)
      self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
      self.Config.killsteal:Boolean("useW", loc_eng[38], true)
      self.Config.killsteal:Boolean("useE", loc_eng[39], true)
      self.Config.killsteal:Boolean("useR", loc_eng[40], true)
      self.Config.killsteal:Boolean("useI", loc_eng[41], true)

      self.Config:Menu("escape",loc_eng[30])
      self.Config.escape:Boolean("useW",loc_eng[32],true)
      self.Config.escape:Boolean("useR",loc_eng[34],false)

      self.Config:Menu( "item",loc_eng[42])
      self.Config.item:Menu( "autopot",loc_eng[192])
      self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
      self.Config.item.autopot:Slider("autopothp", loc_eng[194],  10, 0, 100, 1)
      self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
      self.Config.item:Slider("autozhonya", loc_eng[44],  10, 0, 100, 1)
      self.Config.item:Boolean("usehg", loc_eng[45], false)
      self.Config.item:Boolean("usebg", loc_eng[46], false)

      self.Config:Menu( "misc",loc_eng[92])
      self.Config.misc:Menu( "gapClose",loc_eng[219])
      self.Config.misc.gapClose:Boolean("w", loc_eng[220], true)
      self.Config.misc.gapClose:Info("info3", loc_eng[98] )
      self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
      self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
      self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
      self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
      self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
      self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
      self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
      self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)


      Clock = os.clock()

      self.Config:Menu("other",loc_eng[65])
      --self.Config.other:Menu("Show Damage On Hp Bar", "HPBAR")
      --self.Config.other.HPBAR:Boolean("key","ON/OFF",true)
      self.Config.other:Menu("draw",loc_eng[66])
      self.Config.other.draw:Boolean("qdraw",loc_eng[67],true)
      self.Config.other.draw:Boolean("wdraw",loc_eng[68],true)
      self.Config.other.draw:Boolean("edraw",loc_eng[69],true)
      self.Config.other.draw:Boolean("rdraw",loc_eng[70],true)
      self.Config.other.draw:Boolean("aadraw",loc_eng[71],false)
      self.Config.other:Menu( "color",loc_eng[198])
      self.Config.other.color:ColorPick("Qcolor", loc_eng[199],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("Wcolor", loc_eng[200],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("Ecolor", loc_eng[201],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("Rcolor", loc_eng[202],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("E2color", loc_eng[203],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("AAcolor", loc_eng[204],{255, 255,0,0})
      -- self.Config.other.color:ColorPick("targetselect", loc_eng[205],{255, 255,0,0})
      self.Config.other:Menu( "width",loc_eng[206])
      self.Config.other.width:Slider("Qwidth", loc_eng[210], 1, 1, 10, 1)
      self.Config.other.width:Slider("Wwidth", loc_eng[211], 1, 1, 10, 1)
      self.Config.other.width:Slider("Ewidth", loc_eng[212], 1, 1, 10, 1)
      self.Config.other.width:Slider("Rwidth", loc_eng[213], 1, 1, 10, 1)
      self.Config.other.width:Slider("AAwidth", loc_eng[209], 1, 1, 10, 1)
      -- self.Config.other.width:Slider("STwidth", loc_eng[208], 1, 1, 10, 1)
      -- self.Config.other:Menu( "perma",loc_eng[73])
      -- self.Config.other.perma:Boolean("perma",loc_eng[74],true)
      self.Config.other:Boolean("target",loc_eng[75],true)
      self.Config.other:Boolean("damage",loc_eng[214],true)
      self.Config.other:Boolean("targetcal",loc_eng[76],true)

      self.Config:Menu("targetsel",loc_eng[77])
      self.Config.targetsel:Boolean("ts",loc_eng[78], false)

      self.Config:Menu("orb","Orbwalker Settings")
      self.Config.orb:Menu( "selectorb","Current Orbwalker :")

      self.Config:Menu("pred","Prediction Settings")
      self.Config.pred:Info("blank", " No skillshot available "   )

      self.Config:Menu( "Keys",loc_eng[79])
      self.Config.Keys:Info("infoK3", loc_eng[80])
      self.Config.Keys:Key("combokey", loc_eng[81], string.byte(" "))
      self.Config.Keys:Info("infoK4", loc_eng[82])
      self.Config.Keys:Key("harasskey", loc_eng[83], string.byte("C"))
      self.Config.Keys:Key("autoq", loc_eng[91],string.byte("T"))
      self.Config.Keys:Info("infoK5", loc_eng[84])
      self.Config.Keys:Key("laneclearkey", loc_eng[85], string.byte("V"))
      self.Config.Keys:Key("jungleclearkey", loc_eng[86], string.byte("V"))
      self.Config.Keys:Key("lasthitkey",loc_eng[215], string.byte("X"))      self.Config.Keys:Info("infoK6", loc_eng[87])
      self.Config.Keys:Key("escapekey", loc_eng[88], string.byte("Y"))
      self.Config.Keys:Info("infoK", "")
      self.Config.Keys:Info("infoK2", loc_eng[89])

      self.Config:Info("infoK","           "..Scriptname.."" )
      self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
      self.Config:Info("infoK","   Script was made by  "..Author.. "" )
      self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
      self.Config:Boolean("instruct", loc_eng[216], false)

    end

    function Akali:WndMsg(Msg, Key)
      if self.Config.targetsel.ts:Value() then
        if Msg == WM_LBUTTONDOWN then
          local minD = 10
          local starget = nil
          for i, enemy in ipairs(GetEnemyHeroes()) do
            if ValidTarget(enemy) then
              if GetDistance(enemy, mousePos) <= minD or starget == nil then
                minD = GetDistance(enemy, mousePos)
                starget = enemy
              end
            end
          end
          if starget and minD < 150 then
            if self.selectedTar and starget.charName == self.selectedTar.charName then
              self.selectedTar = nil
              print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            else
              self.selectedTar = starget
              print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            end
          end
        end
      end
      if Msg == WM_LBUTTONDOWN then
        if PopUp1 then
          PopUp1 = false
        end
      end
    end
    local ebuff = false
    class "Viktor"
    function Viktor:__init()
      self.W = { delay = 0.50, speed = 750, width = 125, range = 700 , radius = 250 } --AOE true , Col false
      self.E = { delay = 0.25, speed = 1350 , width = 180, range = 1200 } --AOE false , Col false
      self.R = { delay = 0.25, speed = 1000, width = 650, range = 700 , radius = 325 } --AOE true , Col false
      self:LoadMenu()
      AddGapcloseEvent(_W, 100, false,  self.Config.misc.gapClose)
      self.tsg = TargetSelector(1300,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
      if ipred then
        rSpell = IPrediction.Prediction({range = 600, speed = 1000, delay = 0.50, width = 650, type = "circular", name =myHero:GetSpellData(_R).name, collision = false})
        wSpell  = IPrediction.Prediction({range = 700, speed = 750, delay = 0.50, width = 125, type = "circular",name =myHero:GetSpellData(_W).name,  collision = false})
      end
      self.E = {Range1 = 550, Range2 = 700, width = 180, ready}
      self.ERange = self.E.Range1+self.E.Range2
      Last_LevelSpell = 0
      Callback.Add("Load", function() self:onload() end)
      Callback.Add("Tick", function() self:Tick() end)
      Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
      Callback.Add("Draw", function() self:Draw() end)
      Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
      Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)
      Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
      --Callback.Add("ProcessSpellComplete", function(x,y) self:ProcessSpellComplete(x,y) end)
    end
    function Viktor:Checks()
      Gtarget = self.tsg:GetTarget()
      if not ValidTarget(Gtarget, 1300) or not self.Config.targetsel.ts:Value()  then
        target = GetCurrentTarget()
      elseif  ValidTarget(Gtarget, 1300) and not self.selectedTar then
        target = GetCurrentTarget()
      elseif (ValidTarget(Gtarget, 1300) and self.selectedTar) then
        target = self.selectedTar
      end
      mousePos = GetMousePos()
    end
    function Viktor:Tick()
      self:Checks()
      self:Hasebuff()
      self:Antiafk()
      self:autolevel()
      self:skinhack()
      self:autopot()
      self:items()
      if(self.Config.combo.combokey:Value() )then
        self:combo()
      end
      if(self.Config.farm.clearkey.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
        self:LastHit()
      end
      if(self.Config.farm.clearkey.laneclearkey:Value())then
        self:LaneClear()
      end
      if(self.Config.farm.clearkey.jungleclearkey:Value())then
        self:JungleClear()
      end
      if(self.Config.killsteal.ks:Value() ) then
        self:killsteal()
      end
      if(self.Config.harass.harasskey:Value() or self.Config.harass.harasstogle:Value() ) then
        self:harass()
      end
      if self.Config.instruct:Value() then
        self.Config.instruct:Value(false)
        PopUp1 = true
      end
      self:checkothers()
    end
    function Viktor:CastQ(unit)
      if IsReady(_Q) then
        CastTargetSpell(unit, _Q)
      end
    end
    function Viktor:CastW(unit)
      if self.Config.pred.selectpred:Value() == 1 then
        local WPred = GetCircularAOEPrediction(unit, self.W)
        if IsReady(_W) then
          if WPred  and WPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopw:Value()/100) then
            CastSkillShot(_W, WPred.castPos)
          end
        end
      elseif  self.Config.pred.selectpred:Value() == 2 then
        if ipred then
          local HitChance, y = wSpell:Predict(unit)
          if IsReady(_W) and HitChance >= 3 then
            CastSkillShot(_W, y.x, y.y, y.z)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 3 then
        local wPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1350, 500, 700, 125, false, true)
        if IsReady(_W) and wPred.HitChance == 1 then
          CastSkillShot(_W, wPred.PredPos.x, wPred.PredPos.y, wPred.PredPos.z)
        end
      end
    end





    function Viktor:CastE(unit)
      if unit.dead or unit.health == 0 then
        return
      end
      if GetDistance(unit, myHero) > self.E.Range1-5 then
        EStartPos = CircleIntersection(myHero, unit, myHero, self.E.Range1-5)
      else
        EStartPos = Vector(unit.x, unit.y, unit.z)
      end
      local EPred = GetPrediction(unit, self.E)
      if IsReady(_E) then
        if EPred  and EPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcope:Value()/100)  then
          CastSkillShot3(_E,EStartPos, EPred.castPos)
        end
      end
    end
    function Viktor:CastR(unit)
      if self.Config.pred.selectpred:Value() == 1 then
        local WPred = GetPrediction(unit, self.W)
        if IsReady(_R) then
          if WPred  and WPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopr:Value()/100) then
            CastSkillShot(_R, WPred.castPos)
          end
        end
      elseif  self.Config.pred.selectpred:Value() == 2 then
        if ipred then
          local HitChance, y = rSpell:Predict(unit)
          if IsReady(_R) and HitChance >= 3 then
            CastSkillShot(_R, y.x, y.y, y.z)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 3 then
        local wPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1000, 250, 700, 650, false, true)
        if IsReady(_R) and eSpell.HitChance == 1 then
          CastSkillShot(_R, wPred.PredPos.x, wPred.PredPos.y, wPred.PredPos.z)
        end
      end
    end
    function Viktor:CastI(unit)
      local Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
      if Ignite then
        if IsReady(Ignite) then
          CastTargetSpell(unit, Ignite)
        end
      end
    end
    function Viktor:UpdateBuff(unit,buff)
      if unit and unit.isMe then
        if  buff.Name == "viktoreaug" then
          ebuff = true
        end
      end
    end
    function Viktor:Hasebuff()
      for i = 1, myHero.buffCount do
        local buff = myHero:getBuff(i)
        if BuffIsValid(buff) then
          if buff.name:lower():find("viktoreaug") then
            ebuff = true
          end
        end
      end
    end
    function Viktor:RemoveBuff(unit, buff)
      if unit and unit.isMe then
        if  buff.Name == "viktoreaug" then

          ebuff = false
        end
      end
    end
    function Viktor:Draw()
      if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 600,  self.Config.other.width.Qwidth:Value(),0,self.Config.other.color.Qcolor:Value())
      end

      if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 700,  self.Config.other.width.Wwidth:Value(),0, self.Config.other.color.Wcolor:Value())
      end

      if self.Config.other.draw.edraw:Value() and IsReady(_E) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 1200,  self.Config.other.width.Ewidth:Value(),0, self.Config.other.color.Ecolor:Value())
      end

      if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
        DrawCircle(myHero.x, myHero.y, myHero.z, 700, self.Config.other.width.Rwidth:Value(),0, self.Config.other.color.Rcolor:Value())
      end
      if self.Config.other.draw.aadraw:Value() then
        DrawCircle(myHero.x, myHero.y, myHero.z, 525, self.Config.other.width.AAwidth:Value(),0, self.Config.other.color.AAcolor:Value())
      end
      local rs = GetResolution()
      if PopUp1 then
        local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
        DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
        DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
        DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
        DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
        DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
        DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
        DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
        DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
        DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
        DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
        DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
        DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
        -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
        -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
        -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
        -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
        local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
        --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
        --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
        FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
        DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
      end

      for _, target in pairs(GetEnemyHeroes()) do
        if ValidTarget(target, 15000) then
          if target.visible and not target.dead and self.Config.other.damage:Value() then
            currLine = 1
            -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
            DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
            currLine = currLine + 1
            DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
          end
        end
      end

      if self.Config.other.targetcal:Value() and not myHero.dead then
        if target and target ~= nil then
          --  local target= GetOrigin(target)
          local drawpos=WorldToScreen(1,target.x, target.y, target.z)
          local comboText,color = self:GetDraws(target)
          if comboText then
            DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
          end
        end
      end
    end
    function Viktor:alwaysr()
      if (IsReady(_R) and (myHero.mana / myHero.maxMana > self.Config.combo.Mana:Value() /100 ) and self.Config.combo.useR:Value() and self.Config.combo.combokey:Value() and GetDistance(target)<700 ) then
        self:CastR(target)
      end
    end
    function Viktor:needr()
      if (IsReady(_R) and (myHero.mana / myHero.maxMana > self.Config.combo.Mana:Value() /100 ) and self.Config.combo.useR:Value() and self.Config.combo.combokey:Value() and GetDistance(target)<700 ) then
        local damagewithr =self:GetRDmg(target)+self:GetQDmg(target) +self:GetEDmg(target)
        local damagewithnor = self:GetQDmg(target) +self:GetEDmg(target)
        local health=target.health
        if(health<damagewithr )then
          self:CastR(target)
        end
      end
    end
    function Viktor:killr()
      if (IsReady(_R) and (myHero.mana / myHero.maxMana > self.Config.combo.Mana:Value() /100 ) and self.Config.combo.useR:Value() and self.Config.combo.combokey:Value() and GetDistance(target)<700 ) then
        local dmgR =self:GetRDmg(target)
        local health=target.health
        if(health<dmgR )then
          self:CastR(target)
        end
      end
    end
    function Viktor:ProcessSpell(unit, spell)
       if GetObjectType(unit) == Obj_AI_Hero and GetTeam(unit) ~= GetTeam(myHero) and IsReady(_R) then
      if CHANELLING_SPELLS[spell.name] then
        if ValidTarget(unit, self.R.range) and GetObjectName(unit) == CHANELLING_SPELLS[spell.name].Name and  self.Config.misc.interrupt[GetObjectName(unit).."Inter"]:Value() and self.Config.misc.interrupt.r:Value() then 
         self:CastR(unit)
        end
      end
    end
       if GetObjectType(unit) == Obj_AI_Hero and GetTeam(unit) ~= GetTeam(myHero) and IsReady(_W) then
      if CHANELLING_SPELLS[spell.name] then
        if ValidTarget(unit, 1000) and GetObjectName(unit) == CHANELLING_SPELLS[spell.name].Name and  self.Config.misc.interrupt[GetObjectName(unit).."Inter"]:Value() and self.Config.misc.interrupt.w:Value() then 
         self:CastW(unit)
        end
      end
    end
    end
    function Viktor:combo()
      if((IsReady(_Q) and (myHero.mana / myHero.maxMana > self.Config.combo.Mana:Value() /100 )and GetDistance(target) < 600  and self.Config.combo.useQ:Value() and self.Config.combo.combokey:Value()  )) then
        self:CastQ(target)
      end
      if((IsReady(_E) and (myHero.mana / myHero.maxMana > self.Config.combo.Mana:Value() /100 )and GetDistance(target) < 1200 and self.Config.combo.useE:Value() and self.Config.combo.combokey:Value()  ))then
        self:CastE(target)
      end
      if((IsReady(_W) and (myHero.mana / myHero.maxMana > self.Config.combo.Mana:Value() /100 ) and GetDistance(target) < 700 and self.Config.combo.useW:Value() and  self.Config.combo.combokey:Value()  ))then
        self:CastW(target)
      end
      if self.Config.combo.logic:Value() == 1 then
        self:killr()
      elseif self.Config.combo.logic:Value() == 2 then
        self:needr()
      elseif self.Config.combo.logic:Value() == 3 then
        self:alwaysr()
      end

      if(self.Config.combo.useI:Value() and self.Config.combo.combokey:Value() )then
        for _, unit in pairs(GetEnemyHeroes()) do
          local dmgI =(50+ ((myHero.level)*20))
          local health=unit.health
          if(health<dmgI and self.Config.combo.useI:Value() and GetDistance(unit)<600)then
            self:CastI(unit)
          end
        end
      end
    end
    function Viktor:killsteal()
      for _, unit in pairs(GetEnemyHeroes()) do
        local health = unit.health
        local dmgE = self:GetEDmg(unit)
        if(GetDistance(unit)<1200 and  IsReady(_E) and health<dmgE and self.Config.killsteal.useE:Value() and GetDistance(unit)<700   and self.Config.killsteal.ks:Value())then
          self:CastE(unit)
        end
        local dmgQ = self:GetQDmg(unit)
        if(GetDistance(unit)<600 and  IsReady(_Q) and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
          self:CastQ(unit)
        end
        local dmgI =(50+ ((myHero.level)*20))
        if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<600)then
          self:CastI(unit)
        end
        local dmgR =self:GetRDmg(unit)
        if(GetDistance(unit)<700 and  IsReady(_R) and health<dmgR and self.Config.killsteal.useR:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<700)then
          self:CastR(unit)
        end
      end
    end
    function Viktor:GetQDmg(target)
      if GetCastLevel(myHero, _Q) < 1 then
        return 0
      end
      if IsReady(_Q) then
        local FinalDamage = (20 + (GetCastLevel(myHero, _Q) * 20)  +(GetBonusAP(myHero)*.2) + (GetBonusAP(myHero)*.5))
        return CalcDamage(myHero,target, 0,FinalDamage)
      else
        return 0
      end
    end
    function Viktor:GetQ2Dmg(target)
      if GetCastLevel(myHero, _Q) < 1 then
        return 0
      end
      if IsReady(_Q) then
        local FinalDamage = (20 + (GetCastLevel(myHero, _Q) * 20) + (GetBonusAP(myHero)*.2))
        return CalcDamage(myHero,target, 0,FinalDamage)
      else
        return 0
      end
    end
    function Viktor:GetEDmg(target)
      if GetCastLevel(myHero, _E) < 1 then
        return 0
      end
      if not ebuff and IsReady(_E) then
        local FinalDamage = (25 + (GetCastLevel(myHero, _E) * 45) + (GetBonusAP(myHero)*.7))
        return CalcDamage(myHero,target, 0,FinalDamage)
      elseif ebuff and IsReady(_E) then
        local FinalDamage =(25 + (GetCastLevel(myHero, _E) * 45) + (GetBonusAP(myHero)*.7)) + (25 + (GetCastLevel(myHero, _E) * 45) + (GetBonusAP(myHero)*.7))*0.4
        return CalcDamage(myHero,target, 0,FinalDamage)
      else
        return 0
      end
    end
    function Viktor:GetRDmg(target)
      if GetCastLevel(myHero, _R) < 1 then
        return 0
      end
      if IsReady(_R) then
        local Rdamage = (50 + (GetCastLevel(myHero, _R) * 100) + (GetBonusAP(myHero)*.55))
        local persecond = ( 14*(GetCastLevel(myHero, _R) * 15) + (GetBonusAP(myHero)*.1))
        local FinalDamage = Rdamage + persecond
        return CalcDamage(myHero,target, 0,FinalDamage)
      else
        return 0
      end
    end
    function Viktor:GetMyDmg(target)
      if IsReady(_Q) and IsReady(_R) and IsReady(_E) then
        return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
      elseif IsReady(_Q)  and IsReady(_R) then
        return self:GetQDmg(target) + self:GetRDmg(target)
      elseif IsReady(_Q)  and IsReady(_E) then
        return self:GetQDmg(target) + self:GetEDmg(target)
      elseif IsReady(_R) and IsReady(_E) then
        return self:GetRDmg(target) +self:GetEDmg(target)
      elseif IsReady(_Q) then
        return self:GetQDmg(target)
      elseif IsReady(_E) then
        return self:GetEDmg(target)
      elseif IsReady(_R) then
        return self:GetRDmg(target)
      elseif IsReady(_Q) and IsReady(_R) then
        return self:GetQDmg(target) + self:GetRDmg(target)
      else
        return 0
      end
    end
    function Viktor:GetDraws(target)
      local qdamage = self:GetQDmg(target)
      local edamage = self:GetEDmg(target)
      local rdamage = self:GetRDmg(target)
      local Idmg=(50+ ((myHero.level)*20))

      if qdamage >target.health then
        return 'Q', GoS.White
      elseif qdamage+ Idmg>target.health then
        return 'Q + Ignite', GoS.White
      elseif edamage >target.health then
        return 'E', GoS.White
      elseif edamage + Idmg>target.health then
        return 'E + Ignite', GoS.White
      elseif rdamage  >target.health then
        return 'R', GoS.White
      elseif rdamage + Idmg>target.health then
        return 'R + Ignite', GoS.White
      elseif rdamage +edamage  >target.health then
        return 'R + E',GoS.White
      elseif rdamage +edamage+ Idmg>target.health then
        return 'R + E + Ignite',GoS.White
      elseif qdamage+edamage>target.health then
        return 'Q + E',GoS.White
      elseif qdamage+rdamage >target.health then
        return 'Q + R',GoS.White
      elseif qdamage+edamage+ Idmg>target.health then
        return 'Q + E + Ignite',GoS.White
      elseif qdamage+rdamage+ Idmg>target.health then
        return 'Q + R + Ignite',GoS.White
      elseif qdamage+edamage+rdamage >target.health then
        return 'Kill with full combo',GoS.White
      elseif qdamage+edamage+rdamage+ Idmg>target.health then
        return 'Full Combo + Ignite',GoS.White
      else
        return "Cant Kill yet", GoS.White
      end
    end
    function Viktor:harass()
      if self.Config.harass.harasskey:Value() or self.Config.harass.harasstogle:Value()  then
        if(IsReady(_Q) and (myHero.mana / myHero.maxMana > self.Config.harass.Mana:Value() /100 ) and GetDistance(target) <= 700 and self.Config.harass.useQ:Value() ) then
          self:CastQ(target)
        end
        if(IsReady(_E) and (myHero.mana / myHero.maxMana > self.Config.harass.Mana:Value() /100 ) and GetDistance(target) <= 1200 and self.Config.harass.useE:Value()  and ValidTarget(target, self.ERange)) then
          self:CastE(target)
        end

      end
    end
    function Viktor:LastHit()
      for _, target in pairs(minionManager.objects) do
        -- print (self:GetEDmg(target))
        if IsObjectAlive(target) and GetTeam(target) == MINION_ENEMY then
          if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
            local Qdamage = self:GetQDmg(target)
            if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.QMana:Value() /100 ) and ValidTarget(target,700)   and Qdamage >= GetCurrentHP(target)) then
              self:CastQ(target)
            end
            local Edamage = self:GetEDmg(target)
            if(IsReady(_E)and self.Config.farm.lasthit.useE:Value() and (myHero.mana / myHero.maxMana >=  self.Config.farm.lasthit.EMana:Value() /100 )and  ValidTarget(target,925) and Edamage >= GetCurrentHP(target)) then
              self:CastE(target)
            end
          end
        end
      end
    end
    function Viktor:LaneClear()
      for i, minion in pairs(minionManager.objects) do
        if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_ENEMY then
          if self.Config.farm.laneclear.useQ:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.QMana:Value() /100 ) and GetDistance(minion) <= 700 then
            self:CastQ(minion)
          end
        end
      end
      if (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.EMana:Value() /100 ) then
        local NumberOfHits = self.Config.farm.laneclear.ecount:Value()
        if IsReady(_E) then
          if  self.Config.farm.laneclear.useE:Value()   then
            local BestPos, BestHit =  GetLineFarmPosition(1000 ,180, MINION_ENEMY)
            if BestPos   and  BestHit >= NumberOfHits then
              EStartPos = Vector(myHero) - 475 * (Vector(myHero) - Vector(BestPos)):normalized()
              CastSkillShot3(_E,EStartPos, BestPos)
            end
          end
        end
      end
    end
    function Viktor:JungleClear()
      for i, minion in pairs(minionManager.objects) do
        if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_JUNGLE then
          if self.Config.farm.jungleclear.useQ:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.QMana:Value() /100 ) and GetDistance(minion) <= 700 then
            self:CastQ(minion)
          end
        end
      end
      if (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.EMana:Value() /100 ) then
        local NumberOfHits = 1
        if IsReady(_E) then
          if  self.Config.farm.jungleclear.useE:Value()   then
            local BestPos, BestHit =  GetLineFarmPosition(1000 ,180, MINION_JUNGLE)
            if BestPos   and  BestHit >= NumberOfHits then
              EStartPos = Vector(myHero) - 475 * (Vector(myHero) - Vector(BestPos)):normalized()
              CastSkillShot3(_E,EStartPos, BestPos)
            end
          end
        end
      end
    end
    function Viktor:WndMsg(Msg, Key)
      if self.Config.targetsel.ts:Value() then
        if Msg == WM_LBUTTONDOWN then
          local minD = 10
          local starget = nil
          for i, enemy in ipairs(GetEnemyHeroes()) do
            if ValidTarget(enemy) then
              if GetDistance(enemy, mousePos) <= minD or starget == nil then
                minD = GetDistance(enemy, mousePos)
                starget = enemy
              end
            end
          end
          if starget and minD < 150 then
            if self.selectedTar and starget.charName == self.selectedTar.charName then
              self.selectedTar = nil
              print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            else
              self.selectedTar = starget
              print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            end
          end
        end
      end
      if Msg == WM_LBUTTONDOWN then
        if PopUp1 then
          PopUp1 = false
        end
      end
    end
    function Viktor:onload()
      self:findorb()
    end
    function Viktor:LoadMenu()
      self.Config=MenuConfig( "menu",""..Scriptname.." [" .. myHero.charName.."]")


      self.Config:Menu("combo",loc_eng[1])
      self.Config.combo:Key("combokey", loc_eng[81], 32)
      self.Config.combo:Boolean("useQ", loc_eng[2], true)
      self.Config.combo:Boolean("useW", loc_eng[3], true)
      self.Config.combo:Boolean("useE", loc_eng[4], true)
      self.Config.combo:Boolean("useR", loc_eng[5], true)
      self.Config.combo:Boolean("useI", loc_eng[6], true)
      self.Config.combo:DropDown("logic", loc_eng[159],1, {loc_eng[160],loc_eng[217],loc_eng[172] })
      self.Config.combo:Slider("Mana",loc_eng[8], 10, 10, 100, 1)


      self.Config:Menu( "harass",loc_eng[9])
      self.Config.harass:Key("harasskey", loc_eng[83], string.byte("C"))
      self.Config.harass:Key("harasstogle", loc_eng[164],string.byte("T"))
      self.Config.harass:Boolean("useQ", loc_eng[10], true)
      self.Config.harass:Boolean("useE", loc_eng[12], true)
      self.Config.harass:Slider("Mana",loc_eng[8], 30, 10, 100, 1)

      self.Config:Menu( "farm",loc_eng[14])

      self.Config.farm:Menu("laneclear",loc_eng[15])
      self.Config.farm.laneclear:Boolean("useQ",loc_eng[16],true)
      self.Config.farm.laneclear:Boolean("useE",loc_eng[18],true)
      self.Config.farm.laneclear:Slider("ecount",loc_eng[182], 2, 1, 10, 1)
      self.Config.farm.laneclear:Info("blank", "")
      self.Config.farm.laneclear:Info("blank", "")
      self.Config.farm.laneclear:Info("info2", loc_eng[184])
      self.Config.farm.laneclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
      self.Config.farm.laneclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)
      self.Config.farm.laneclear:Slider("EMana",loc_eng[187], 30, 10, 100, 1)


      self.Config.farm:Menu("jungleclear",loc_eng[20])
      self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21],true)
      self.Config.farm.jungleclear:Boolean("useE",loc_eng[23],true)
      self.Config.farm.jungleclear:Info("blank", "")
      self.Config.farm.jungleclear:Info("blank", "")
      self.Config.farm.jungleclear:Info("info2", loc_eng[184])
      self.Config.farm.jungleclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
      self.Config.farm.jungleclear:Slider("EMana",loc_eng[187], 30, 10, 100, 1)

      self.Config.farm:Menu("lasthit",loc_eng[25])
      self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189],false)
      self.Config.farm.lasthit:Boolean("useQ",loc_eng[26],true)
      self.Config.farm.lasthit:Boolean("useE",loc_eng[28],false)
      self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191], 1, {loc_eng[172],loc_eng[174]})
      self.Config.farm.lasthit:Info("blank", "")
      self.Config.farm.lasthit:Info("info2", loc_eng[184])
      self.Config.farm.lasthit:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
      self.Config.farm.lasthit:Slider("EMana",loc_eng[186], 30, 10, 100, 1)

      self.Config.farm:Menu("clearkey",loc_eng[218])
      self.Config.farm.clearkey:Key("lasthitkey",loc_eng[215], string.byte("X"))
      self.Config.farm.clearkey:Key("laneclearkey", loc_eng[85], string.byte("V"))
      self.Config.farm.clearkey:Key("jungleclearkey", loc_eng[86],  string.byte("V"))

      self.Config:Menu( "killsteal",loc_eng[35])
      self.Config.killsteal:Boolean("ks",loc_eng[36],true)
      self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
      self.Config.killsteal:Boolean("useW", loc_eng[38], true)
      self.Config.killsteal:Boolean("useE", loc_eng[39], true)
      self.Config.killsteal:Boolean("useR", loc_eng[40], true)
      self.Config.killsteal:Boolean("useI", loc_eng[41], true)


      self.Config:Menu( "item",loc_eng[42])
      self.Config.item:Menu( "autopot",loc_eng[192])
      self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
      self.Config.item.autopot:Slider("autopothp", loc_eng[194],  10, 0, 100, 1)
      self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
      self.Config.item:Slider("autozhonya", loc_eng[44],  10, 0, 100, 1)
      self.Config.item:Boolean("usehg", loc_eng[45], false)
      self.Config.item:Boolean("usebg", loc_eng[46], false)

      self.Config:Menu( "misc",loc_eng[92])
      self.Config.misc:Menu( "gapClose",loc_eng[219])
      self.Config.misc.gapClose:Boolean("w", loc_eng[220], true)
      self.Config.misc.gapClose:Info("info3", loc_eng[98] )
      self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
      self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
      self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
      self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
      self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
      self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
      self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
      self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)
      self.Config.misc:Menu( "interrupt",loc_eng[93])
      self.Config.misc.interrupt:Boolean("r", loc_eng[97], true)
      self.Config.misc.interrupt:Boolean("w", loc_eng[95],  true)
      self.Config.misc.interrupt:Info("info3", loc_eng[98] )
DelayAction(function()
  local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
  for i, spell in pairs(CHANELLING_SPELLS) do
    for _,k in pairs(GetEnemyHeroes()) do
        if spell["Name"] == GetObjectName(k) then
        self.Config.misc.interrupt:Boolean(GetObjectName(k).."Inter", "On "..GetObjectName(k).." "..(type(spell.Spellslot) == 'number' and str[spell.Spellslot]), true)
        end
    end
  end
end, 0.35)
      Clock = os.clock()


      self.Config:Menu("other",loc_eng[65])
      --self.Config.other:Menu("Show Damage On Hp Bar", "HPBAR")
      --self.Config.other.HPBAR:Boolean("key","ON/OFF",true)
      self.Config.other:Menu("draw",loc_eng[66])
      self.Config.other.draw:Boolean("qdraw",loc_eng[67],true)
      self.Config.other.draw:Boolean("wdraw",loc_eng[68],true)
      self.Config.other.draw:Boolean("edraw",loc_eng[69],true)
      self.Config.other.draw:Boolean("rdraw",loc_eng[70],true)
      self.Config.other.draw:Boolean("aadraw",loc_eng[71],false)
      self.Config.other:Menu( "color",loc_eng[198])
      self.Config.other.color:ColorPick("Qcolor", loc_eng[199],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("Wcolor", loc_eng[200],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("Ecolor", loc_eng[201],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("Rcolor", loc_eng[202],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("E2color", loc_eng[203],{255, 255, 255, 255})
      self.Config.other.color:ColorPick("AAcolor", loc_eng[204],{255, 255,0,0})
      -- self.Config.other.color:ColorPick("targetselect", loc_eng[205],{255, 255,0,0})
      self.Config.other:Menu( "width",loc_eng[206])
      self.Config.other.width:Slider("Qwidth", loc_eng[210], 1, 1, 10, 1)
      self.Config.other.width:Slider("Wwidth", loc_eng[211], 1, 1, 10, 1)
      self.Config.other.width:Slider("Ewidth", loc_eng[212], 1, 1, 10, 1)
      self.Config.other.width:Slider("Rwidth", loc_eng[213], 1, 1, 10, 1)
      self.Config.other.width:Slider("AAwidth", loc_eng[209], 1, 1, 10, 1)
      -- self.Config.other.width:Slider("STwidth", loc_eng[208], 1, 1, 10, 1)
      --self.Config.other:Menu( "perma",loc_eng[73])
      -- self.Config.other.perma:Boolean("perma",loc_eng[74],true)
      self.Config.other:Boolean("target",loc_eng[75],true)
      self.Config.other:Boolean("damage",loc_eng[214],true)
      self.Config.other:Boolean("targetcal",loc_eng[76],true)

      self.Config:Menu("targetsel",loc_eng[77])
      self.Config.targetsel:Boolean("ts",loc_eng[78], false)

      self.Config:Menu("orb","Orbwalker Settings")
      self.Config.orb:Menu( "selectorb","Current Orbwalker :")

      self.Config:Menu("pred","Prediction Settings")
      self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
      self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
      self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
      self.Config.pred.hcgeneral.hcop:Slider("hcopw", "W Hitchance " , 60, 0, 100, 1)
      self.Config.pred.hcgeneral.hcop:Slider("hcope", "E Hitchance " , 60, 0, 100, 1)
      self.Config.pred.hcgeneral.hcop:Slider("hcopr", "r Hitchance " , 60, 0, 100, 1)
      self.Config.pred:Info("blank", "    Currently Open Prediction "   )
      self.Config.pred:Info("blank", "      is best with this bundle"   )


      self.Config:Info("infoK","           "..Scriptname.."" )
      self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
      self.Config:Info("infoK","   Script was made by  "..Author.. "" )
      self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
      self.Config:Boolean("instruct", loc_eng[216], false)

    end
    ---//==================================================\\---
    --|| > Viktor Extras                  ||--
    ---\\==================================================//---
    function Viktor:Antiafk()
      if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
      Clock = os.clock() + math.random(60,120)
      MoveToXYZ(myHeroPos())
    end
    function Viktor:skinhack()
      if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
        lastTimeTickCalled = CurrentTimeInMillis()
        if  self.Config.misc.skinhack.useskin:Value() then
          if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
            lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
            HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
          end
        end
      end
    end
    local spellLevel = 0
    function Viktor:autolevel()
      if GetLevelPoints(myHero) >= 1 then
        if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =   { _Q,_E,_E,_W,_E,_R,_E,_Q,_E,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
      end
    end
    lastPotion = 0
    function Viktor:autopot()
      if os.clock() - lastPotion < 15 then return end
      for SLOT = ITEM_1, ITEM_6 do
        if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
          if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
            CastSpell(SLOT)
            lastPotion = os.clock()
          end
        end
      end
    end
    function Viktor:items()
      if self.Config.item.usebg:Value() and self.Config.combo.combokey:Value() then
        for _ = ITEM_1, ITEM_7 do
          if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
        end
      end
    end
    if self.Config.item.usehg:Value() and self.Config.combo.combokey:Value() then
      for _ = ITEM_1, ITEM_7 do
        if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastTargetSpell(target, _)
      end
    end
  end
  if self.Config.item.enableautozhonya:Value() then
    for _ = ITEM_1, ITEM_7 do
      if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya:Value() / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
    end
  end
end
end

class "Yasuo"
local hase = false
local estack = {}
local rangeQ = false
local espin = false
local knockedup = 0
local startTime = 0
local egap = false
function Yasuo:__init()
self.Q = { delay = 0.25, speed = math.huge ,width = 40, range = 475  } --aoe false, Col false, lınear
self.Q3 = { delay = 0.25, speed = 1200 ,width = 120, range = 900 } --aoe false, Col false, lınear
self.W = { range = 400  }
self.E = { range = 475 }
self.R = { range = 1200  }
Last_LevelSpell = 0
self.tsg = TargetSelector(1300,TARGET_LESS_CAST_PRIORITY,DAMAGE_PHYSICAL,true,false)
if ipred then
  q3Spell = IPrediction.Prediction({range = 900, speed =  math.huge, delay = 0.25, width = 120, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
  qSpell = IPrediction.Prediction({range = 475, speed = math.huge, delay = 0.25, width = 40, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
end
Callback.Add("Tick", function() self:Tick() end)
Callback.Add("Load", function() self:onload() end)
Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
Callback.Add("Draw", function() self:Draw() end)
Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)
Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
Callback.Add("CreateObj", function(obj) self:CreateObj(obj) end)
Callback.Add("DeleteObj", function(obj) self:DeleteObj(obj) end)
--Callback.Add("SpellCast", function(castProc) self:SpellCast(castProc) end)
self:LoadMenu()
end
function Yasuo:onload()
self:findorb()
end
function Yasuo:LoadMenu()
self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )
self.Config:Menu("combo",loc_eng[1])
self.Config.combo:Boolean("useQ", loc_eng[2], true)
self.Config.combo:Boolean("useQ3", "Use Q3 in combo", true)
self.Config.combo:Boolean("useE", loc_eng[4], true)
self.Config.combo:Boolean("useR", loc_eng[5], true)
self.Config.combo:Slider("minr","Minimum Enemy for using R"   , 1, 1, 5, 1)
self.Config.combo:Boolean("useI", loc_eng[6], true)

self.Config:Menu( "harass",loc_eng[9])
self.Config.harass:Boolean("useQ", loc_eng[10], true)
self.Config.harass:Boolean("useQ3", " Harass With Q3", true)
self.Config.harass:Boolean("useQ3a", " Auto Harass With Q3", false)

self.Config:Menu( "farm",loc_eng[14])

self.Config.farm:Menu("laneclear",loc_eng[15])
self.Config.farm.laneclear:Boolean("useQ",loc_eng[16], true)
self.Config.farm.laneclear:Boolean("useQ3","Use Q3 on Laneclear", true)
self.Config.farm.laneclear:Slider("q3count","Minimum minion to Q3 >" , 2, 1, 10, 1)
self.Config.farm.laneclear:Boolean("useE",loc_eng[18], true)
self.Config.farm.laneclear:DropDown("elogic","E logic for Laneclear",   2, {"Always Use","Only for lasthit"})


self.Config.farm:Menu("jungleclear",loc_eng[20])
self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21], true)
self.Config.farm.jungleclear:Boolean("useQ3","Use Q3 on JungleClear", true)
self.Config.farm.jungleclear:Boolean("useE",loc_eng[23], true)


self.Config.farm:Menu("lasthit",loc_eng[25])
self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189], false)
self.Config.farm.lasthit:Boolean("useQ",loc_eng[26], true)
self.Config.farm.lasthit:Boolean("useE",loc_eng[28], true)
self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191],   1, {loc_eng[172],loc_eng[174]})

self.Config:Menu("escape",loc_eng[30])
self.Config.escape:Boolean("useE",loc_eng[33], true)


self.Config:Menu("killsteal",loc_eng[35])
self.Config.killsteal:Boolean("ks",loc_eng[36], true)
self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
self.Config.killsteal:Boolean("useQ3", "Steal With Q3", true)
self.Config.killsteal:Boolean("useE", loc_eng[39], true)
self.Config.killsteal:Boolean("useI", loc_eng[41], true)

self.Config:Menu( "item",loc_eng[42])
self.Config.item:Menu( "autopot",loc_eng[192])
self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
self.Config.item.autopot:Slider("autopothp", loc_eng[194] , 10, 0, 100, 1)
self.Config.item:Menu( "tiamat","Tiamat Settings")
self.Config.item.tiamat:Boolean("usetiac", "Use Tiamat in combo",  false)
self.Config.item.tiamat:Boolean("usetiacl", "Use Tiamat in clear",  false)
self.Config.item.tiamat:DropDown("tiamatlogic","Tiamat logic for clear",   1, {"Always","Depends on Minion Count"})
self.Config.item.tiamat:Slider("mintia","Minimum Minion to Tiamat"   , 1, 1, 6, 1)
self.Config.item:Menu( "Rhydra","Ravenous Hydra Settings")
self.Config.item.Rhydra:Boolean("userhc", "Use Ravenous Hydra in combo ",  false)
self.Config.item.Rhydra:Boolean("userhcl", "Use Ravenous Hydra in clear ",  false)
self.Config.item.Rhydra:DropDown("Rhydralogic","Ravenous Hydra logic for clear",   1, {"Always","Depends on Minion Count"})
self.Config.item.Rhydra:Slider("minrhydra","Minimum Minion to Ravenous Hydra"   , 1, 1, 6, 1)
self.Config.item:Menu( "thydra","Titanic Hydra Settings")
self.Config.item.thydra:Boolean("useth", "Use Titanic Hydra in combo",  false)
self.Config.item.thydra:Boolean("usethl", "Use Titanic Hydra in clear",  false)
self.Config.item.thydra:DropDown("Thydralogic","Titanic Hydra logic for clear",   1, {"Always","Depends on Minion Count"})
self.Config.item.thydra:Slider("minthydra","Minimum Minion to Titanic Hydra"   , 1, 1, 6, 1)
self.Config.item:Menu( "bg","Bilgewater Settings")
self.Config.item.bg:Boolean("usebg", loc_eng[46],  false)
self.Config.item:Menu( "btk","Blade of the Ruined King Settings")
self.Config.item.btk:Boolean("usebtk", "Use Blade of the Ruined King",  false)
self.Config.item:Menu( "randuin","Randuin's Omen Settings")
self.Config.item.randuin:Boolean("userand", "Use Randuin's Omen",  false)
self.Config.item.randuin:Slider("minrand","Minimum Enemy to Randuin's Omen"   , 1, 1, 5, 1)
self.Config.item:Menu( "qss","QSS settings")
self.Config.item.qss:Boolean("useqss", "Use QSS",  false)

self.Config:Menu( "misc",loc_eng[92])
self.Config.misc:Menu( "autowall","[" .. myHero.charName.. "] - Auto Wall Settings")
self.Config.misc.autowall:Boolean("useW", "Use Auto Wall", true)
self.Config.misc.autowall:Info("blank", "> Skillshots"   )
DelayAction(function()  for i = 1, heroManager.iCount,1 do
  local hero = heroManager:getHero(i)
  if hero.team ~= myHero.team then
    if Champions[hero.charName] ~= nil then
      for index, skillshot in pairs(Champions[hero.charName].skillshots) do
        if skillshot.blockable == true then
          self.Config.misc.autowall:Boolean(skillshot.spellName, hero.charName .. " - " .. skillshot.name, true)
        end
      end
    end
  end
end
end, 0.2)

self.Config.misc:Menu( "autoulti","[" .. myHero.charName.. "] - Auto Ulti Settings")
self.Config.misc.autoulti:Boolean("useR", "Use Auto R", true)
self.Config.misc.autoulti:Slider("minr", "Minimum enemy to auto R" , 3, 1, 5, 1)
self.Config.misc.autoulti:Info("blank", ""   )
self.Config.misc.autoulti:Info("blank", "> Advanced Settings"   )
self.Config.misc.autoulti:Boolean("checkhp", "Check our health", true)
self.Config.misc.autoulti:Slider("checkhpslider", "Only use R if our health >% " , 40, 0, 100, 1)

self.Config.misc:Menu( "turretdive","[" .. myHero.charName.. "] - Turret Dive Settings")
self.Config.misc.turretdive:Boolean("use", "Use Turret Dive Settings", true)
self.Config.misc.turretdive:DropDown("turretdivelogic","Turret Dive Mode",   1, {"Normal Mode","Krystra Mode"})
self.Config.misc.turretdive:Boolean("Drawturret", "Draw Turret Range", false)
self.Config.misc.turretdive:Info("blank", ""   )
self.Config.misc.turretdive:Info("blank", "Normal Mode Settings >"   )
self.Config.misc.turretdive:Slider("normalmode", "Minimum Number of Ally Minions" , 3, 1, 8, 1)
self.Config.misc.turretdive:Slider("health", "Do not dive if my health > % ", 30, 0, 100, 1)
self.Config.misc.turretdive:Info("blank", ""   )
self.Config.misc.turretdive:Info("blank", "Krystra Mode Settings >"   )
self.Config.misc.turretdive:Slider("krystramode", "Minimum Number of Ally Minions" , 3, 1, 8, 1)
self.Config.misc.turretdive:Slider("krystramode2", "Minimum Number of Ally Champions" , 2, 1, 4, 1)
self.Config.misc.turretdive:Slider("health1", "Do not dive if my health > % ", 30, 0, 100, 1)

self.Config.misc:Menu( "Gapclose","[" .. myHero.charName.. "] - Gap Close Settings")
self.Config.misc.Gapclose:Boolean("UseEGap", "Use E to GapClose", true)
self.Config.misc.Gapclose:Slider("DistanceToE", "Min Distance for GapClose", 300, 300, 2000, 1)

self.Config.misc:Menu( "walljump","[" .. myHero.charName.. "] - Wall Jump Settings")
self.Config.misc.walljump:Boolean("Draw", "Draw Wall Jump Locations", true)
self.Config.misc.walljump:Boolean("Drawr", "Use Range While Drawing", false)
self.Config.misc.walljump:Slider("Drawrrange", "Draw Locations If Range >" , 10, 1000, 10000, 1)
self.Config.misc.walljump:Info("blank", ""   )
self.Config.misc.walljump:Info("blank", "        [Color Settings]"   )
self.Config.misc.walljump:ColorPick("fcolor", "Location Color",   {255, 255, 255, 255})
--self.Config.misc.walljump:ColorPick("f2color", "Location 2 Color",   {255, 255, 255, 255})
--self.Config.misc.walljump:DropDown("walljumplogic","Priority to gain vision",   1, {"Ward","Wall"})

self.Config.misc:Menu( "interrupt",loc_eng[93])
self.Config.misc.interrupt:Boolean("r", "Interrupt with Q3 Skill", true)
self.Config.misc.interrupt:Info("info3", loc_eng[98])
DelayAction(function()
  local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
  for i, spell in pairs(CHANELLING_SPELLS) do
    for _,k in pairs(GetEnemyHeroes()) do
        if spell["Name"] == GetObjectName(k) then
        self.Config.misc.interrupt:Boolean(GetObjectName(k).."Inter", "On "..GetObjectName(k).." "..(type(spell.Spellslot) == 'number' and str[spell.Spellslot]), true)
        end
    end
  end
end, 0.35)
self.Config.misc:Menu( "autoq","[" .. myHero.charName.. "] - Auto Q Settings")
self.Config.misc.autoq:Boolean("useQ", "Use Auto Q to minion ( Stack )", false)
self.Config.misc.autoq:DropDown("autoqlogic","Auto Q Logic",   1, {"Always use","Only if enemy away"})

self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)

Clock = os.clock()


self.Config:Menu("other",loc_eng[65])
self.Config.other:Menu( "draw",loc_eng[66])
self.Config.other.draw:Boolean("qdraw",loc_eng[67], true)
self.Config.other.draw:Boolean("wdraw",loc_eng[68], true)
self.Config.other.draw:Boolean("q3draw","Q3 Skill Drawings", true)
self.Config.other.draw:Boolean("edraw",loc_eng[69], true)
self.Config.other.draw:Boolean("rdraw",loc_eng[70], true)
self.Config.other.draw:Boolean("aadraw",loc_eng[71], false)
--self.Config.other.draw:Boolean("rtdraw",loc_eng[197], false)
self.Config.other:Menu( "color", loc_eng[198])
self.Config.other.color:ColorPick("Qcolor", loc_eng[199],   {255, 255, 255, 255})
self.Config.other.color:ColorPick("Wcolor", loc_eng[200],   {255, 255, 255, 255})
self.Config.other.color:ColorPick("Q3color", "Q3 Color",   {255, 255, 255, 255})
self.Config.other.color:ColorPick("Ecolor", loc_eng[201],   {255, 255, 255, 255})
self.Config.other.color:ColorPick("Rcolor", loc_eng[202],   {255, 255, 255, 255})
self.Config.other.color:ColorPick("AAcolor", loc_eng[204],   {255, 255,0,0})
-- self.Config.other.color:ColorPick("targetselect", loc_eng[205],   {255, 255,0,0})
-- self.Config.other:Boolean("target",loc_eng[75], true)
self.Config.other:Boolean("q3draw","Draw Remaining Q3 time", true)
self.Config.other:Boolean("damage",loc_eng[214], true)
self.Config.other:Boolean("targetcal",loc_eng[76], true)

self.Config:Menu("targetsel",loc_eng[77])
self.Config.targetsel:Boolean("ts",loc_eng[78], true)


self.Config:Menu("hum","Humanizer Settings")
self.Config.hum:Info("blank", " > R Skillshot Humanizer"   )
self.Config.hum:Boolean("userc","Humanizer for combo", false)
self.Config.hum:DropDown("dtcombo","Delay Type :",   1, {"Use Constant Delay","Use Random Delay"})
self.Config.hum:Slider("delayrc", "Delay for Combo Mode" , 200, 1, 650, 1)
self.Config.hum:Boolean("usera","Humanizer for Auto Ulti", false)
self.Config.hum:DropDown("dtauto","Delay Type :",   1, {"Use Constant Delay","Use Random Delay"})
self.Config.hum:Slider("delayra", "Delay for Auto Ulti" , 200, 1, 650, 1)
self.Config.hum:Info("blank", ""   )
self.Config.hum:Info("blank", "> Windwall Humanizer"   )
self.Config.hum:Boolean("useR", "Use Humanizer", false)
self.Config.hum:DropDown("dtwall","Delay Type :",   1, {"Use Constant Delay","Use Random Delay"})
self.Config.hum:Slider("delay", "Set delay for auto wall" , 200, 1, 500, 1)


self.Config:Menu("orb","Orbwalker Settings")
self.Config.orb:Menu( "selectorb","Current Orbwalker :")

self.Config:Menu("pred","Prediction Settings")
self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
self.Config.pred.hcgeneral.hcop:Slider("hcopq", "Q Hitchance " , 30, 0, 100, 1)
self.Config.pred.hcgeneral.hcop:Slider("hcopq3", "Q3 Hitchance " , 30, 0, 100, 1)
self.Config.pred:Info("blank", "    Currently Open Prediction "   )
self.Config.pred:Info("blank", "      is best with this bundle"   )


self.Config:Menu( "Keys",loc_eng[79])
self.Config.Keys:Info("infoK3", loc_eng[80]   )
self.Config.Keys:Key("combokey", loc_eng[81], string.byte(" "))
self.Config.Keys:Key("onlye", loc_eng[128], string.byte("O"))
self.Config.Keys:Key("combomode", loc_eng[129],  string.byte("2"))
self.Config.Keys:Info("infoK4", loc_eng[82]   )
self.Config.Keys:Key("harasskey", loc_eng[83],    string.byte("C"))
-- self.Config.Keys:Boolean("harasstoglekey", "Harass Togle Key",, string.byte("T"))
self.Config.Keys:Info("infoK5", loc_eng[84]   )
self.Config.Keys:Key("lasthitkey",loc_eng[215],    string.byte("X"))
self.Config.Keys:Key("laneclearkey", loc_eng[85],    string.byte("V"))
self.Config.Keys:Key("jungleclearkey", loc_eng[86],    string.byte("V"))
--self.Config.Keys:Boolean("lasthitkey", "Lasthit Key",    string.byte("X"))
self.Config.Keys:Info("infoK6", loc_eng[87]   )
self.Config.Keys:Key("escapekey", loc_eng[88],    string.byte("Y"))
self.Config.Keys:Key("wallkey", "Wall Jump Key",    string.byte("T"))
self.Config.Keys:Info("infoK", "Make Sure That Your Orbwalker"   )
self.Config.Keys:Info("infoK2", loc_eng[89]   )

--self.Config:Boolean("lang", loc_eng[165]    1, {loc_eng[166], loc_eng[167],loc_eng[168]})
self.Config:Boolean("instruct", loc_eng[216], false)
self.Config:Info("infoK","              [ Script Info ]" )
self.Config:Info("infoK",""..Scriptname.."" )
self.Config:Info("infoK","Script Version:  "..Version.. "  " )
self.Config:Info("infoK","Script was made by  "..Author.. "" )
self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )

end
function Yasuo:UpdateBuff(unit,buff)
if unit and unit.isMe and buff and buff.Name == "YasuoDashScalar" then
  estack[GetNetworkID(unit)] = buff.Count
end
if unit and unit.team == myHero.team and unit.type == myHero.type then
  if buff.Name == "YasuoQ3W" then
    rangeQ = true
    startTime = os.clock() + 10
  end
end
end
function Yasuo:RemoveBuff(unit,buff)
if unit and unit.isMe and buff and buff.Name == "YasuoDashScalar" then
  estack[GetNetworkID(unit)] = 0
end
if unit and unit.team == myHero.team and unit.type == myHero.type then
  if buff.Name == "YasuoQ3W" then
    rangeQ = false
  end
end

function Yasuo:Hasebuff(target)
  for i = 1, target.buffCount do
    local buff = target:getBuff(i)
    if BuffIsValid(buff) then
      if buff.name:lower():find("YasuoDashWrapper") then
        hase = true
      end
    end
  end
end
end
function Yasuo:getstacks(unit)
return (estack[GetNetworkID(unit)] or 0)
end
function Yasuo:divelogic(unit)
if not self.Config.misc.turretdive.use:Value() then
  return true
end

if UnderTurret(unit, true) then
  for _, turret in pairs(GetTurrets()) do
    if turret and turret.team ~= myHero.team and GetDistance(turret,myHero) <=1200 then
      if self.Config.misc.turretdive.turretdivelogic:Value() == 1 then
        if MinionsAround(turret, 950, MINION_ALLY) >=self.Config.misc.turretdive.normalmode:Value() and (myHero.health / myHero.maxHealth >= self.Config.misc.turretdive.health:Value() /100 ) then
          return true
        else return false
        end
      elseif  self.Config.misc.turretdive.turretdivelogic:Value() == 2  then
        if MinionsAround(turret, 950, MINION_ALLY) >=self.Config.misc.turretdive.krystramode:Value() and AlliesAround(turret, 950)>=self.Config.misc.turretdive.krystramode2:Value() and (myHero.health / myHero.maxHealth >= self.Config.misc.turretdive.health:Value() /100 ) then
          return true
        else return false
        end
      end
    end
  end
else
  return true
end
end
function Yasuo:Draw()
if self.Config.misc.walljump.Draw:Value()then
  if self.Config.misc.walljump.Drawr:Value() then
    for k, v in pairs(yasuospot) do
      if GetDistance(v, myHero) < self.Config.misc.walljump.Drawrrange:Value() then
        DrawCircle(v.x, v.y, v.z, 100,1,0,self.Config.misc.walljump.fcolor:Value())
      end
    end
    for k, v in pairs(yasuospotend) do
      if GetDistance(v, myHero) < self.Config.misc.walljump.Drawrrange:Value() then
        -- DrawCircle(v.x, v.y, v.z, 100,1,0, self.Config.misc.walljump.f2color:Value())
      end
    end
  elseif not self.Config.misc.walljump.Drawr:Value() then
    for k, v in pairs(yasuospot) do
      DrawCircle(v.x, v.y, v.z, 100,1,0,self.Config.misc.walljump.fcolor:Value())
    end
    for k, v in pairs(yasuospotend) do
      -- DrawCircle(v.x, v.y, v.z, 100,1,0, self.Config.misc.walljump.f2color:Value())
    end
  end
end
if self.Config.misc.turretdive.Drawturret:Value() then
  for _, i in pairs(GetTurrets()) do
    if i and i.team ~= myHero.team then
      if mPos3D(myHero.x, myHero.z, i.x, i.z, 950) then
        DrawCircle(i.x, i.y, i.z, i.range ,1,0, 0xFFFF0000)
      else
        DrawCircle(i.x, i.y, i.z, i.range ,1,0, GoS.White)
      end
    end
  end
end
if not q3ready then
  if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
    DrawCircle(myHero.x, myHero.y, myHero.z, 475,1,0,self.Config.other.color.Qcolor:Value())
  end
elseif  q3ready then
  if self.Config.other.draw.q3draw:Value() and IsReady(_Q) then
    DrawCircle(myHero.x, myHero.y, myHero.z, 900,1,0,self.Config.other.color.Q3color:Value())
  end
end


if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
  DrawCircle(myHero.x, myHero.y, myHero.z, 400,1,0,self.Config.other.color.Wcolor:Value())
end

if self.Config.other.draw.edraw:Value() and IsReady(_E) then
  DrawCircle(myHero.x, myHero.y, myHero.z, 475,1,0,self.Config.other.color.Ecolor:Value())
end

if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
  DrawCircle(myHero.x, myHero.y, myHero.z, 1200,1,0,self.Config.other.color.Rcolor:Value())
end
if self.Config.other.draw.aadraw:Value() then
  DrawCircle(myHero.x, myHero.y, myHero.z, 175,1,0, self.Config.other.color.AAcolor:Value())
end

for _, target in pairs(GetEnemyHeroes()) do
  if ValidTarget(target, 15000) then
    if target.visible and not target.dead and self.Config.other.damage:Value() then
      currLine = 1
      -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
      DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
      currLine = currLine + 1
      DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
    end
  end
end
if self.Config.other.targetcal:Value() and not myHero.dead then
  if target and target ~= nil then
    --  local target= GetOrigin(target)
    local drawpos=WorldToScreen(1,target.x, target.y, target.z)
    local comboText,color = self:GetDraws(target)
    if comboText then
      DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
    end
  end
end
if  GetCastName(myHero,_Q)  == "YasuoQ3W"  then
  if  self.Config.other.q3draw:Value() and not myHero.dead then
    local drawpos=WorldToScreen(1,myHero.x, myHero.y, myHero.z)
    DrawText("Storm Duration :"..math.round(startTime - os.clock(), 2).."s",15,drawpos.x,drawpos.y,GoS.White)
  end
end
local rs = GetResolution()
if PopUp1 then
  local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
  DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
  DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
  DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
  DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
  DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
  DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
  DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
  DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
  DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
  DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
  DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
  DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
  -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
  -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
  -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
  -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
  local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
  --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
  --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
  FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
  DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
end
end
---//==================================================\\---
--|| > Yasuo Tick                         ||--
---\\==================================================//---
function Yasuo:Checks()
Gtarget = self.tsg:GetTarget()
if not ValidTarget(Gtarget, 925) or not self.Config.targetsel.ts:Value()  then
  target = GetCurrentTarget()
elseif  ValidTarget(Gtarget, 925) and not self.selectedTar then
  target = GetCurrentTarget()
elseif (ValidTarget(Gtarget, 925) and self.selectedTar) then
  target = self.selectedTar
end
q3ready = GetCastName(myHero,_Q)  == "YasuoQ3W"
mousePos = GetMousePos()
Tia = GetItemSlot(myHero,3077) > 0 and GetItemSlot(myHero,3077) or nil
Rhyd = GetItemSlot(myHero,3074) > 0 and GetItemSlot(myHero,3074) or nil
Thyd = GetItemSlot(myHero,3053) > 0 and GetItemSlot(myHero,3053) or nil
Btk = GetItemSlot(myHero,3153) > 0 and GetItemSlot(myHero,3153) or nil
Rand = GetItemSlot(myHero,3143) > 0 and GetItemSlot(myHero,3143) or nil
Qss = GetItemSlot(myHero,3140) > 0 and GetItemSlot(myHero,3140) or GetItemSlot(myHero,3139) > 0 and GetItemSlot(myHero,3139) or nil
end
function Yasuo:Tick()
self:Checks()
self:Antiafk()
if( self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
  self:LastHit()
end
if(self.Config.Keys.jungleclearkey:Value() )then
  self:JungleClear()
end
if(self.Config.Keys.laneclearkey:Value() )then
  self:LaneClear()
end
self:autolevel()
self:skinhack()
self:autopot()
self:items()
if self.Config.Keys.escapekey:Value() then
  self:escape()
end
if self.Config.Keys.wallkey:Value() then
  self:walljump()
end
if self.Config.harass.useQ3a:Value() then
  self:autoharass()
end
if self:divelogic(target) == true then
  if self.Config.Keys.combokey:Value() then
    self:Combo()
  end
  self:autoR()
end
if self.Config.Keys.harasskey:Value() then
  self:harass()
end
if self.Config.killsteal.ks:Value() then
  self:killsteal()
end
if self.Config.instruct:Value() then
  self.Config.instruct:Value(false)
  PopUp1 = true
end
self:checkothers()
if self.Config.misc.autoq.useQ:Value() then
  self:autoQ()
end
end
function Yasuo:autoQ()
if  GetCastName(myHero,_Q)  == "YasuoQ3W"  then return end
for i, minion in pairs(minionManager.objects) do
  if  GetTeam(minion) == MINION_ENEMY then
    if ValidTarget(minion) and minion ~= nil then
      if IsReady(_Q) then
        if self.Config.misc.autoq.autoqlogic:Value() == 1 then
          if  self.Config.farm.laneclear.useQ:Value()  and GetDistance(minion) <= 475 then
            self:CastQ(minion)
          end
        elseif self.Config.misc.autoq.autoqlogic:Value() == 2 then
          if not IsInDistance(target,900) then
            if  self.Config.farm.laneclear.useQ:Value()  and GetDistance(minion) <= 475 then
              self:CastQ(minion)
            end
          end
        end
      end
    end
  end
end
end
function Yasuo:autoR()
--if self:divelogic(target) == false then return end
if self.Config.misc.autoulti.useR:Value() then
  if(GetDistance(target) <= self.R.range  and IsReady(_R))then
    if self.Config.misc.autoulti.checkhp:Value() then
      if (myHero.health / myHero.maxHealth >= self.Config.misc.autoulti.checkhpslider:Value() /100 ) then
        if knockedup >=  self.Config.misc.autoulti.minr:Value() then
          if self.Config.hum.usera:Value() then
            if self.Config.hum.dtauto:Value() == 1 then
              DelayAction(function ()  self:CastR() end, self.Config.hum.delayra:Value()/1000)
            elseif self.Config.hum.dtauto:Value() == 2 then
              DelayAction(function ()  self:CastR() end,  math.random(0.200,0.650))
            end
          end
          if not self.Config.hum.usera:Value() then
            self:CastR()

          end
        end
      end
    end
  end
end
if self.Config.misc.autoulti.useR:Value() then
  if(GetDistance(target) <= self.R.range  and IsReady(_R))then
    if knockedup >=  self.Config.misc.autoulti.minr:Value() then
      if self.Config.hum.usera:Value() then
        if self.Config.hum.dtauto:Value() == 1 then
          DelayAction(function ()  self:CastR() end, self.Config.hum.delayra:Value()/1000)
        elseif self.Config.hum.dtauto:Value() == 2 then
          DelayAction(function ()  self:CastR() end,  math.random(0.200,0.650))
        end
      end
      if not self.Config.hum.usera:Value() then
        self:CastR()

      end
    end
  end
end
end
function Yasuo:autoharass()
if(GetDistance(target) <= self.Q3.range and self.Config.harass.useQ3:Value() and IsReady(_Q) ) then
  self:CastQ3(target)
end
end
function Yasuo:harass()
if  GetCastName(myHero,_Q)  == "YasuoQ3W"  then
  if(GetDistance(target) <= self.Q3.range and self.Config.harass.useQ3:Value()  and IsReady(_Q))then
    self:CastQ3(target)
  end
else
  if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value()  and IsReady(_Q))then
    self:CastQ(target)
  end
end
end

function Yasuo:Combo()
if  GetCastName(myHero,_Q)  == "YasuoQ3W"  then
  if(GetDistance(target) <= self.Q3.range and self.Config.combo.useQ3:Value()  and  not egap  and IsReady(_Q))then
    self:CastQ3(target)
  end
else
  if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value()  and IsReady(_Q))then
    self:CastQ(target)
  end
end
if(GetDistance(target) <= self.E.range  and self.Config.combo.useE:Value()   and IsReady(_E))then
  self:CastE(target)
end
if self.Config.combo.useR:Value() then
  if(GetDistance(target) <= self.R.range  and IsReady(_R))then
    if knockedup >= self.Config.combo.minr:Value() then
      if self.Config.hum.userc:Value() then
        if self.Config.hum.dtcombo:Value() == 1 then
          DelayAction(function ()  self:CastR() end, self.Config.hum.delayrc:Value()/1000)
        elseif  self.Config.hum.dtcombo:Value() == 2 then
          DelayAction(function ()  self:CastR() end,  math.random(0.200,0.650))
        end
      end
      if not self.Config.hum.userc:Value() then
        self:CastR()
      end
    end
  end
end
self:egap(target)
if(self.Config.combo.useI:Value() and self.Config.Keys.combokey:Value()  )then
  for _, unit in pairs(GetEnemyHeroes()) do
    local dmgI =(50+ ((myHero.level)*20))
    local health=unit.health
    if(health<dmgI and self.Config.combo.useI:Value() and GetDistance(unit)<600)then
      self:CastI(unit)
    end
  end
end
end
function Yasuo:egap(unit)
local TargetDistance = GetDistance(unit)
if self.Config.misc.Gapclose.UseEGap:Value() then
  if TargetDistance >= self.Config.misc.Gapclose.DistanceToE:Value() then
    -- mPos = ClosestMinion(unit,MINION_ENEMY)
    mPos= self:getNearestMinion(unit)
    if IsReady(_E) and mPos then
      CastTargetSpell(mPos, _E)
          egap = true
          DelayAction(function ()   egap = false end, 1)
    end
  end
end
end
function Yasuo:killsteal()
-- if self:divelogic(target) == false then return end
for _, unit in pairs(GetEnemyHeroes()) do
  local health = unit.health
  local dmgE = self:GetEDmg(unit)
  if(GetDistance(target) <= self.E.range and  IsReady(_E) and health<dmgE and self.Config.killsteal.useE:Value()   and self.Config.killsteal.ks:Value())then
    self:CastE(unit)
  end
  local dmgQ = self:GetQDmg(unit)
  if(GetDistance(target) <= self.Q.range and  IsReady(_Q) and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
    self:CastQ(unit)
  end
  local dmgQ3 =self:GetQDmg(unit)
  if  GetCastName(myHero,_Q)  == "YasuoQ3W"  then
    if(GetDistance(target) <= self.Q3.range and  IsReady(_R) and health<dmgQ3 and self.Config.killsteal.useQ3:Value() and self.Config.killsteal.ks:Value())then
      self:CastQ3(unit)
    end
  end
  local dmgI =(50+ ((GetLevel(myHero))*20))
  if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<600)then
    self:CastI(unit)
  end
end
end
function Yasuo:escape()
if self.Config.Keys.escapekey:Value()  then
  mPos = self:getNearestMinion(mousePos)
  if self.Config.escape.useE:Value()  then
    if  IsReady(_E) and mPos then
      CastTargetSpell(mPos, _E)
    else
      MoveToXYZ(mousePos)
    end
  end
end
end
function Yasuo:walljump()
for k, loc in pairs(yasuospot) do
  if GetDistance(loc, myHero) < 250 and GetDistance(loc, myHero) > 50  then
    MoveToXYZ(loc.x, loc.y, loc.z)
  end
  if GetDistance(loc, myHero) < 50 and IsReady(_W)  then
    CastSkillShot(_W, yasuospotend[k].x,yasuospotend[k].y, yasuospotend[k].z)
  end
end
for i, minion in pairs(minionManager.objects) do
  if ValidTarget(minion) and minion ~= nil and GetTeam(minion) == MINION_JUNGLE then
    if IsReady(_E) and not IsReady(_W)  then
      self:CastE(minion)
    end
  end
end
end
function Yasuo:CastQ(unit)
if self.Config.pred.selectpred:Value() == 1 then
  local QPred = GetPrediction(unit, self.Q)
  if IsReady(_Q) then
    if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100) then
      CastSkillShot(_Q, QPred.castPos)
    end
  end
elseif self.Config.pred.selectpred:Value() == 2 then
  if ipred then
    local HitChance, y = qSpell:Predict(unit)
    if IsReady(_Q) and HitChance >= 3 then
      CastSkillShot(_Q, y.x, y.y, y.z)
    end
  end
elseif self.Config.pred.selectpred:Value() == 3 then
  local qPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), math.huge, 250, 475, 40, false, true)
  if IsReady(_Q) and qPred.HitChance == 1 then
    CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
  end
end
end
function Yasuo:CastQ3(unit)
if GetCastName(myHero,_Q)  == "YasuoQ3W"  then
  if self.Config.pred.selectpred:Value() == 1 then
    local QPred = GetPrediction(unit, self.Q3)
    if IsReady(_Q) then
      if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq3:Value()/100) then
        CastSkillShot(_Q, QPred.castPos)
      end
    end
  elseif self.Config.pred.selectpred:Value() == 2 then
    if ipred then
      local HitChance, y = q3Spell:Predict(unit)
      if IsReady(_Q) and HitChance >= 3 then
        CastSkillShot(_Q, y.x, y.y, y.z)
      end
    end
  elseif self.Config.pred.selectpred:Value() == 3 then
    local qPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), math.huge, 250, 900, 120, false, true)
    if IsReady(_Q) and qPred.HitChance == 1 then
      CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
    end
  end
end
end
function Yasuo:CastE(unit)
if IsReady(_E) then
  CastTargetSpell(unit, _E)
end
end
function Yasuo:CastR(unit)
if IsReady(_R) then
  CastSpell(_R)
end
end
function Yasuo:CastI(unit)
local Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
if Ignite then
  if IsReady(Ignite) then
    CastTargetSpell(unit, Ignite)
  end
end
end
function Yasuo:CreateObj(obj)
if not obj then return end
if obj and (obj.name=="Yasuo_base_R_indicator_beam.troy" or obj.name=="Yasuo_Skin02_R_indicator_beam.troy") then
  knockedup = knockedup + 1
end
end

function Yasuo:DeleteObj(obj)
if not obj then return end
if obj and (obj.name=="Yasuo_base_R_indicator_beam.troy" or obj.name=="Yasuo_Skin02_R_indicator_beam.troy") then
  knockedup = knockedup - 1
end
end

function Yasuo:LaneClear()
for i, minion in pairs(minionManager.objects) do
  if  GetTeam(minion) == MINION_ENEMY then
    if ValidTarget(minion) and minion ~= nil then
      if IsReady(_Q) then
        if  self.Config.farm.laneclear.useQ:Value()  and GetDistance(minion) <= 475 then
          self:CastQ(minion)
        end
      end
      if not UnderTurret(self:eEndPos(minion), true) then
        if self.Config.farm.laneclear.elogic:Value() == 1 then
          if  self.Config.farm.laneclear.useE:Value() and IsReady(_E) and GetDistance(minion) <= 475 then
            self:CastE(minion)
          end
        elseif self.Config.farm.laneclear.elogic:Value() == 2 then
          local edmg = self:GetEDmg(minion)
          if  self.Config.farm.laneclear.useE:Value() and IsReady(_E) and GetDistance(minion) <= 475 and edmg >= minion.health then
            self:CastE(minion)
          end
        end
      end
    end
  end
end
if GetCastName(myHero,_Q)  == "YasuoQ3W"  then
  local NumberOfHits = self.Config.farm.laneclear.q3count:Value()
  if IsReady(_Q) then
    if  self.Config.farm.laneclear.useQ3:Value()   then
      local BestPos, BestHit =  GetLineFarmPosition(self.Q3.range, self.Q3.width, MINION_ENEMY)
      if BestPos   and  BestHit >= NumberOfHits then
        CastSkillShot(_Q, BestPos)
      end
    end
  end
end

end


function Yasuo:LastHit()
for _, target in pairs(minionManager.objects) do
  if GetTeam(target) == MINION_ENEMY then
    if IsObjectAlive(target) then
      if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
        local Qdamage = self:GetQDmg(target)
        if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and ValidTarget(target,475)   and Qdamage >= GetCurrentHP(target)) then
          self:CastQ(target)
        end
        local Edamage = self:GetEDmg(target)
        if(IsReady(_E)and self.Config.farm.lasthit.useE:Value() and  ValidTarget(target,475) and Edamage >= GetCurrentHP(target)) then
          self:CastE(target)
        end
      end
    end
  end
end
end
function Yasuo:JungleClear()
for i, minion in pairs(minionManager.objects) do
  if  GetTeam(minion) == MINION_JUNGLE then
    if ValidTarget(minion) and minion ~= nil then
      if IsReady(_Q) then
        if  self.Config.farm.jungleclear.useQ:Value()  and GetDistance(minion) <= 475 then
          self:CastQ(minion)
        end
      end
      if IsReady(_E) then
        if  self.Config.farm.jungleclear.useE:Value()  and GetDistance(minion) <= 475 then
          self:CastE(minion)
        end
      end
    end
  end
end
if GetCastName(myHero,_Q)  == "YasuoQ3W"  then
  if IsReady(_Q) then
    if  self.Config.farm.jungleclear.useQ3:Value()   then
      local BestPos, BestHit =  GetLineFarmPosition(self.Q3.range, self.Q3.width, MINION_JUNGLE)
      if BestPos   and  BestHit >= 1 then
        CastSkillShot(_Q, BestPos)
      end
    end
  end
end
end



function Yasuo:GetQDmg(target)
if GetCastLevel(myHero, _Q)< 1 then
  return 0
end
if IsReady(_Q) then
  local FinalDamage = ((GetCastLevel(myHero, _Q)* 20) + (myHero.totalDamage) )
  return CalcDamage(myHero,target, FinalDamage,0)
else
  return 0
end
end
function Yasuo:GetEDmg(target)
local elvl = GetCastLevel(myHero, _E)
if GetCastLevel(myHero, _E) < 1 then
  return 0
end
if IsReady(_E) then
  if self:getstacks(myHero) == 0 then
    basedamage = {70, 90, 110, 130, 150}
  elseif self:getstacks(myHero) == 1 then
    basedamage = {87.5, 112.5, 137.5, 142.5, 187.5}
  elseif self:getstacks(myHero) == 2 then
    basedamage = {105, 135, 165, 195, 225}
  end
  local FinalDamage =((basedamage[elvl] + (GetBonusAP(myHero))* .6))
  return CalcDamage(myHero,target,0, FinalDamage)
else
  return 0
end
end
function Yasuo:GetRDmg(target)
if GetCastLevel(myHero, _R) < 1 then
  return 0
end
if IsReady(_R) then
  local FinalDamage = (100+ (GetCastLevel(myHero, _R)) + (myHero.totalDamage)*1.5 )
  return CalcDamage(myHero,target, FinalDamage,0)
else
  return 0
end
end
function Yasuo:GetMyDmg(target)
if IsReady(_Q) and IsReady(_R) and IsReady(_E) then
  return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
elseif IsReady(_Q)  and IsReady(_E) then
  return self:GetQDmg(target) + self:GetEDmg(target)
elseif IsReady(_R) and IsReady(_E) then
  return self:GetRDmg(target) +self:GetEDmg(target)
elseif IsReady(_Q) then
  return self:GetQDmg(target)
elseif IsReady(_E) then
  return self:GetEDmg(target)
elseif IsReady(_R) then
  return self:GetRDmg(target)
elseif IsReady(_Q) and IsReady(_R) then
  return self:GetQDmg(target) + self:GetRDmg(target)
else
  return 0
end
end
function Yasuo:GetDraws(target)
local qdamage = self:GetQDmg(target)
local edamage = self:GetEDmg(target)
local rdamage = self:GetRDmg(target)
local Idmg=(50+ ((myHero.level)*20))

if qdamage >target.health then
  return 'Q', GoS.White
elseif qdamage+ Idmg>target.health then
  return 'Q + Ignite', GoS.White
elseif edamage >target.health then
  return 'E', GoS.White
elseif edamage + Idmg>target.health then
  return 'E + Ignite', GoS.White
elseif rdamage  >target.health then
  return 'R', GoS.White
elseif rdamage + Idmg>target.health then
  return 'R + Ignite', GoS.White
elseif rdamage +edamage  >target.health then
  return 'R + E',GoS.White
elseif rdamage +edamage+ Idmg>target.health then
  return 'R + E + Ignite',GoS.White
elseif qdamage+edamage>target.health then
  return 'Q + E',GoS.White
elseif qdamage+rdamage >target.health then
  return 'Q + R',GoS.White
elseif qdamage+edamage+ Idmg>target.health then
  return 'Q + E + Ignite',GoS.White
elseif qdamage+rdamage+ Idmg>target.health then
  return 'Q + R + Ignite',GoS.White
elseif qdamage+edamage+rdamage >target.health then
  return 'Kill with full combo',GoS.White
elseif qdamage+edamage+rdamage+ Idmg>target.health then
  return 'Full Combo + Ignite',GoS.White
else
  return "Cant Kill yet", GoS.White
end
end
function Yasuo:ProcessSpell(unit, spell)
       if GetObjectType(unit) == Obj_AI_Hero and GetTeam(unit) ~= GetTeam(myHero) and q3ready then
      if CHANELLING_SPELLS[spell.name] then
        if ValidTarget(unit, 1000) and GetObjectName(unit) == CHANELLING_SPELLS[spell.name].Name and  self.Config.misc.interrupt[GetObjectName(unit).."Inter"]:Value() and self.Config.misc.interrupt.r:Value() then 
         self:CastQ3(unit)
        end
      end
    end
if  self.Config.misc.autowall.useW:Value() then

  if unit and unit ~= nil and spell then
    if unit.team ~= myHero.team and string.find(spell.name, "Basic") == nil then
      if Champions[unit.charName] ~= nil then
        skillshot = Champions[unit.charName].skillshots[spell.name]
        if  skillshot ~= nil and skillshot.blockable == true then
          range = skillshot.range
          if not spell.startPos then
            spell.startPos.x = unit.x
            spell.startPos.z = unit.z
          end
          if GetDistance(spell.startPos) <= range then
            if GetDistance(spell.endPos) <= 475 then
              if IsReady(_W) and self.Config.misc.autowall[spell.name]:Value() then
                if self.Config.hum.useR:Value() then
                  DelayAction(function ()
                  CastSkillShot(_W, unit.x,unit.y, unit.z)
                  end, self.Config.hum.delay:Value()/1000)
                elseif not self.Config.hum.useR:Value() then
                  CastSkillShot(_W, unit.x,unit.y, unit.z)
                end
              end
            end
          end
        end
      end
    end
  end
end
end
function Yasuo:getNearestMinion(unit)

local closestMinion = nil
local nearestDistance = 0

for index, minion in pairs(minionManager.objects) do
  if IsObjectAlive(minion) and GetTeam(minion) == MINION_ENEMY then
    if minion ~= nil and minion.valid and string.find(minion.name,"Minion_") == 1 and minion.team ~= myHero.team and minion.dead == false then
      if GetDistance(minion) <= self.E.range then
        if GetDistance(self:eEndPos(minion), unit) < GetDistance(unit) and nearestDistance < GetDistance(minion) then
          nearestDistance = GetDistance(minion)
          closestMinion = minion
        end
      end
    end
  end
end
for index, minion in pairs(minionManager.objects) do
  if IsObjectAlive(minion) and GetTeam(minion) == MINION_JUNGLE then
    if minion ~= nil and minion.valid and minion.dead == false then
      if GetDistance(minion) <= self.E.range then
        if GetDistance(self:eEndPos(minion), unit) < GetDistance(unit) and nearestDistance < GetDistance(minion) then
          nearestDistance = GetDistance(minion)
          closestMinion = minion
        end
      end
    end
  end
end
for i = 1, heroManager.iCount, 1 do
  local minion = heroManager:getHero(i)
  if ValidTarget(minion, self.E.range) then
    if GetDistance(minion) <= self.E.range then
      if GetDistance(self:eEndPos(minion), unit) < GetDistance(unit) and nearestDistance < GetDistance(minion) then
        nearestDistance = GetDistance(minion)
        closestMinion = minion
      end
    end
  end
end
return closestMinion
end
function Yasuo:eEndPos(unit)

if unit ~= nil then
  if GetDistance(myHero,unit) < 410 then
    dashPointT = myHero + (Vector(unit) - myHero):normalized() * 485
  else
    dashPointT = myHero + (Vector(unit) - myHero):normalized() * (GetDistance(myHero,unit) + 65)
  end
  return dashPointT
end
end

function Yasuo:Antiafk()
if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
Clock = os.clock() + math.random(60,120)
MoveToXYZ(myHeroPos())
end
function Yasuo:skinhack()
if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
  lastTimeTickCalled = CurrentTimeInMillis()
  if  self.Config.misc.skinhack.useskin:Value() then
    if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
      lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
      HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
    end
  end
end
end
local spellLevel = 0
function Yasuo:autolevel()
if GetLevelPoints(myHero) >= 1 then
  if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
    LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
    Last_LevelSpell = os.clock()
  end
  if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
    LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
    Last_LevelSpell = os.clock()
  end
  if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
    LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
    Last_LevelSpell = os.clock()
  end
  if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
    LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
    Last_LevelSpell = os.clock()
  end
  if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
    LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
    Last_LevelSpell = os.clock()
  end
  if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
    LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
    Last_LevelSpell = os.clock()
  end
  if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
    local levelSequence =   { _Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
    LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
    Last_LevelSpell = os.clock()
  end
end
end
lastPotion = 0
function Yasuo:autopot()
if os.clock() - lastPotion < 15 then return end
for SLOT = ITEM_1, ITEM_6 do
  if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
    if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
      CastSpell(SLOT)
      lastPotion = os.clock()
    end
  end
end
end
function Yasuo:items()

if self.Config.item.bg.usebg:Value() and self.Config.Keys.combokey:Value() then
  for _ = ITEM_1, ITEM_7 do
    if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
  end
end
end

if self.Config.item.tiamat.usetiac:Value() and self.Config.Keys.combokey:Value() then
if Tia and IsReady(Tia) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
  CastSpell(Tia)
end
end
if self.Config.item.tiamat.usetiacl:Value() and ( self.Config.Keys.laneclearkey:Value() or self.Config.Keys.jungleclearkey:Value() ) then
if Tia and IsReady(Tia) then
  if self.Config.item.tiamat.tiamatlogic:Value() == 1 and MinionsAround(myHero, 400, MINION_ENEMY) >=1 then
    CastSpell(Tia)
  elseif self.Config.item.tiamat.tiamatlogic:Value() == 2 then
    if MinionsAround(myHero, 400, MINION_ENEMY) >=self.Config.item.tiamat.mintia:Value() then
      CastSpell(Tia)
    end
  end
end
end

if self.Config.item.Rhydra.userhc:Value() and self.Config.Keys.combokey:Value() then
if Rhyd and IsReady(Rhyd) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
  CastSpell(Rhyd)
end
end
if self.Config.item.Rhydra.userhcl:Value() and ( self.Config.Keys.laneclearkey:Value() or self.Config.Keys.jungleclearkey:Value() ) then
if Rhyd and IsReady(Rhyd) then
  if self.Config.item.Rhydra.Rhydralogic:Value() == 1 and MinionsAround(myHero, 400, MINION_ENEMY) >=1  then
    CastSpell(Rhyd)
  elseif self.Config.item.Rhydra.Rhydralogic:Value() == 2 then
    if MinionsAround(myHero, 400 , MINION_ENEMY) >=self.Config.item.Rhydra.minrhydra:Value() then
      CastSpell(Rhyd)
    end
  end
end
end

if self.Config.item.thydra.useth:Value() and self.Config.Keys.combokey:Value() then
if Thyd and IsReady(Thyd) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
  CastSpell(Thyd)
end
end
if self.Config.item.thydra.usethl:Value() and ( self.Config.Keys.laneclearkey:Value() or self.Config.Keys.jungleclearkey:Value() ) then
if Thyd and IsReady(Thyd) then
  if self.Config.item.thydra.Thydralogic:Value() == 1 and MinionsAround(myHero, 400, MINION_ENEMY) >=1  then
    CastSpell(Thyd)
  elseif self.Config.item.thydra.Thydralogic:Value() == 2 then
    if MinionsAround(myHero, 400, MINION_ENEMY) >=self.Config.item.thydra.minthydra:Value() then
      CastSpell(Thyd)
    end
  end
end
end

if self.Config.item.btk.usebtk:Value()  and self.Config.Keys.combokey:Value() then
if Btk and IsReady(Btk) and ValidTarget(target, 550 ) then
  CastTargetSpell(target, Btk)
end
end


if self.Config.item.randuin.userand:Value()  and self.Config.Keys.combokey:Value() then
if Rand and IsReady(Rand) and EnemiesAround(myHero, 450 )>= self.Config.item.randuin.minrand:Value() then
  CastSpell(Rand)
end
end

end
function Yasuo:WndMsg(Msg, Key)
if self.Config.targetsel.ts:Value() then
if Msg == WM_LBUTTONDOWN then
  local minD = 10
  local starget = nil
  for i, enemy in ipairs(GetEnemyHeroes()) do
    if ValidTarget(enemy) then
      if GetDistance(enemy, mousePos) <= minD or starget == nil then
        minD = GetDistance(enemy, mousePos)
        starget = enemy
      end
    end
  end
  if starget and minD < 150 then
    if self.selectedTar and starget.charName == self.selectedTar.charName then
      self.selectedTar = nil
      print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
    else
      self.selectedTar = starget
      print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
    end
  end
end
end
if Msg == WM_LBUTTONDOWN then
if PopUp1 then
  PopUp1 = false
end
end
end
local ultused = false
local eStacks = false
local pickcard= false
class "TwistedFate"
function TwistedFate:__init()
  self.Q = { delay = 0.25, speed = 1000 ,radius = 40, range = 1450  }
    self.W = { delay = 0.25, speed = 1000 , range = 525  }
self.R = { range = 5500  }
Last_LevelSpell = 0
 Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
self.tsg = TargetSelector(1600,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
self.tshp = TargetSelector(1600,TARGET_LOW_HP_PRIORITY,DAMAGE_MAGIC,true,false)
self.ts1 = TargetSelector(525,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
if ipred then
qSpell = IPrediction.Prediction({range = 1450, speed = 1000, delay = 0.25, width = 40, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
end
global_ticks = 0
            self.blue ="BlueCardLock"
            self.yellow = "GoldCardLock"
          self.red = "RedCardLock"
Callback.Add("Tick", function() self:Tick() end)
Callback.Add("Load", function() self:onload() end)
Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
Callback.Add("Draw", function() self:Draw() end)
  Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
  Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)
Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
Callback.Add("CreateObj", function(obj) self:CreateObj(obj) end)
Callback.Add("DeleteObj", function(obj) self:DeleteObj(obj) end)
self:LoadMenu()
--AddGapcloseEvent(_Q, 900, false, self.Config.misc.gapClose1.gapClose1w)
end
 function TwistedFate:Checks()
                  Gtarget = self.tsg:GetTarget()
                   Hptarget = self.tshp:GetTarget()
                      Etarget = self.ts1:GetTarget()
  if not ValidTarget(Gtarget, 925) or not self.Config.targetsel.ts:Value()  then
    target = GetCurrentTarget()
  elseif  ValidTarget(Gtarget, 925) and not self.selectedTar then
    target = GetCurrentTarget()
  elseif (ValidTarget(Gtarget, 925) and self.selectedTar) then
    target = self.selectedTar
  end
                  mousePos = GetMousePos()
                end
function TwistedFate:Tick()
  self:Checks()
  self:Antiafk()
  self:autolevel()
   self:ulti()
  self:skinhack()
  self:autopot()
  self:autoq()
  self:items()
  self:escape()
  if self.Config.Keys.bluecard:Value() then
        self:CastW(self.blue)
      end
        if self.Config.Keys.redcard:Value() then
        self:CastW(self.red)
      end
        if self.Config.Keys.yellowcard:Value() then
        self:CastW(self.yellow)
      end
  if( self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
    self:LastHit()
  end
  if(self.Config.Keys.combokey:Value() )then
    self:Combo()
  end
  if(self.Config.Keys.harasskey:Value()   ) then
    self:harass()
  end
    if(self.Config.killsteal.ks:Value() ) then
    self:killsteal()
  end
    if(self.Config.Keys.laneclearkey:Value() )then
    self:LaneClear()
  end
  if(self.Config.Keys.jungleclearkey:Value() )then
    self:JungleClear()
  end
 if self.Config.instruct:Value() then
          self.Config.instruct:Value(false)
          PopUp1 = true
        end
          self:checkothers()
          self:blockaa()
  end
  function TwistedFate:CardUsed(spell)
 if myHero:GetSpellData(_W).name == spell then 
  return true 
else 
  return false
end
  end
  function TwistedFate:Combo()
    if not  (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value() /100 ) then return end

if self.Config.combo.card:Value() == 1 then
  combocard= "BlueCardLock"
  elseif self.Config.combo.card:Value() == 2 then
  combocard= "RedCardLock"
     elseif self.Config.combo.card:Value() == 3 then
  combocard= "GoldCardLock"
     end

   if( IsReady(_W) and  GetDistance(target) <= 850 and self.Config.combo.useW:Value()  )then
      if  self.Config.combo.useblue:Value() and (myHero.mana / myHero.maxMana <=  self.Config.combo.bluemana:Value() /100 )  then
                self:CastW(self.blue)
                 AttackUnit(Gtarget)  
            elseif not  self.Config.combo.useblue:Value() or (myHero.mana / myHero.maxMana  >=   self.Config.combo.bluemana:Value() /100 )  then
               self:CastW(combocard)
                 AttackUnit(Gtarget) 
             end
              end
if self.Config.combo.qmode:Value() == 1  then
  if ValidTarget(Gtarget,1600) and IsReady(_Q) and self.Config.combo.useQ:Value() then
    if IsImmobile(target) or (  CanUseSpell(myHero, _W) == ONCOOLDOWN and GetCastLevel(myHero, _W) >= 1) then
      self:CastQ(target)
    end
  end
  elseif self.Config.combo.qmode:Value() == 2 then
      if ValidTarget(Gtarget,1600) and IsReady(_Q) and self.Config.combo.useQ:Value() then
         if IsImmobile(target) then
             self:CastQ(target)
    end
  end
  elseif self.Config.combo.qmode:Value() == 3 then
    if IsReady(_Q) and self.Config.combo.useQ:Value() then
         self:CastQ(target)
       end
     end

  end
     function TwistedFate:ProcessSpell(unit, spell)
                 if unit.isMe and spell.name == "Gate" then 
                  ultused = true
                       DelayAction(function()   ultused = false end, 2)
                end

                      if GetObjectType(unit) == Obj_AI_Hero and GetTeam(unit) ~= GetTeam(myHero) and IsReady(_W) then
      if CHANELLING_SPELLS[spell.name] then
        if ValidTarget(unit, 1000) and GetObjectName(unit) == CHANELLING_SPELLS[spell.name].Name and  self.Config.misc.interrupt[GetObjectName(unit).."Inter"]:Value() and self.Config.misc.interrupt.r:Value() then 
                         self:CastW(self.yellow)
                              AttackUnit(unit) 
        end
      end
    end
               if unit.type == myHero.type and unit.team ~= myHero.team and isAGapcloserUnit[unit.charName] and GetDistance(unit) < 1000 and spell ~= nil then     
    if spell.name == (type(isAGapcloserUnit[unit.charName].spell) == 'number' and unit:GetSpellData(isAGapcloserUnit[unit.charName].spell).name or isAGapcloserUnit[unit.charName].spell) and self.Config.misc.gapClose1.gapClose1w[unit.charName] then
      if spell.target ~= nil and spell.target.name == myHero.name or isAGapcloserUnit[unit.charName].spell == 'blindmonkqtwo' then
           if self:CardUsed(self.yellow) == true then
                              AttackUnit(unit) 
      end
    end
  end
  end
                end
   function TwistedFate:LaneClear()
    if self.Config.farm.laneclear.card:Value() == 1 then
  lanecard= "BlueCardLock"
  elseif self.Config.farm.laneclear.card:Value() == 2 then
  lanecard= "RedCardLock"
     elseif self.Config.farm.laneclear.card:Value() == 3 then
  lanecard= "GoldCardLock"
     end
    if not ValidTarget(ClosestMinion(GetOrigin(myHero), MINION_ENEMY),  1000) then return end
 for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion, 1000)  and GetTeam(minion) == MINION_ENEMY then
                         if IsReady(_W) then
if self.Config.farm.laneclear.useW:Value() and (myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.WMana:Value() /100 ) then
          local Wpred = GetPrediction(minion, self.W)
  if MinionsAround(Wpred.castPos, 100, MINION_ENEMY) >=self.Config.farm.laneclear.reddis:Value() and self.Config.farm.laneclear.usered:Value() then
    if Wpred then
     self:CastW(self.red)
   end
else
   self:CastW(lanecard)
 end
end
end
end
end
                  if IsReady(_Q) then
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.QMana:Value() /100 ) then
                      local NumberOfHits = self.Config.farm.laneclear.qcount:Value()
                        if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useQ:Value()  then
                          local BestPos, BestHit = GetLineFarmPosition(self.Q.range, 40, MINION_ENEMY)
                          if BestPos  and BestHit >= NumberOfHits then
                            CastSkillShot(_Q, BestPos)
                          end
                        end
                      end
                    end
                  end
function TwistedFate:LastHit()
        if not ValidTarget(ClosestMinion(GetOrigin(myHero), MINION_ENEMY),  1000) then return end
      if self.Config.farm.lasthit.card:Value() == 1 then
  lasthitcard= "BlueCardLock"
  elseif self.Config.farm.lasthit.card:Value() == 2 then
  lasthitcard= "RedCardLock"
     elseif self.Config.farm.lasthit.card:Value() == 3 then
  lasthitcard= "GoldCardLock"
     end
for _, target in pairs(minionManager.objects) do
  if GetTeam(target) == MINION_ENEMY then
    if IsObjectAlive(target) then
      if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
            local Qdamage = self:GetQDmg(target)
        if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and ValidTarget(target,self.Q.range)   and Qdamage >= GetCurrentHP(target)) then
          self:CastQ(target)
        end
        local Wdamage = self:GetWDmg(target)
        if(IsReady(_W) and self.Config.farm.lasthit.useW:Value() and  ValidTarget(target,525) and (target.health / target.maxHealth < 40 /100 )) then
                    self:CastW(lasthitcard)
         if Wdamage >= GetCurrentHP(target) then
             AttackUnit(target)  
           end
        end
      end
    end
  end
end
end
function TwistedFate:JungleClear()
      if not ValidTarget(ClosestMinion(GetOrigin(myHero), MINION_JUNGLE),  1000) then return end
      if self.Config.farm.jungleclear.card:Value() == 1 then
  jlanecard= "BlueCardLock"
  elseif self.Config.farm.jungleclear.card:Value() == 2 then
  jlanecard= "RedCardLock"
     elseif self.Config.farm.jungleclear.card:Value() == 3 then
  jlanecard= "GoldCardLock"
     end
for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion, 1000)  and GetTeam(minion) ==  MINION_JUNGLE then
                         if IsReady(_W) then
if self.Config.farm.jungleclear.useW:Value() and (myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.WMana:Value() /100 ) then
          local Wpred = GetPrediction(minion, self.W)
  if MinionsAround(Wpred.castPos, 100, MINION_JUNGLE) >=self.Config.farm.jungleclear.reddis:Value() and self.Config.farm.jungleclear.usered:Value() then
    if Wpred then
     self:CastW(self.red)
   end
else
   self:CastW(lanecard)
 end
end
end
end
end
                  if IsReady(_Q) then
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.QMana:Value() /100 ) then
                      local NumberOfHits = 1
                        if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useQ:Value()  then
                          local BestPos, BestHit = GetLineFarmPosition(self.Q.range, 40,MINION_JUNGLE)
                          if BestPos  and BestHit >= NumberOfHits then
                            CastSkillShot(_Q, BestPos)
                          end
                        end
                      end
                    end
                  end
                          function TwistedFate:UpdateBuff(unit,buff)
                   if unit.isMe and buff.Name == "pickacard_tracker" then
                    pickcard= true
                  end
                  end
                  function TwistedFate:RemoveBuff(unit, buff)
                      if unit.isMe and buff.Name == "pickacard_tracker" then
                    pickcard= false
                  end
                  end
  function TwistedFate:CreateObj(obj)
if not obj then return end
  if obj and obj.name == "Cardmaster_stackready.troy" then
  eStacks = "Stacked"
  end
end

function TwistedFate:DeleteObj(obj)
if not obj then return end
  if obj and obj.name == "Cardmaster_stackready.troy" then
  eStacks = false
  end
end

    function TwistedFate:autoq()
      if not  self.Config.harass.useautoq:Value() then return end
               if ValidTarget(target,1450) and IsReady(_Q) and self.Config.harass.useQ:Value() and  (myHero.mana / myHero.maxMana >=  self.Config.harass.WMana:Value() /100 )  then
                      self:CastQ(target)
    end
    end
  function TwistedFate:harass()
    if self.Config.harass.card:Value() == 1 then
  harasscard= "BlueCardLock"
  elseif self.Config.harass.card:Value() == 2 then
  harasscard= "RedCardLock"
     elseif self.Config.harass.card:Value() == 3 then
  harasscard= "GoldCardLock"
     end
 if(IsReady(_W) and  GetDistance(target) <= 650 and self.Config.harass.useW:Value() and  (myHero.mana / myHero.maxMana >=  self.Config.harass.WMana:Value() /100 )  )then
                self:CastW(harasscard)
                  AttackUnit(Gtarget)  
              end

               if ValidTarget(target,1600) and IsReady(_Q) and self.Config.harass.useQ:Value() and  (myHero.mana / myHero.maxMana >=  self.Config.harass.QMana:Value() /100 )  then
                      self:CastQ(target)
    end
  end
    function TwistedFate:CastQ(unit)
              if self.Config.pred.selectpred:Value() == 1 then
                local QPred = GetLinearAOEPrediction(unit, self.Q)
                if IsReady(_Q) then
                  if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100) then
                    CastSkillShot(_Q, QPred.castPos)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 2 then
                if ipred then
                  local HitChance, y = qSpell:Predict(unit)
                  if IsReady(_Q) and HitChance >= 3 then
                    CastSkillShot(_Q, y.x, y.y, y.z)
                  end
                end
              elseif self.Config.pred.selectpred:Value() == 3 then
                local qPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1000, 250, 1450, 40, false, true)
                if IsReady(_Q) and qPred.HitChance == 1 then
                  CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
                end
              end
            end
              function TwistedFate:CastI(unit)
    if Ignite then
      if IsReady(Ignite) then
        CastTargetSpell(unit, Ignite)
      end
    end
  end
            function TwistedFate:CastW(spell)
               if IsReady(_W) then
                 if myHero:GetSpellData(_W).name == spell then
                CastSpell(_W)
              end
             if myHero:GetSpellData(_W).name == "PickACard"  then
                local Ticker = GetTickCount()
      if (global_ticks + 6000) < Ticker then
                   CastSpell(_W)
        global_ticks = Ticker
        DelayAction(function()   CastSpell(_W) end, 6)
      end
             end
            end
          end
           function TwistedFate:ulti()
            if self.Config.combo.UseR:Value() then
             if ultused then
     self:CastW(self.yellow)
    end
    if self.Config.combo.instaaa:Value() then
    if ultused and ValidTarget(Gtarget, 525) then
        AttackUnit(Gtarget)
      end
    end
           end
         end
          function TwistedFate:blockaa()
          if  self.Config.combo.blockaa:Value() then
            if pickcard then
              if DAC then
                DAC:AttacksEnabled(false)
                elseif IOW then
                  IOW.attacksEnabled= false
                end
              else
                   if DAC then
                DAC:AttacksEnabled(true)
                elseif IOW then
                  IOW.attacksEnabled = true
                end
end
end
end
                function TwistedFate:onload()
  self:findorb()
end
  function TwistedFate:Draw()
        if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 1450,  self.Config.other.width.Qwidth:Value(),0,self.Config.other.color.Qcolor:Value())
        end
        if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 5500, self.Config.other.width.Rwidth:Value(),0, self.Config.other.color.Rcolor:Value())
        end
        if self.Config.other.draw.aadraw:Value() then
          DrawCircle(myHero.x, myHero.y, myHero.z, 525, self.Config.other.width.AAwidth:Value(),0, self.Config.other.color.AAcolor:Value())
        end

        --[[if self.Config.other.minimap:Value() then
          if IsReady(_R) then
            DrawCircleMinimap(myHero.x, myHero.y, myHero.z, 5500, 1, 0, GoS.White)
          end
        end]]
      
          local rs = GetResolution()
          if PopUp1 then
            local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
            DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
            DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
            DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
            DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
            DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
            DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
            DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
            DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
            DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
            DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
            DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
            DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
            -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
            -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
            -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
            -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
            local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
            --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
            --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
            FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
            DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
          end
            for _, target in pairs(GetEnemyHeroes()) do
              if ValidTarget(target, 15000) then
                if target.visible and not target.dead and self.Config.other.damage:Value() then
                  currLine = 1
                  -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
                  DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
                  currLine = currLine + 1
                  DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
                end
              end
            end

            if self.Config.other.targetcal:Value() and not myHero.dead then
              if target and target ~= nil then
                --  local target= GetOrigin(target)
                local drawpos=WorldToScreen(1,target.x, target.y, target.z)
                local comboText,color = self:GetDraws(target)
                if comboText then
                  DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
                end
              end
            end
          end
           function TwistedFate:GetQDmg(target)
              if GetCastLevel(myHero, _Q) < 1 then
                return 0
              end
              if IsReady(_Q) then
                local FinalDamage = (15 + (GetCastLevel(myHero, _Q) * 45) + (GetBonusAP(myHero))*.65)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function TwistedFate:GetWDmg(target)
              if GetCastLevel(myHero, _W) < 1 then
                return 0
              end
                if self:CardUsed(self.blue) and IsReady(_W)  then
                local FinalDamage = (20 + (GetCastLevel(myHero, _W) * 20) + (GetBonusAP(myHero))* .5)+ (myHero.totalDamage) 
                return CalcDamage(myHero,target,0, FinalDamage)
              elseif self:CardUsed(self.red)and IsReady(_W)  then
                local FinalDamage = (15 + (GetCastLevel(myHero, _W) * 15) + (GetBonusAP(myHero))* .5)+ (myHero.totalDamage) 
                return CalcDamage(myHero,target,0, FinalDamage)
                   elseif self:CardUsed(self.red)and IsReady(_W)  then
                local FinalDamage = (7.5 + (GetCastLevel(myHero, _W) * 7.5) + (GetBonusAP(myHero))* .5)+ (myHero.totalDamage) 
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
                  function TwistedFate:GetW2Dmg(target)
              if GetCastLevel(myHero, _W) < 1 then
                return 0
              end
                if  IsReady(_W)  then
       local FinalDamage = (15 + (GetCastLevel(myHero, _W) * 15) + (GetBonusAP(myHero))* .5)+ (myHero.totalDamage) 
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function TwistedFate:GetEDmg(target)
              if GetCastLevel(myHero, _E) < 1 or not eStacks then
                return 0
              end
              if IsReady(_E) then
                local FinalDamage = (25 + (GetCastLevel(myHero, _E) * 45) + (GetBonusAP(myHero))* .6)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function TwistedFate:GetMyDmg(target)
            if IsReady(_Q) and IsReady(_W) and IsReady(_E) then
        return self:GetQDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
      elseif IsReady(_Q)  and IsReady(_W) then
        return self:GetQDmg(target) + self:GetWDmg(target) 
      elseif IsReady(_Q)  and IsReady(_E) then
        return self:GetQDmg(target) + self:GetEDmg(target) 
      elseif IsReady(_W) and IsReady(_E) then
        return self:GetWDmg(target) +self:GetEDmg(target)
      elseif IsReady(_Q) then
        return self:GetQDmg(target)
      elseif IsReady(_E) then
        return self:GetEDmg(target)
      elseif IsReady(_W) then
        return self:GetWDmg(target)
      elseif IsReady(_Q) and IsReady(_W) then
        return self:GetQDmg(target) + self:GetWDmg(target)
      else
        return 0
      end
    end
            function TwistedFate:GetDraws(target)
          local qdamage = self:GetQDmg(target)
      local edamage = self:GetEDmg(target)
      local rdamage = self:GetWDmg(target)
      local Idmg=(50+ ((myHero.level)*20))

      if qdamage >target.health then
        return 'Q', GoS.White
      elseif qdamage+ Idmg>target.health then
        return 'Q + Ignite', GoS.White
      elseif edamage >target.health then
        return 'E', GoS.White
      elseif edamage + Idmg>target.health then
        return 'E + Ignite', GoS.White
      elseif rdamage  >target.health then
        return 'W', GoS.White
      elseif rdamage + Idmg>target.health then
        return 'W + Ignite', GoS.White
      elseif rdamage +edamage  >target.health then
        return 'W + E',GoS.White
      elseif rdamage +edamage+ Idmg>target.health then
        return 'W + E + Ignite',GoS.White
      elseif qdamage+edamage>target.health then
        return 'Q + E',GoS.White
      elseif qdamage+rdamage >target.health then
        return 'Q + W',GoS.White
      elseif qdamage+edamage+ Idmg>target.health then
        return 'Q + E + Ignite',GoS.White
      elseif qdamage+rdamage+ Idmg>target.health then
        return 'Q + W + Ignite',GoS.White
      elseif qdamage+edamage+rdamage >target.health then
        return 'Kill with full combo',GoS.White
      elseif qdamage+edamage+rdamage+ Idmg>target.health then
        return 'Full Combo + Ignite',GoS.White
      else
        return "Cant Kill yet", GoS.White
      end
    end
    function TwistedFate:escape()
  if self.Config.Keys.escapekey:Value()  then
  if self.Config.escape.useW:Value()  then
    if  IsReady(_W) and ValidTarget(Gtarget,525) then
      self:CastW(self.yellow)
      AttackUnit(Etarget)
end
end
      MoveToXYZ(mousePos)
end
end
     function TwistedFate:killsteal()
      if Hptarget ~= nil then
        local health = Hptarget.health
        local dmgW = self:GetWDmg(Hptarget)
        if(GetDistance(Hptarget)<525 and  IsReady(_W) and health<dmgW and self.Config.killsteal.useW:Value()  and self.Config.killsteal.ks:Value())then
          self:CastW(self.yellow)
        end
        local dmgQ = self:GetQDmg(Hptarget)
        if(GetDistance(Hptarget)<1450 and  IsReady(_Q) and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
          self:CastQ(Hptarget)
        end
        local dmgI =(50+ ((myHero.level)*20))
        if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(Hptarget)<600)then
          self:CastI(Hptarget)
        end
      end
    end
      function TwistedFate:Antiafk()
              if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
              Clock = os.clock() + math.random(60,120)
              MoveToXYZ(myHeroPos())
            end
            function TwistedFate:skinhack()
              if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
                lastTimeTickCalled = CurrentTimeInMillis()
                if  self.Config.misc.skinhack.useskin:Value() then
                  if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                    lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
                    HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
                  end
                end
              end
            end
            local spellLevel = 0
            function TwistedFate:autolevel()
              if GetLevelPoints(myHero) >= 1 then
                if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
                if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
                  local levelSequence =   {_W, _Q, _Q, _E, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E}
                  LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                  Last_LevelSpell = os.clock()
                end
              end
            end
            lastPotion = 0
            function TwistedFate:autopot()
              if os.clock() - lastPotion < 15 then return end
              for SLOT = ITEM_1, ITEM_6 do
                if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
                  if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
                    CastSpell(SLOT)
                    lastPotion = os.clock()
                  end
                end
              end
            end
            function TwistedFate:items()
              if self.Config.item.usebg:Value() and self.Config.Keys.combokey:Value() then
                for _ = ITEM_1, ITEM_7 do
                  if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
                end
              end
            end
            if self.Config.item.usehg:Value() and self.Config.Keys.combokey:Value() then
              for _ = ITEM_1, ITEM_7 do
                if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastTargetSpell(target, _)
              end
            end
          end
          if self.Config.item.enableautozhonya:Value() then
            for _ = ITEM_1, ITEM_7 do
              if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya:Value() / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
            end
          end
        end
      end
function TwistedFate:LoadMenu()
     self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )

              self.Config:Menu( "combo",loc_eng[1])
              self.Config.combo:Boolean("useQ", loc_eng[2], true)
              self.Config.combo:DropDown("qmode","Q logic for combo ;",1, {"Smart","Stunned"," Always"})
              self.Config.combo:Boolean("useW", loc_eng[3], true)
             self.Config.combo:DropDown("card","Select Card Type ;",3, {"Blue Card","Red Card","Yellow Card"})
              self.Config.combo:Info("blank", " Extra Settings")
             -- self.Config.combo:Boolean("usered", "Red Card if hit x enemies", true)
              --self.Config.combo:Slider("reddis","Red Card x enemies", 3, 2, 5, 1)
              self.Config.combo:Boolean("UseR", "Gold card while ultimate", true)
              self.Config.combo:Boolean("instaaa", "Insta AA after ultimate", true)
              self.Config.combo:Boolean("blockaa", "Block AA in card selection", true)
              self.Config.combo:Boolean("useblue", "Use Blue Card if Mana <= % ", true)
              self.Config.combo:Slider("bluemana","Use Blue Card if Mana <= % ", 20, 10, 100, 1)
              self.Config.combo:Boolean("useI", loc_eng[6], true)
              self.Config.combo:Slider("Mana",loc_eng[8], 10, 10, 100, 1)


              self.Config:Menu( "harass",loc_eng[9])
              self.Config.harass:Boolean("useautoq", "Use Auto Q Harass", false)
              self.Config.harass:Boolean("useQ", loc_eng[10], true)
              self.Config.harass:Slider("QMana","Use Q if Mana Percent => % ", 30, 10, 100, 1)
              self.Config.harass:Boolean("useW", loc_eng[11], false)
              self.Config.harass:DropDown("card","Select Card Type ;",1, {"Blue Card","Red Card","Yellow Card"})
              self.Config.harass:Slider("WMana","Use W if Mana Percent => % ", 30, 10, 100, 1)
        


              self.Config:Menu( "farm",loc_eng[14])

              self.Config.farm:Menu("laneclear",loc_eng[15])
              self.Config.farm.laneclear:Boolean("useQ",loc_eng[16],true)
              self.Config.farm.laneclear:Slider("qcount",loc_eng[180], 2, 1, 10, 1)
              self.Config.farm.laneclear:Boolean("useW",loc_eng[17],true)
              self.Config.farm.laneclear:DropDown("card","Select Card Type ;",1, {"Blue Card","Red Card","Yellow Card"})
              self.Config.farm.laneclear:Info("blank","" )
               self.Config.farm.laneclear:Boolean("usered", "Red Card if hit x minions", true)
               self.Config.farm.laneclear:Slider("reddis","Red Card x minions", 3, 2, 5, 1)
              self.Config.farm.laneclear:Info("info2", loc_eng[184])
              self.Config.farm.laneclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.laneclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)

              self.Config.farm:Menu("jungleclear",loc_eng[20])
              self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21],true)
              self.Config.farm.jungleclear:Boolean("useW",loc_eng[22],true)
              self.Config.farm.jungleclear:DropDown("card","Select Card Type ;",1, {"Blue Card","Red Card","Yellow Card"})
              self.Config.farm.jungleclear:Info("blank","" )
                   self.Config.farm.jungleclear:Boolean("usered", "Red Card if hit x minions", true)
               self.Config.farm.jungleclear:Slider("reddis","Red Card x minions", 3, 2, 5, 1)
              self.Config.farm.jungleclear:Info("info2", loc_eng[184])
              self.Config.farm.jungleclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.jungleclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)

              self.Config.farm:Menu("lasthit",loc_eng[25])
              self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189],false)
              self.Config.farm.lasthit:Boolean("useQ",loc_eng[26],false)
              self.Config.farm.lasthit:Boolean("useW",loc_eng[27],true)
             self.Config.farm.lasthit:DropDown("card","Select Card Type ;",1, {"Blue Card","Red Card","Yellow Card"})             
              self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191],1, {loc_eng[172],loc_eng[174]})
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("info2", loc_eng[184])
              self.Config.farm.lasthit:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.lasthit:Slider("WMana",loc_eng[186], 30, 10, 100, 1)

              self.Config:Menu( "killsteal",loc_eng[35])
              self.Config.killsteal:Boolean("ks",loc_eng[36],true)
              self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
              self.Config.killsteal:Boolean("useW", loc_eng[38], true)
              self.Config.killsteal:Boolean("useI", loc_eng[41], true)

                  self.Config:Menu("escape",loc_eng[30])
      self.Config.escape:Boolean("useW",loc_eng[32],true)

              self.Config:Menu( "item",loc_eng[42])
              self.Config.item:Menu( "autopot",loc_eng[192])
              self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
              self.Config.item.autopot:Slider("autopothp", loc_eng[194],  10, 0, 100, 1)
              self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
              self.Config.item:Slider("autozhonya", loc_eng[44],  10, 0, 100, 1)
              self.Config.item:Boolean("usehg", loc_eng[45], false)
              self.Config.item:Boolean("usebg", loc_eng[46], false)



              self.Config:Menu("misc",loc_eng[92])
              self.Config.misc:Menu( "interrupt",loc_eng[93])
              self.Config.misc.interrupt:Boolean("r", loc_eng[95], true)
              self.Config.misc.interrupt:Info("info3", loc_eng[98])
          DelayAction(function()
  local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
  for i, spell in pairs(CHANELLING_SPELLS) do
    for _,k in pairs(GetEnemyHeroes()) do
        if spell["Name"] == GetObjectName(k) then
        self.Config.misc.interrupt:Boolean(GetObjectName(k).."Inter", "On "..GetObjectName(k).." "..(type(spell.Spellslot) == 'number' and str[spell.Spellslot]), true)
        end
    end
  end
end, 0.35)

              self.Config.misc:Menu( "gapClose1",loc_eng[219])
              self.Config.misc.gapClose1:Menu( "gapClose1w","Gap Close - W Settings")
              self.Config.misc.gapClose1.gapClose1w:Info("info3", loc_eng[98] )
          DelayAction(function()    for _, enemy in pairs(GetEnemyHeroes()) do
      if isAGapcloserUnit[enemy.charName] ~= nil then
        self.Config.misc.gapClose1.gapClose1w:Boolean(enemy.charName, enemy.charName .. " - " .. enemy:GetSpellData(isAGapcloserUnit[enemy.charName].spell).name,true)
      end
    end
        end, 0.3)

              self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
              self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
              self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
              self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
              self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
              self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
              self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
              self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)

              Clock = os.clock()
                self.Config:Menu("other",loc_eng[65])
              self.Config.other:Menu( "draw",loc_eng[66])
              self.Config.other.draw:Boolean("qdraw",loc_eng[67],true)
              self.Config.other.draw:Boolean("rdraw",loc_eng[70],true)
              self.Config.other.draw:Boolean("aadraw",loc_eng[71],false)
              self.Config.other:Menu( "color",loc_eng[198])
              self.Config.other.color:ColorPick("Qcolor", loc_eng[199],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Rcolor", loc_eng[202],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("AAcolor", loc_eng[204],{255, 255,0,0})
              -- self.Config.other.color:ColorPick("targetselect", loc_eng[205],{255, 255,0,0})
              self.Config.other:Menu( "width",loc_eng[206])
              self.Config.other.width:Slider("Qwidth", loc_eng[210],  1, 1, 10, 1)
              self.Config.other.width:Slider("Rwidth", loc_eng[213],  1, 1, 10, 1)
              self.Config.other.width:Slider("AAwidth", loc_eng[209], 1, 1, 10, 1)
              -- self.Config.other.width:Slider("STwidth", loc_eng[208], 1, 1, 10, 1)
             -- self.Config.other:Boolean("target",loc_eng[75],true)
              --self.Config.other:Boolean("minimap","Draw R range ( Minimap )",true)
              self.Config.other:Boolean("damage",loc_eng[214],true)
              self.Config.other:Boolean("targetcal",loc_eng[76],true)
              --          self.Config.other:Menu( "perma",loc_eng[73])
              -- self.Config.other.perma:Boolean("perma",loc_eng[74],true)

              self.Config:Menu("targetsel",loc_eng[77])
              self.Config.targetsel:Boolean("ts",loc_eng[78],false)

              self.Config:Menu("orb","Orbwalker Settings")
              self.Config.orb:Menu( "selectorb","Current Orbwalker :")


              self.Config:Menu("pred","Prediction Settings")
              self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
              self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
              self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
              self.Config.pred.hcgeneral.hcop:Slider("hcopq", "Q Hitchance " , 30, 0, 100, 1)
              self.Config.pred:Info("blank", "    Currently Open Prediction "   )
              self.Config.pred:Info("blank", "      is best with this bundle"   )


              self.Config:Menu( "Keys",loc_eng[79])
              self.Config.Keys:Info("infoK3", loc_eng[80])
              self.Config.Keys:Key("combokey", loc_eng[81],string.byte(" "))
              self.Config.Keys:Info("infoK4", loc_eng[82])
              self.Config.Keys:Key("harasskey", loc_eng[83],string.byte("C"))
              self.Config.Keys:Info("infoK5", loc_eng[84])
              self.Config.Keys:Key("laneclearkey", loc_eng[85],string.byte("V"))
              self.Config.Keys:Key("jungleclearkey", loc_eng[86],string.byte("V"))
              self.Config.Keys:Key("lasthitkey",loc_eng[215],string.byte("X"))
              self.Config.Keys:Info("infoK6", loc_eng[87])
              self.Config.Keys:Key("escapekey", loc_eng[88],string.byte("Y"))
              --self.Config.Keys:Boolean("lasthitkey", "Lasthit Key",string.byte("X"))
              self.Config.Keys:Info("infoK","    [Card Key Settings]" )
              self.Config.Keys:Key("bluecard", "Select Blue Card",string.byte("7"))
              self.Config.Keys:Key("redcard", "Select Red Card",string.byte("8"))
              self.Config.Keys:Key("yellowcard", "Select Yellow Card",string.byte("9"))

              self.Config.Keys:Info("infoK2", loc_eng[89])

              self.Config:Info("infoK","           "..Scriptname.."" )
              self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
              self.Config:Info("infoK","   Script was made by  "..Author.. "" )
              self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
              self.Config:Boolean("instruct", loc_eng[216], false)



    end
     function TwistedFate:WndMsg(Msg, Key)
      if self.Config.targetsel.ts:Value() then
        if Msg == WM_LBUTTONDOWN then
          local minD = 10
          local starget = nil
          for i, enemy in ipairs(GetEnemyHeroes()) do
            if ValidTarget(enemy) then
              if GetDistance(enemy, mousePos) <= minD or starget == nil then
                minD = GetDistance(enemy, mousePos)
                starget = enemy
              end
            end
          end
          if starget and minD < 150 then
            if self.selectedTar and starget.charName == self.selectedTar.charName then
              self.selectedTar = nil
              print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            else
              self.selectedTar = starget
              print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            end
          end
        end
      end
      if Msg == WM_LBUTTONDOWN then
        if PopUp1 then
          PopUp1 = false
        end
      end
    end
class "Orianna"
function Orianna:__init()
  self.Q = { delay = 0.25, speed = 1200 ,radius = 175, range = 1700  }
self.W = { range = 1050, radius = 225 }
self.E = { range = 1100 }
self.R = { range = 315 ,radius = 325 }
Last_LevelSpell = 0
 Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
self.tsg = TargetSelector(1350,TARGET_LESS_CAST_PRIORITY,DAMAGE_MAGIC,true,false)
self.tshp = TargetSelector(1350,TARGET_LOW_HP_PRIORITY,DAMAGE_MAGIC,true,false)
if ipred then
qSpell = IPrediction.Prediction({range = 825, speed = 1200, delay = 0.25, width = 160, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
end
Callback.Add("Tick", function() self:Tick() end)
Callback.Add("Load", function() self:onload() end)
Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
Callback.Add("Draw", function() self:Draw() end)
  Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
self:LoadMenu()
 self.Ball = myHero
end
  function Orianna:onload()
    self:findorb()
  end
function Orianna:Checks()
  Gtarget = self.tsg:GetTarget()
    Hptarget = self.tshp:GetTarget()
  if not ValidTarget(Gtarget, 925) or not self.Config.targetsel.ts:Value()  then
    target = GetCurrentTarget()
  elseif  ValidTarget(Gtarget, 925) and not self.selectedTar then
    target = GetCurrentTarget()
  elseif (ValidTarget(Gtarget, 925) and self.selectedTar) then
    target = self.selectedTar
  end
  mousePos = GetMousePos()
  if myHero.dead then
  
    if self.Ball ~= myHero then
      self.Ball = myHero
    end
    
    return
  end
end
 function Orianna:Tick()
self:Checks()
if self.Config.Keys.combokey:Value() then
    self:Combo()
  end
    if(self.Config.Keys.harasskey:Value()   ) then
    self:harass()
  end
    if(self.Config.Keys.escapekey:Value() )then
    self:escape()
  end
  if(self.Config.killsteal.ks:Value() ) then
    self:killsteal()
  end
  if( self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
  self:LastHit()
end
if(self.Config.Keys.jungleclearkey:Value() )then
  self:JungleClear()
end
if(self.Config.Keys.laneclearkey:Value() )then
  self:LaneClear()
end
    self:Antiafk()
  self:autolevel()
  self:skinhack()
  self:autopot()
  self:items()
  self:auto()
  self:autoq()
  end
  function Orianna:auto()
    if not  self.Config.misc.auto.use:Value() then return end
    if   self.Config.misc.auto.useW:Value() then
       local num =  self.Config.misc.auto.wcount:Value()
          if EnemiesAround(self.Ball, 235) >= num then
       self:CastW(target)
     end
   end
    if   self.Config.misc.auto.useR:Value() then
       local num =  self.Config.misc.auto.rcount:Value()
          if EnemiesAround(self.Ball, self.R.range) >= num then
       self:CastR(target)
     end
   end
  if self.Config.instruct:Value() then
    self.Config.instruct:Value(false)
    PopUp1 = true
  end
    self:checkothers()
  end
  function Orianna:autoq()
    if not  self.Config.harass.useautoq:Value() then return end
      if(GetDistance(target) <= 825  and (myHero.mana / myHero.maxMana >=  self.Config.harass.QMana:Value()  /100 )  and IsReady(_Q))then
          self:CastQ(Gtarget)
        end
  end
  function Orianna:harass()
     if(GetDistance(target) <= 825 and self.Config.harass.useQ:Value() and (myHero.mana / myHero.maxMana >=  self.Config.harass.QMana:Value()  /100 )  and IsReady(_Q))then
          self:CastQ(Gtarget)
        end
         if not  self.Ball ~= myHero then
         if(GetDistance(target) <= self.W.range  and self.Config.harass.useW:Value() and (myHero.mana / myHero.maxMana >=  self.Config.harass.WMana:Value()  /100 )   and IsReady(_W))then
              if self:ValidTargetNear(target, self.W.radius, self.Ball) then
              self:CastW(target)
            end
          end
            elseif self.Ball ~= myHero then
                         if(GetDistance(target) <= self.W.range  and self.Config.harass.useW:Value() and (myHero.mana / myHero.maxMana >=  self.Config.harass.WMana:Value()  /100 )   and IsReady(_W))then
                                if self:ValidTargetNear(target, self.W.radius, self.Ball) then
             DelayAction(function()  self:CastW(target)  end, 0.25)
            end
                       end
          end
  end
  function Orianna:Combo()
  if(ValidTarget(target, 825)  and self.Config.combo.useQ:Value()   and IsReady(_Q))then
          self:CastQ(Gtarget)
        end
        if not  self.Ball ~= myHero then
         if(GetDistance(target) <= self.W.range  and self.Config.combo.useW:Value()   and IsReady(_W))then
              if self:ValidTargetNear(target, self.W.radius, self.Ball) then
              self:CastW(target)
            end
          end
            elseif self.Ball ~= myHero then
                         if(GetDistance(target) <= self.W.range  and self.Config.combo.useW:Value()   and IsReady(_W))then
                                if self:ValidTargetNear(target, self.W.radius, self.Ball) then
             DelayAction(function()  self:CastW(target)  end, 0.25)
            end
                       end
          end
           if self.Config.combo.useE:Value() == 1 then
          if (myHero.mana / myHero.maxMana >=   self.Config.combo.emana:Value()  /100 ) then
          if not IsReady(_W) then
if(GetDistance(target) <= self.E.range  and IsReady(_E))then
  local x, y, z = VectorPointProjectionOnLineSegment(mousePos, GetOrigin(target), Vector(self.Ball))
    if z and GetDistance(x, self.Ball) < 80 then
      if( self:GetEDmg(target) >target.health ) then
                self:CastE(myHero)
              end
            end
          end
          end
        end
          elseif self.Config.combo.useE:Value() == 2 then
                      if (myHero.mana / myHero.maxMana >=   self.Config.combo.emana:Value()  /100 ) then
          if not IsReady(_W) then
if(GetDistance(target) <= self.E.range  and IsReady(_E))then
  local x, y, z = VectorPointProjectionOnLineSegment(mousePos, GetOrigin(target), Vector(self.Ball))
    if z and GetDistance(x, self.Ball) < 80 then
                self:CastE(myHero)
              end
            end
          end
          end
        end
 
                if(GetDistance(target,self.Ball) <= self.R.range and self.Config.combo.useR:Value() and IsReady(_R))then
                  if self:ValidTargetNear(target, self.R.radius, self.Ball) then
                  if self.Config.combo.rlogic:Value() == 1 then
       if not (( IsReady(_Q) and self:GetQDmg(target) >target.health ) or  ( IsReady(_W) and self:GetWDmg(target) >target.health ) or  ( IsReady(_Q) and IsReady(_W) and  self:GetQDmg(target)+self:GetWDmg(target) >target.health )) then 
       if self:GetRDmg(target) >target.health then
              self:CastR(target)
            end
          end
          elseif self.Config.combo.rlogic:Value() == 2 then
              if self:GetRDmg(target) >target.health then
                    self:CastR(target)
                  end
                  elseif self.Config.combo.rlogic:Value() == 3 then
                             self:CastR(target)
                  end
                end
                  if self.Config.combo.useRM:Value() then
          local num =  self.Config.combo.rcount:Value()
          if EnemiesAround(self.Ball, self.R.range) >= num then
       self:CastR(target)
        end
        end
      end
end
  function Orianna:LaneClear()
    if not ValidTarget(ClosestMinion(GetOrigin(myHero), MINION_ENEMY),  1000) then return end
 for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion, 1000)  and GetTeam(minion) == MINION_ENEMY then
                    if (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.WMana:Value() /100 ) then
                      if IsReady(_W) then
                        if  self.Config.farm.laneclear.useW:Value()   then
                          if MinionsAround(self.Ball, 250, MINION_ENEMY) >=self.Config.farm.laneclear.wcount:Value() and self.Ball~= myHero then
                          self:CastW(minion) 
                          end
                        end
                      end
                  end
                end
              end

                  if IsReady(_Q) then
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.QMana:Value() /100 ) then
                      local NumberOfHits = self.Config.farm.laneclear.qcount:Value()
                        if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useQ:Value()  then
                          local BestPos, BestHit = GetFarmPosition(self.Q.range, 160, MINION_ENEMY)
                          if BestPos and BestHit and BestHit >= NumberOfHits then
                            CastSkillShot(_Q, BestPos)
                          end
                        end
                      end
                    end
                  end
                  function Orianna:JungleClear()
      if not ValidTarget(ClosestMinion(GetOrigin(myHero), MINION_JUNGLE),  1000) then return end
 for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion, 1000) and minion ~= nil and GetTeam(minion) == MINION_JUNGLE then
                   if (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.WMana:Value() /100 ) then
                      if IsReady(_W) then
                        if  self.Config.farm.jungleclear.useW:Value()   then
                          if MinionsAround(self.Ball, 250, MINION_JUNGLE) >=1 then
                          self:CastW(minion) 
                          end
                        end
                      end
                  end
                end
              end

                  if IsReady(_Q) then
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.QMana:Value() /100 ) then
                        if  self.Config.farm.jungleclear.useQ:Value()  then
                          local BestPos, BestHit = GetFarmPosition(self.Q.range, 160, MINION_JUNGLE)
                          if BestPos and BestHit and BestHit >= 1 then
                            CastSkillShot(_Q, BestPos)
                          end
                        end
                      end
                    end
                  end
                  function Orianna:LastHit()
for _, target in pairs(minionManager.objects) do
  if GetTeam(target) == MINION_ENEMY then
    if IsObjectAlive(target) then
      if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
        local Qdamage = self:GetQDmg(target)
        if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and ValidTarget(target,self.Q.range)   and Qdamage >= GetCurrentHP(target)) then
          self:CastQ(target)
        end
      end
    end
  end
end
end
function Orianna:Draw()
    if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 825,  self.Config.other.width.Qwidth:Value(),0,self.Config.other.color.Qcolor:Value())
        end

        if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 825,  self.Config.other.width.Wwidth:Value(),0, self.Config.other.color.Wcolor:Value())
        end

        if self.Config.other.draw.edraw:Value() and IsReady(_E) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 1100,  self.Config.other.width.Ewidth:Value(),0, self.Config.other.color.Ecolor:Value())
        end

        if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
          DrawCircle(myHero.x, myHero.y, myHero.z, 1100, self.Config.other.width.Rwidth:Value(),0, self.Config.other.color.Rcolor:Value())
        end
        if self.Config.other.draw.aadraw:Value() then
          DrawCircle(myHero.x, myHero.y, myHero.z, 525, self.Config.other.width.AAwidth:Value(),0, self.Config.other.color.AAcolor:Value())
        end

        if self.Config.other.circleball.enable:Value() then
        if self.Ball ~= myHero then
 DrawCircle(self.Ball.x, self.Ball.y, self.Ball.z, 125, self.Config.other.circleball.ballwidth:Value(),0, self.Config.other.circleball.ballcolor:Value())
end
end
     if self.Config.other.circleball.enable:Value() then
          if self.Ball ~= myHero then
if  self.Config.other.circleball.circleballs.draww:Value() then
 DrawCircle(self.Ball.x, self.Ball.y, self.Ball.z, 250, self.Config.other.circleball.ballwidth:Value(),0, self.Config.other.circleball.circleballs.ballcolorw:Value())
end
if self.Config.other.circleball.circleballs.drawr:Value() then
   DrawCircle(self.Ball.x, self.Ball.y, self.Ball.z, 325, self.Config.other.circleball.ballwidth:Value(),0, self.Config.other.circleball.circleballs.ballcolorr:Value())
 end
end
end

    local rs = GetResolution()
    if PopUp1 then
      local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
      DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
      DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
      DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
      DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
      DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
      DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
      DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
      DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
      DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
      DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
      DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
      DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
      -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
      -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
      -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
      -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
      local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
      --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
      --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
      FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
      DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
    end
    for _, target in pairs(GetEnemyHeroes()) do
      if ValidTarget(target, 15000) then
        if target.visible and not target.dead and self.Config.other.damage:Value() then
          currLine = 1
          -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
          DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
          currLine = currLine + 1
          DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
        end
      end
    end

    if self.Config.other.targetcal:Value() and not myHero.dead then
      if target and target ~= nil then
        --  local target= GetOrigin(target)
        local drawpos=WorldToScreen(1,target.x, target.y, target.z)
        local comboText,color = self:GetDraws(target)
        if comboText then
          DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
        end
      end
    end
  end
function Orianna:AddRange(unit)
  return unit.boundingRadius
end

function Orianna:TrueRange(enemy)
  return myHero.range+self:AddRange(myHero)+self:AddRange(enemy)
end
  function Orianna:CastI(unit)
    if Ignite then
      if IsReady(Ignite) then
        CastTargetSpell(unit, Ignite)
      end
    end
  end
  function Orianna:CastQ(unit)
      if self.Ball and self.Ball ~=nil  then
    if self.Config.pred.selectpred:Value() == 1 then
      local QPred = GetPrediction(unit, self.Q, self.Ball)
      if IsReady(_Q) then
        if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100) then
          CastSkillShot(_Q, QPred.castPos)
        end
      end
    elseif self.Config.pred.selectpred:Value() == 2 then
      if ipred then
        local HitChance, y = qSpell:Predict(unit)
        if IsReady(_Q) and HitChance >= 3 then
          CastSkillShot(_Q, y.x, y.y, y.z)
        end
      end
    elseif self.Config.pred.selectpred:Value() == 3 then
      local qPred = GetPredictionForPlayer(self.Ball, unit, GetMoveSpeed(unit), 1200, 250, 825, 160, false, true)
      if IsReady(_Q) and qPred.HitChance == 1 then
        CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
      end
    end
end
end
    function Orianna:CastW( unit)
   if GetDistance(unit,self.Ball) <= self.W.range then
    if IsReady(_W) then
      CastSpell(_W)
    end
end
  end
   function Orianna:CastE(unit)
            if IsReady(_E) then
              CastTargetSpell(unit, _E)
            end
          end
          function Orianna:GiveE(unit)
            if unit.dead then
    return
  end
    CastTargetSpell(unit, _E)
end
    function Orianna:CastR(unit)
  if GetDistance(unit,self.Ball) <= self.R.range then
    if IsReady(_R) then
      CastSpell(_R)
    end
end
  end
  function Orianna:GetQDmg(target)
              if GetCastLevel(myHero, _Q) < 1 then
                return 0
              end
              if IsReady(_Q) then
                local FinalDamage = (30 + (GetCastLevel(myHero, _Q) * 30) + (GetBonusAP(myHero))*.5)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Orianna:GetWDmg(target)
              if GetCastLevel(myHero, _W) < 1 then
                return 0
              end
              if IsReady(_W) then
                local FinalDamage =  (25 + (GetCastLevel(myHero, _Q) * 45) + (GetBonusAP(myHero))*.7)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Orianna:GetEDmg(target)
              if GetCastLevel(myHero, _E) < 1 then
                return 0
              end
              if IsReady(_E) then
                local FinalDamage = (30 + (GetCastLevel(myHero, _W) * 30) + (GetBonusAP(myHero))* .3)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Orianna:GetRDmg(target)
              if GetCastLevel(myHero, _R) < 1 then
                return 0
              end
              if IsReady(_R) then
                local FinalDamage = (75 + (GetCastLevel(myHero, _R) * 75) + (GetBonusAP(myHero))* .7)
                return CalcDamage(myHero,target,0, FinalDamage)
              else
                return 0
              end
            end
            function Orianna:GetMyDmg(target)
              if IsReady(_Q) and IsReady(_W) and IsReady(_R) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
              elseif IsReady(_Q) and IsReady(_W) and IsReady(_R) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetRDmg(target)
              elseif IsReady(_Q) and IsReady(_W) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
              elseif IsReady(_Q) and IsReady(_R) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
              elseif IsReady(_R) and IsReady(_W) and IsReady(_E) then
                return self:GetRDmg(target) + self:GetWDmg(target) + self:GetEDmg(target)
              elseif IsReady(_Q) and IsReady(_W) then
                return self:GetQDmg(target) + self:GetWDmg(target)
              elseif IsReady(_E) and IsReady(_W) then
                return self:GetEDmg(target) + self:GetWDmg(target)
              elseif IsReady(_R) and IsReady(_W) then
                return self:GetRDmg(target) + self:GetWDmg(target)
              elseif IsReady(_Q) and IsReady(_R) then
                return self:GetQDmg(target) + self:GetRDmg(target)
              elseif IsReady(_E) and IsReady(_R) then
                return self:GetEDmg(target) + self:GetRDmg(target)
              elseif IsReady(_Q) and IsReady(_E) then
                return self:GetQDmg(target) + self:GetEDmg(target)
              elseif IsReady(_R) then
                return self:GetRDmg(target)
              elseif IsReady(_E) then
                return self:GetEDmg(target)
              elseif IsReady(_Q) then
                return self:GetQDmg(target)
              elseif IsReady(_W) then
                return self:GetWDmg(target)
              else
                return 0
              end
            end
            function Orianna:GetDraws(target)
              local qdamage = self:GetQDmg(target)
              local wdamage = self:GetWDmg(target)
              local edamage = self:GetEDmg(target)
              local rdamage = self:GetRDmg(target)
              local Idmg=(50+ ((myHero.level)*20))

              if qdamage >target.health then
                return 'Q', GoS.White
              elseif qdamage+ Idmg>target.health then
                return 'Q + Ignite', GoS.White
              elseif wdamage >target.health then
                return 'W', GoS.White
              elseif wdamage+ Idmg>target.health then
                return 'W + Ignite', GoS.White
              elseif edamage >target.health then
                return 'E', GoS.White
              elseif edamage + Idmg>target.health then
                return 'E + Ignite', GoS.White
              elseif rdamage  >target.health then
                return 'R', GoS.White
              elseif rdamage + Idmg>target.health then
                return 'R + Ignite', GoS.White
              elseif rdamage +edamage  >target.health then
                return 'R + E',GoS.White
              elseif rdamage +edamage+ Idmg>target.health then
                return 'R + E + Ignite',GoS.White
              elseif edamage+wdamage >target.health then
                return 'E + W',GoS.White
              elseif edamage+wdamage+ Idmg>target.health then
                return 'E + W + Ignite',GoS.White
              elseif rdamage+wdamage >target.health then
                return 'R + W',GoS.White
              elseif rdamage+wdamage+ Idmg>target.health then
                return 'R + W + Ignite',GoS.White
              elseif qdamage+wdamage >target.health then
                return 'Q + W',GoS.White
              elseif qdamage+edamage>target.health then
                return 'Q + E',GoS.White
              elseif qdamage+rdamage >target.health then
                return 'Q + R',GoS.White
              elseif qdamage+wdamage+ Idmg>target.health then
                return 'Q + W + Ignite',GoS.White
              elseif qdamage+edamage+ Idmg>target.health then
                return 'Q + E + Ignite',GoS.White
              elseif qdamage+rdamage+ Idmg>target.health then
                return 'Q + R + Ignite',GoS.White
              elseif qdamage+edamage+wdamage >target.health then
                return 'Q + W + E',GoS.White
              elseif qdamage+rdamage+wdamage >target.health then
                return 'Q + W + R',GoS.White
              elseif qdamage+edamage+rdamage >target.health then
                return 'Q + R + E',GoS.White
              elseif qdamage+edamage+wdamage+ Idmg>target.health then
                return 'Q + W + E + Ignite',GoS.White
              elseif qdamage+wdamage+edamage+rdamage >target.health then
                return 'Kill with full combo',GoS.White
              elseif qdamage+wdamage+edamage+rdamage+Idmg>target.health then
                return 'Full Combo + Ignite',GoS.White
              else
                return "Cant Kill yet", GoS.White
              end
            end
             function Orianna:Antiafk()
                    if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
                    Clock = os.clock() + math.random(60,120)
                    MoveToXYZ(myHeroPos())
                  end
                  function Orianna:skinhack()
                    if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
                      lastTimeTickCalled = CurrentTimeInMillis()
                      if  self.Config.misc.skinhack.useskin:Value() then
                        if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
                          lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
                          HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
                        end
                      end
                    end
                  end
                  local spellLevel = 0
                  function Orianna:autolevel()
                    if GetLevelPoints(myHero) >= 1 then
                      if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                      if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
                        local levelSequence =  {_Q, _E, _W, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E}
                        LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
                        Last_LevelSpell = os.clock()
                      end
                    end
                  end
                  lastPotion = 0
                  function Orianna:autopot()
                    if os.clock() - lastPotion < 15 then return end
                    for SLOT = ITEM_1, ITEM_6 do
                      if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
                        if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
                          CastSpell(SLOT)
                          lastPotion = os.clock()
                        end
                      end
                    end
                  end
                  function Orianna:items()
                    if self.Config.item.usebg:Value() and self.Config.Keys.combokey:Value() then
                      for _ = ITEM_1, ITEM_7 do
                        if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "BilgewaterCutlass" )then CastTargetSpell(target, _)
                      end
                    end
                  end
                  if self.Config.item.usehg:Value() and self.Config.Keys.combokey:Value() then
                    for _ = ITEM_1, ITEM_7 do
                      if ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "HextechGunblade" )then CastTargetSpell(target, _)
                    end
                  end
                end
                if self.Config.item.enableautozhonya:Value() then
                  for _ = ITEM_1, ITEM_7 do
                    if myHero.health <= (myHero.maxHealth * self.Config.item.autozhonya:Value() / 100) and ( myHero:CanUseSpell(_) == 0 and myHero:GetSpellData(_).name == "ZhonyasHourglass" )then CastSpell(_)
                  end
                end
              end
            end
 function Orianna:LoadMenu()
     self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )

              self.Config:Menu( "combo",loc_eng[1])
              self.Config.combo:Boolean("useQ", loc_eng[2], true)
              self.Config.combo:Boolean("useW", loc_eng[3], true)
              self.Config.combo:DropDown("useE","E logic for combo ;",1, {"If Target Killable","Always"," Never"})
              self.Config.combo:Slider("emana","Use E if Mana Percent => % ", 10, 10, 100, 1)
              self.Config.combo:Info("blank", " R Settings")
              self.Config.combo:Boolean("useR", "Use R  For Single Target", true)
              self.Config.combo:DropDown("rlogic","R logic (Single Target) ;",1, {"Smart","If Target Killable","Always"})
              self.Config.combo:Boolean("useRM", "Use R  For Multiple Target", true)
              self.Config.combo:Slider("rcount","Use R Min Count", 3, 2, 5, 1)
              self.Config.combo:Boolean("useI", loc_eng[6], true)
              self.Config.combo:Slider("Mana",loc_eng[8], 10, 10, 100, 1)


              self.Config:Menu( "harass",loc_eng[9])
              self.Config.harass:Boolean("useautoq", "Use Auto Q Harass", false)
              self.Config.harass:Boolean("useQ", loc_eng[10], true)
              self.Config.harass:Slider("QMana","Use Q if Mana Percent => % ", 30, 10, 100, 1)
              self.Config.harass:Boolean("useW", loc_eng[11], true)
              self.Config.harass:Slider("WMana","Use W if Mana Percent => % ", 30, 10, 100, 1)
        


              self.Config:Menu( "farm",loc_eng[14])

              self.Config.farm:Menu("laneclear",loc_eng[15])
              self.Config.farm.laneclear:Boolean("useQ",loc_eng[16],true)
              self.Config.farm.laneclear:Slider("qcount",loc_eng[180], 2, 1, 10, 1)
              self.Config.farm.laneclear:Boolean("useW",loc_eng[17],true)
              self.Config.farm.laneclear:Slider("wcount",loc_eng[181], 2, 1, 10, 1)
              self.Config.farm.laneclear:Info("blank","" )
              self.Config.farm.laneclear:Info("blank", "")
              self.Config.farm.laneclear:Info("info2", loc_eng[184])
              self.Config.farm.laneclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.laneclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)

              self.Config.farm:Menu("jungleclear",loc_eng[20])
              self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21],true)
              self.Config.farm.jungleclear:Boolean("useW",loc_eng[22],true)
              self.Config.farm.jungleclear:Info("blank","" )
              self.Config.farm.jungleclear:Info("blank","" )
              self.Config.farm.jungleclear:Info("info2", loc_eng[184])
              self.Config.farm.jungleclear:Slider("QMana",loc_eng[185], 30, 10, 100, 1)
              self.Config.farm.jungleclear:Slider("WMana",loc_eng[186], 30, 10, 100, 1)

              self.Config.farm:Menu("lasthit",loc_eng[25])
              self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189],false)
              self.Config.farm.lasthit:Boolean("useQ",loc_eng[26],true)
              self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191],1, {loc_eng[172],loc_eng[174]})
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("blank", "")
              self.Config.farm.lasthit:Info("info2", loc_eng[184])
              self.Config.farm.lasthit:Slider("QMana",loc_eng[185], 30, 10, 100, 1)

              self.Config:Menu( "killsteal",loc_eng[35])
              self.Config.killsteal:Boolean("ks",loc_eng[36],true)
              self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
              self.Config.killsteal:Boolean("useW", loc_eng[38], true)
              self.Config.killsteal:Boolean("useE", loc_eng[39], true)
              self.Config.killsteal:Boolean("useR", loc_eng[40], true)
              self.Config.killsteal:Boolean("useI", loc_eng[41], true)

                  self.Config:Menu("escape",loc_eng[30])
      self.Config.escape:Boolean("useE",loc_eng[33],true)

              self.Config:Menu( "item",loc_eng[42])
              self.Config.item:Menu( "autopot",loc_eng[192])
              self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
              self.Config.item.autopot:Slider("autopothp", loc_eng[194],  10, 0, 100, 1)
              self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
              self.Config.item:Slider("autozhonya", loc_eng[44],  10, 0, 100, 1)
              self.Config.item:Boolean("usehg", loc_eng[45], false)
              self.Config.item:Boolean("usebg", loc_eng[46], false)



              self.Config:Menu("misc",loc_eng[92])
                       self.Config.misc:Menu( "auto","[" .. myHero.charName.. "] - Auto Settings")
            self.Config.misc.auto:Boolean("use", "Use Auto Settings", false)
              self.Config.misc.auto:Boolean("useW", "Use W (Multiple Target)", false)
             self.Config.misc.auto:Slider("wcount", "Use W Minimum Count",  3, 2, 5, 1) 
           self.Config.misc.auto:Boolean("useR", "Use R (Multiple Target)", false)
             self.Config.misc.auto:Slider("rcount", "Use R Minimum Count",  3, 2, 5, 1) 
              self.Config.misc:Menu( "interrupt",loc_eng[93])
              self.Config.misc.interrupt:Boolean("r", loc_eng[97], true)
              self.Config.misc.interrupt:Info("info3", loc_eng[98])
    DelayAction(function()
  local str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
  for i, spell in pairs(CHANELLING_SPELLS) do
    for _,k in pairs(GetEnemyHeroes()) do
        if spell["Name"] == GetObjectName(k) then
        self.Config.misc.interrupt:Boolean(GetObjectName(k).."Inter", "On "..GetObjectName(k).." "..(type(spell.Spellslot) == 'number' and str[spell.Spellslot]), true)
        end
    end
  end
end, 0.35)

              self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
              self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
              self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
              self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
              self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
              self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
              self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
              self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)

              Clock = os.clock()
              self.Config:Menu("other",loc_eng[65])
              --self.Config.other:Menu("Show Damage On Hp Bar", "HPBAR")
              --self.Config.other.HPBAR:Boolean("key","ON/OFF",true)
              self.Config.other:Menu( "draw",loc_eng[66])
               self.Config.other:Menu( "circleball","Circle for Ball")
                              self.Config.other.circleball:Menu( "circleballs","Ball Skill Ranges")
                  self.Config.other.circleball.circleballs:Boolean("draww","Draw W Range", false)
                     self.Config.other.circleball.circleballs:Boolean("drawr","Draw W Range", false)
                        self.Config.other.circleball.circleballs:ColorPick("ballcolorw", "W Color",   {255, 255, 255, 255})
                                      self.Config.other.circleball.circleballs:ColorPick("ballcolorr", "R color",   {255, 255, 255, 255})
              self.Config.other.circleball:Boolean("enable","Enable", true)
             self.Config.other.circleball:ColorPick("ballcolor", "Color",   {255, 255, 255, 255})
              self.Config.other.circleball:Slider("ballwidth", "Width", 1, 1, 10, 1)
              self.Config.other.draw:Boolean("qdraw",loc_eng[67],true)
              self.Config.other.draw:Boolean("wdraw",loc_eng[68],true)
              self.Config.other.draw:Boolean("edraw",loc_eng[69],true)
              self.Config.other.draw:Boolean("rdraw",loc_eng[70],true)
              self.Config.other.draw:Boolean("aadraw",loc_eng[71],false)
              self.Config.other:Menu( "color",loc_eng[198])
              self.Config.other.color:ColorPick("Qcolor", loc_eng[199],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Wcolor", loc_eng[200],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Ecolor", loc_eng[201],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("Rcolor", loc_eng[202],{255, 255, 255, 255})
              self.Config.other.color:ColorPick("AAcolor", loc_eng[204],{255, 255,0,0})
              -- self.Config.other.color:ColorPick("targetselect", loc_eng[205],{255, 255,0,0})
              self.Config.other:Menu( "width",loc_eng[206])
              self.Config.other.width:Slider("Qwidth", loc_eng[210],  1, 1, 10, 1)
              self.Config.other.width:Slider("Wwidth", loc_eng[211],  1, 1, 10, 1)
              self.Config.other.width:Slider("Ewidth", loc_eng[212],  1, 1, 10, 1)
              self.Config.other.width:Slider("Rwidth", loc_eng[213],  1, 1, 10, 1)
              self.Config.other.width:Slider("AAwidth", loc_eng[209], 1, 1, 10, 1)
              -- self.Config.other.width:Slider("STwidth", loc_eng[208], 1, 1, 10, 1)
              self.Config.other:Boolean("target",loc_eng[75],true)
              self.Config.other:Boolean("damage",loc_eng[214],true)
              self.Config.other:Boolean("targetcal",loc_eng[76],true)
              --          self.Config.other:Menu( "perma",loc_eng[73])
              -- self.Config.other.perma:Boolean("perma",loc_eng[74],true)

              self.Config:Menu("targetsel",loc_eng[77])
              self.Config.targetsel:Boolean("ts",loc_eng[78],false)

              self.Config:Menu("orb","Orbwalker Settings")
              self.Config.orb:Menu( "selectorb","Current Orbwalker :")


              self.Config:Menu("pred","Prediction Settings")
              self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
              self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
              self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
              self.Config.pred.hcgeneral.hcop:Slider("hcopq", "Q Hitchance " , 30, 0, 100, 1)
              self.Config.pred:Info("blank", "    Currently Open Prediction "   )
              self.Config.pred:Info("blank", "      is best with this bundle"   )


              self.Config:Menu( "Keys",loc_eng[79])
              self.Config.Keys:Info("infoK3", loc_eng[80])
              self.Config.Keys:Key("combokey", loc_eng[81],string.byte(" "))
              self.Config.Keys:Info("infoK4", loc_eng[82])
              self.Config.Keys:Key("harasskey", loc_eng[83],string.byte("C"))
              self.Config.Keys:Key("autoq", loc_eng[91], string.byte("T"))
              self.Config.Keys:Info("infoK5", loc_eng[84])
              self.Config.Keys:Key("laneclearkey", loc_eng[85],string.byte("V"))
              self.Config.Keys:Key("jungleclearkey", loc_eng[86],string.byte("V"))
              self.Config.Keys:Key("lasthitkey",loc_eng[215],string.byte("X"))
              self.Config.Keys:Info("infoK6", loc_eng[87])
              self.Config.Keys:Key("escapekey", loc_eng[88],string.byte("Y"))
              --self.Config.Keys:Boolean("lasthitkey", "Lasthit Key",string.byte("X"))
              self.Config.Keys:Info("infoK","" )
              self.Config.Keys:Info("infoK2", loc_eng[89])

              self.Config:Info("infoK","           "..Scriptname.."" )
              self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
              self.Config:Info("infoK","   Script was made by  "..Author.. "" )
              self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
              self.Config:Boolean("instruct", loc_eng[216], false)



    end
      function Orianna:escape()
    if self.Config.Keys.escapekey:Value()  then
  if self.Config.escape.useE:Value()  then
    if  IsReady(_E) and GetDistance(target) <= 525  then
      self:CastE(myHero)
    else
      MoveToXYZ(mousePos)
    end
  end
end
end
 function Orianna:killsteal()
   if Hptarget ~= nil then
                local health = GetCurrentHP(Hptarget)
                local dmgQ = self:GetQDmg(Hptarget)
                if(GetDistance(Hptarget) <= self.Q.range and  IsReady(_Q) and not self.Config.Keys.combokey:Value()   and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
                  self:CastQ(Hptarget)
                end
                local dmgW = self:GetWDmg(Hptarget)
           if( self:ValidTargetNear(Hptarget, self.W.radius, self.Ball)  and  IsReady(_W) and not self.Config.Keys.combokey:Value()  and health<dmgQ and self.Config.killsteal.useW:Value() and self.Config.killsteal.ks:Value() )then
                  self:CastW(Hptarget)
                end
                local dmgI =(50+ ((myHero.level)*20))
                if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(Hptarget)<600)then
                  self:CastI(Hptarget)
                end
                local dmgR =self:GetRDmg(Hptarget)
                if(self:ValidTargetNear(Hptarget, self.R.range, self.Ball) and  IsReady(_R) and not self.Config.Keys.combokey:Value()   and health<dmgR and self.Config.killsteal.useR:Value() and self.Config.killsteal.ks:Value() )then
                  self:CastR(Hptarget)
                end
              end
                  end
    function  Orianna:ProcessSpell(unit, spell)
    if unit == myHero then
      if unit and spell then
        if spell.name == "OrianaIzunaCommand" then
    self.Ball = Vector(spell.endPos)
  elseif spell.name == "OrianaRedactCommand" then
    self.Ball = spell.target
  end
  end
end
       if GetObjectType(unit) == Obj_AI_Hero and GetTeam(unit) ~= GetTeam(myHero) and IsReady(_R) then
      if CHANELLING_SPELLS[spell.name] then
        if ValidTarget(unit, 1000) and GetObjectName(unit) == CHANELLING_SPELLS[spell.name].Name and  self.Config.misc.interrupt[GetObjectName(unit).."Inter"]:Value() and self.Config.misc.interrupt.r:Value() then 
         self:CastR(unit)
        end
      end
    end
            end
    function Orianna:UpdateBuff(unit,buff)
                    if unit and unit.team == myHero.team and unit.type == myHero.type then
                      if  buff.Name == "orianaghostself" then
                         self.Ball = myHero
                      end
                    end
                  end
    function Orianna:ValidTargetNear(object, distance, from)
  return object ~= nil and object.valid and object.team ~= myHero.team and object.visible and not object.dead  and GetDistanceSqr(object, from) <= distance*distance
end
    function Orianna:WndMsg(Msg, Key)
      if self.Config.targetsel.ts:Value() then
        if Msg == WM_LBUTTONDOWN then
          local minD = 10
          local starget = nil
          for i, enemy in ipairs(GetEnemyHeroes()) do
            if ValidTarget(enemy) then
              if GetDistance(enemy, mousePos) <= minD or starget == nil then
                minD = GetDistance(enemy, mousePos)
                starget = enemy
              end
            end
          end
          if starget and minD < 150 then
            if self.selectedTar and starget.charName == self.selectedTar.charName then
              self.selectedTar = nil
              print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            else
              self.selectedTar = starget
              print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            end
          end
        end
      end
      if Msg == WM_LBUTTONDOWN then
        if PopUp1 then
          PopUp1 = false
        end
      end
    end
class "Zed"
local GR = 0
local Wdmgp = false
local Rdmgp = false
local Rbuff = false
local GW = 0
local startTime = 0
local startTimer = 0
local wgapclose = false
function Zed:__init()
  self.Q = { delay = 0.25, speed = 1700 ,width = 50, range = 900  }
self.W = { range = 700  ,speed = 1750 ,width = 250 }
self.E = { range = 290  }
self.R = { range = 625   }
Last_LevelSpell = 0
global_ticks = 0
 Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))
self.tsg = TargetSelector(1100,TARGET_LESS_CAST_PRIORITY,DAMAGE_PHYSICAL,true,false)
if ipred then
qSpell = IPrediction.Prediction({range = 900, speed = 1700, delay = 0.25, width = 50, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
end
Callback.Add("Tick", function() self:Tick() end)
Callback.Add("Load", function() self:onload() end)
Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
Callback.Add("Draw", function() self:Draw() end)
Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)
Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
--Callback.Add("CreateObj", function(obj) self:CreateObj(obj) end)
--Callback.Add("DeleteObj", function(obj) self:DeleteObj(obj) end)
self:LoadMenu()
end
function Zed:Checks()
Gtarget = self.tsg:GetTarget()
if not ValidTarget(Gtarget, 925) or not self.Config.targetsel.ts:Value()  then
target = GetCurrentTarget()
elseif  ValidTarget(Gtarget, 925) and not self.selectedTar then
target = GetCurrentTarget()
elseif (ValidTarget(Gtarget, 925) and self.selectedTar) then
target = self.selectedTar
end
mousePos = GetMousePos()
Blg = GetItemSlot(myHero,3144) > 0 and GetItemSlot(myHero,3144) or nil
Yahu = GetItemSlot(myHero,3142) > 0 and GetItemSlot(myHero,3142) or nil
Tia = GetItemSlot(myHero,3077) > 0 and GetItemSlot(myHero,3077) or nil
Rhyd = GetItemSlot(myHero,3074) > 0 and GetItemSlot(myHero,3074) or nil
Thyd = GetItemSlot(myHero,3053) > 0 and GetItemSlot(myHero,3053) or nil
Btk = GetItemSlot(myHero,3153) > 0 and GetItemSlot(myHero,3153) or nil
Rand = GetItemSlot(myHero,3143) > 0 and GetItemSlot(myHero,3143) or nil
Qss = GetItemSlot(myHero,3140) > 0 and GetItemSlot(myHero,3140) or GetItemSlot(myHero,3139) > 0 and GetItemSlot(myHero,3139) or nil
end
function Zed:Tick()
self:Checks()
self:clearitems()
if(self.Config.Keys.combokey:Value()  and (myHero.mana / myHero.maxMana >=  self.Config.combo.Mana:Value()  /100 ) )then
  if self:divelogic(target) == true then
self:Combo()
end
end
if self.Config.Keys.combokey:Value() then
self:comboitems()
end
if self.Config.Keys.harasskey:Value() then
  self:harass()
end
if( self.Config.Keys.lasthitkey:Value() or self.Config.farm.lasthit.autolasthit:Value() )then
    self:LastHit()
  end
   if(self.Config.Keys.laneclearkey:Value() )then
    self:LaneClear()
  end
  if(self.Config.Keys.jungleclearkey:Value() )then
    self:JungleClear()
  end
if self.Config.harass.autoharass.useQ:Value() then
  self:Autoq()
end
if self.Config.Keys.escapekey:Value() then
  self:escape()
end
if self.Config.harass.autoharass.useE:Value() then
  self:Autoe()
end
if self.Config.harass.autoharass.use:Value() then
  self:Autoharass()
end
if self.Config.killsteal.ks:Value() then
  self:killsteal()
end
if self.Config.instruct:Value() then
self.Config.instruct:Value(false)
PopUp1 = true
end
self:Antiafk()
self:autolevel()
self:skinhack()
self:autopot()
self:checkothers()
end
function Zed:combomode()
local drawpos = GetHPBarPos(myHero)
if   self.Config.combo.rlogic:Value()  == 1 then
DrawText("Current Combo Mode: Line", 12, drawpos.x, drawpos.y+16, 0xff00ffff) end
if self.Config.combo.rlogic:Value()   == 2 then
  DrawText("Current Combo Mode Rectangle", 12, drawpos.x, drawpos.y+16, 0xff00ffff) end
  if self.Config.combo.rlogic:Value()   == 3 then
    DrawText("Current Combo Mode: Mouse Position", 12, drawpos.x, drawpos.y+16, 0xff00ffff) end
  end
  function Zed:Draw()
    if self.Config.other.combomode:Value() then
      self:combomode()
    end
    if self.Config.other.draw.qdraw:Value() and IsReady(_Q) then
      DrawCircle(myHero.x, myHero.y, myHero.z, 900,  1,0,self.Config.other.color.Qcolor:Value())
    end

    if self.Config.other.draw.wdraw:Value() and IsReady(_W) then
      DrawCircle(myHero.x, myHero.y, myHero.z, 700,  1,0, self.Config.other.color.Wcolor:Value())
    end

    if self.Config.other.draw.edraw:Value() and IsReady(_E) then
      DrawCircle(myHero.x, myHero.y, myHero.z, 290,  1,0, self.Config.other.color.Ecolor:Value())
    end

    if self.Config.other.draw.rdraw:Value() and IsReady(_R) then
      DrawCircle(myHero.x, myHero.y, myHero.z, 625, 1,0, self.Config.other.color.Rcolor:Value())
    end
    if self.Config.other.draw.aadraw:Value() then
      DrawCircle(myHero.x, myHero.y, myHero.z, 125, 1,0, self.Config.other.color.AAcolor:Value())
    end
    if Wpos and Wpos ~= nil then
      if  self.Config.other.circlew.enable:Value() then
        DrawCircle(Wpos.x, Wpos.y, Wpos.z, 125, self.Config.other.circlew.Wwidth:Value(),0, self.Config.other.circlew.Wcolor:Value())
      end
    end
    if Rpos and Rpos ~= nil then
      if  self.Config.other.circler.enable:Value() then
        DrawCircle(Rpos.x, Rpos.y, Rpos.z, 125, self.Config.other.circler.Wwidth:Value(),0, self.Config.other.circler.Wcolor:Value())
      end
    end
if   self.Config.other.circlew.enable:Value() then
  if  self.Config.other.circlew.timer:Value()  then
       if Wpos and Wpos ~= nil then
    local drawpos=WorldToScreen(1,Wpos.x, Wpos.y, Wpos.z)
    DrawText("Shadow Duration :"..math.round(startTime - os.clock(), 2).."s",15,drawpos.x,drawpos.y,GoS.White)
  end
end
end

if self.Config.misc.turretdive.Drawturret:Value() then
  for _, i in pairs(GetTurrets()) do
    if i and i.team ~= myHero.team then
      if mPos3D(myHero.x, myHero.z, i.x, i.z, 950) then
        DrawCircle(i.x, i.y, i.z, i.range ,1,0, 0xFFFF0000)
      else
        DrawCircle(i.x, i.y, i.z, i.range ,1,0, GoS.White)
      end
    end
  end
end

if  self.Config.other.circler.enable:Value() then
  if  self.Config.other.circler.timer:Value()  then
    if Rpos and Rpos ~= nil then
    local drawpos=WorldToScreen(1,Rpos.x, Rpos.y, Rpos.z)
    DrawText("Shadow Duration :"..math.round(startTimer - os.clock(), 2).."s",15,drawpos.x,drawpos.y,GoS.White)
  end
end
end
    local rs = GetResolution()
    if PopUp1 then
      local w, h1, h2,size  = (rs.x*0.70), (rs.y*.15), (rs.y*.9), rs.y*.02
      DrawLine(w, h1/1.05, w, h2/1.97, w/1.75, ARGB(255, 0, 0, 0))
      DrawLine(w, h1, w, h2/1.97, w/1.75, ARGB(150, 235, 183, 63))
      DrawText(tostring("Welcome to Krystra Mid Series Beta"), rs.y*.028, (rs.x/2.65), (rs.y*.155), ARGB(255, 96, 48, 0))
      DrawText(tostring("Little informatation about Krystra Mid Series"), rs.y*.015, (rs.x/2.65), (rs.y*.194), ARGB(255, 96, 48, 0))
      DrawText(tostring("Its a bundle that produced by Krystra"), rs.y*.015, (rs.x/2.65), (rs.y*.210), ARGB(255, 255, 255, 255))
      DrawText(tostring("Currently it supported only mid champs "), rs.y*.015, (rs.x/2.65), (rs.y*.225), ARGB(255, 255, 255, 255))
      DrawText(tostring("I focus Quality rather than Quantity"), rs.y*.015, (rs.x/2.65), (rs.y*.240), ARGB(255, 255, 255, 255))
      DrawText(tostring("I need your feedbacks to improve it"), rs.y*.015, (rs.x/2.65), (rs.y*.255), ARGB(255, 255, 255, 255))
      DrawText(tostring("I care every single feedback and try to add everything"), rs.y*.015, (rs.x/2.65), (rs.y*.270), ARGB(255, 255, 255, 255))
      DrawText(tostring("Hope you are enjoy my script.."), rs.y*.015, (rs.x/2.65), (rs.y*.285), ARGB(255, 255, 255, 255))
      DrawText(tostring("You can change every settings to your like :)"), rs.y*.015, (rs.x/2.65), (rs.y*.300), ARGB(255, 255, 255, 255))
      DrawText(tostring("Did you like my script > Upvote me on script database and on forum"), rs.y*.015, (rs.x/2.65), (rs.y*.315), ARGB(255, 255, 255, 255))
      -- DrawText(tostring("Don't forget these are VIP;"), rs.y*.015, (rs.x/2.65), (rs.y*.330), ARGB(255, 96, 48, 0))
      -- DrawText(tostring("  Anti-Afk"), rs.y*.015, (rs.x/2.65), (rs.y*.345), ARGB(255, 255, 255, 255))
      -- DrawText(tostring("  Auto Leveler "), rs.y*.015, (rs.x/2.65), (rs.y*.360), ARGB(255, 255, 255, 255))
      -- DrawText(tostring("  Skin Changer "), rs.y*.015, (rs.x/2.65), (rs.y*.375), ARGB(255, 255, 255, 255))
      local w1, w2, h1, h2 = (rs.x/2)-50, (rs.x/2)+50, (rs.y*.70), (rs.y*.75)
      --DrawLine(w1, h1/1.775, w2, h1/1.775, 50, ARGB(255, 0, 0, 0))
      --DrawRectangleButton(rs.x*0.467, rs.y/2.375, rs.x*.047, rs.y*.041, ARGB(255, 255, 255, 255))
      FillRect((rs.x/2)-size+10, (rs.y/2)-150, 80, 30, ARGB(150, 235, 183, 63))
      DrawText(tostring("OK"),size, (rs.x/2)-size+10, (rs.y/2)-150, ARGB(255,0, 0, 0))
    end
    for _, target in pairs(GetEnemyHeroes()) do
      if ValidTarget(target, 15000) then
        if target.visible and not target.dead and self.Config.other.damage:Value() then
          currLine = 1
          -- DrawLineHPBar2(self:GetMyDmg(target),"",  target, currLine)
          DrawLineHPBar(self:GetMyDmg(target), "Damage " .. math.round(self:GetMyDmg(target)),target,currLine)
          currLine = currLine + 1
          DrawDmgOverHpBar(target,GetCurrentHP(target),0,self:GetMyDmg(target),0xff00ff00)
        end
      end
    end

    if self.Config.other.targetcal:Value() and not myHero.dead then
      if target and target ~= nil then
        --  local target= GetOrigin(target)
        local drawpos=WorldToScreen(1,target.x, target.y, target.z)
        local comboText,color = self:GetDraws(target)
        if comboText then
          DrawText(comboText,15,drawpos.x-20,drawpos.y-20,color)
        end
      end
    end
  end
  function Zed:buffcheck()
    if GotBuff(target, "zedrtargetmark")== 1 then
      return true
    else
      return false
    end
  end
  function Zed:UpdateBuff(unit,buff)
    if unit and unit.team ~= myHero.team and unit.type == myHero.type then
      if buff.Name:lower():find("zedulttargetmark") then
        Rbuff = true
      end
    end
  end
  function Zed:RemoveBuff(unit, buff)
    if unit and unit.team ~= myHero.team and unit.type == myHero.type then
      if buff.Name:lower():find("zedulttargetmark") then
        Rbuff = false
      end
    end
  end
  function Zed:Autoq()
        if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value()   and IsReady(_Q))then
          self:CastQ(target)
        end
  end
   function Zed:Autoe()
     if(self.Config.harass.useE:Value()  and IsReady(_E))then
      self:CastE()
    end
  end
  function Zed:escape()
    if self.Config.Keys.escapekey:Value()  then
  if self.Config.escape.useW:Value()  then
    if  IsReady(_W)  then
      CastSkillShot(_W, mousePos)
    else
      MoveToXYZ(mousePos)
    end
  end
end
end
  function Zed:Autoharass()
       if not (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value()  /100 ) then return end
           local Wposition =   GetOrigin(myHero) + (Vector(target) - GetOrigin(myHero)):normalized() * 700
    if  self.Config.harass.autoharass.harasslogic:Value() == 1 then
      if IsReady(_W) and IsReady(_Q) then
      if(GetDistance(target) <= self.W.range and self.Config.harass.useW:Value() and  IsReady(_W))then
      self:CastW( Wposition)
      end
 if  Wpos~= nil and target~= nil then
      if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value()   and IsReady(_Q))then
        DelayAction(function ()  self:CastWQ(target) end, 0.2)
      end
    end
  end
elseif self.Config.harass.autoharass.harasslogic:Value() == 2 then
    if IsReady(_W) and IsReady(_Q)and IsReady(_E) then
  if(GetDistance(target) <= self.W.range and self.Config.harass.useW:Value() and  IsReady(_W))then
      self:CastW( Wposition)
      end
      if  Wpos~= nil and target~= nil then
      if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value()   and IsReady(_Q))then
        DelayAction(function ()  self:CastWQ(target) end, 0.2)
      end
    end
     if(self.Config.harass.useE:Value()  and IsReady(_E))then
      self:CastE()
    end
  end
    elseif self.Config.harass.autoharass.harasslogic:Value() == 3 then
          if IsReady(_W) and IsReady(_E) then
      if(GetDistance(target) <= self.W.range and self.Config.harass.useW:Value() and  IsReady(_W))then
      self:CastW( Wposition)
      end
      if(self.Config.harass.useE:Value()  and IsReady(_E))then
      self:CastE()
    end
  end
end
  end
  function Zed:harass()
   if not (myHero.mana / myHero.maxMana >=  self.Config.harass.Mana:Value()  /100 ) then return end
      if(GetDistance(target) <= self.W.range and self.Config.harass.useW:Value() and  IsReady(_W))then
        local Wposition =   GetOrigin(myHero) + (Vector(target) - GetOrigin(myHero)):normalized() * 700
      self:CastW( Wposition)
      end

      if  Wpos~= nil and target~= nil then
      if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value()   and IsReady(_Q))then
        self:CastWQ(target)
      end
    else
      if not IsReady(_W) then
        if(GetDistance(target) <= self.Q.range and self.Config.harass.useQ:Value()   and IsReady(_Q))then
          self:CastQ(target)
        end
      end
    end
    if(self.Config.harass.useE:Value()  and IsReady(_E))then
      self:CastE()
    end

  end
  function Zed:LaneClear()
    if not ValidTarget(ClosestMinion(GetOrigin(myHero), MINION_ENEMY),  1000) then return end
 for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion, 1000)  and GetTeam(minion) == MINION_ENEMY then
                         if  not Wpos~= nil then
                        if MinionsAround(myHero, 290, MINION_ENEMY) >= self.Config.farm.laneclear.ecount:Value() then
                        if self.Config.farm.laneclear.useE:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.EMana:Value() /100 )  then
                             CastSpell(_E)
                        end
                      end
                    elseif Wpos~= nil then
 if MinionsAround(Wpos, 290, MINION_ENEMY) >= self.Config.farm.laneclear.ecount:Value() then
                        if self.Config.farm.laneclear.useE:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.EMana:Value() /100 )  then
                             CastSpell(_E)
                        end
                      end
                    end
                    if (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.WMana:Value() /100 ) then
                      if IsReady(_W) then
                        if  self.Config.farm.laneclear.useW:Value()   then
                           local Wposition =   Vector(minion)
                          self:CastW( Wposition) 
                          end
                        end
                      end
                               end
                  end
                  if IsReady(_Q) then
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.laneclear.QMana:Value() /100 ) then
                      local NumberOfHits = self.Config.farm.laneclear.qcount:Value()
                        if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.laneclear.useQ:Value()  then
                          local BestPos, BestHit = GetLineFarmPosition(self.Q.range, self.Q.width, MINION_ENEMY)
                          if BestPos  and BestHit >= NumberOfHits then
                            CastSkillShot(_Q, BestPos)
                          end
                        end
                      end
                    end
                  end
function Zed:LastHit()
  for _, target in pairs(minionManager.objects) do
  if GetTeam(target) == MINION_ENEMY then
   local QPred = GetPrediction(target, self.Q)
   if QPred:mCollision(1) then
    qdamage123 =self:GetQ2Dmg(target)
  else
    qdamage123 =self:GetQDmg(target)
  end
end
end
for _, target in pairs(minionManager.objects) do
  if GetTeam(target) == MINION_ENEMY then
    if IsObjectAlive(target) then
      if self.Config.farm.lasthit.lasthitlogic:Value() == 1 then
        if(IsReady(_Q) and self.Config.farm.lasthit.useQ:Value() and ValidTarget(target,900)   and qdamage123 >= GetCurrentHP(target)) then
          self:CastQ(target)
        end
        local Edamage = self:GetEDmg(target)
        if(IsReady(_E)and self.Config.farm.lasthit.useE:Value() and  ValidTarget(target,290) and Edamage >= GetCurrentHP(target)) then
   CastSpell(_E)
        end
      end
    end
  end
end
end
function Zed:JungleClear()
      if not ValidTarget(ClosestMinion(GetOrigin(myHero), MINION_JUNGLE),  1000) then return end
 for i, minion in pairs(minionManager.objects) do
                      if ValidTarget(minion, 1000) and minion ~= nil and GetTeam(minion) == MINION_JUNGLE then
                        if self.Config.farm.jungleclear.useE:Value() and ( myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.EMana:Value() /100 ) and GetDistance(minion) <= 290 then
                             CastSpell(_E)
                        end
                    if (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.WMana:Value() /100 ) then
                      if IsReady(_W) then
                        if  self.Config.farm.jungleclear.useW:Value()   then
                           local Wposition =   Vector(minion)
                       self:CastW( Wposition) 
                          end
                        end
                      end
                    if (myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.QMana:Value() /100 ) then
                      local NumberOfHits = self.Config.farm.laneclear.qcount:Value()
                      if IsReady(_Q) then
                        if self.Config.Keys.laneclearkey:Value()  and self.Config.farm.jungleclear.useQ:Value()  then
                          local BestPos, BestHit = GetLineFarmPosition(self.Q.range, self.Q.width, MINION_JUNGLE)
                          if BestPos  and BestHit >= 1 then
                            CastSkillShot(_Q, BestPos)
                          end
                        end
                      end
                    end
                  end
         end
                  end

  function Zed:Combo()

    if  Rpos~= nil and target~= nil then
      if  self.Config.combo.rlogic:Value() == 1 then
        Wcastpos = (Vector(target)+ (Vector(target)  - Rpos):normalized() * 600)
      elseif self.Config.combo.rlogic:Value() == 2 then
        Wcastpos = (Vector(target)+ (Vector(target)  - Rpos):normalized() * 350):perpendicular()
      elseif self.Config.combo.rlogic:Value() == 3 then
        Wcastpos = mousePos
      end
    end
    if IsReady(_R) then
      if(GetDistance(target) <= 615 and self.Config.combo.useR:Value())then
        self:CastR(target)
      end
    end

    if self:buffcheck()== true then
      if(GetDistance(target) <= self.W.range and self.Config.combo.useW:Value()  and IsReady(_W))then
        if  Rpos~= nil and target~= nil then
          DelayAction(function ()  self:CastW(Wcastpos) end, 0.2)
        end
      end
    elseif self:buffcheck()== false then
      if(GetDistance(target) <= self.W.range and self.Config.combo.useW:Value() and  IsReady(_W))then
                 if not self.Config.combo.secondw:Value() then
                          local Wposition =   GetOrigin(myHero) + (Vector(target) - GetOrigin(myHero)):normalized() * 700
          DelayAction(function ()  self:CastW(Wposition) end, 0.21)
        elseif self.Config.combo.secondw:Value() then
           DelayAction(function ()    CastSkillShot(_W, target) end, 0.21)
         end
      end
    end

    if  Wpos~= nil and target~= nil then
      if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value()   and IsReady(_Q))then
        self:CastWQ(target)
      end
    else
      if not IsReady(_W) then
        if(GetDistance(target) <= self.Q.range and self.Config.combo.useQ:Value()   and IsReady(_Q))then
          self:CastQ(target)
        end
      end
    end

    if(self.Config.combo.useE:Value()  and IsReady(_E))then
      self:CastE()
    end
    if(self.Config.combo.useI:Value() and self.Config.Keys.combokey:Value()  )then
      for _, unit in pairs(GetEnemyHeroes()) do
        local dmgI =(50+ ((myHero.level)*20))
        local health=unit.health
        if(health<dmgI and self.Config.combo.useI:Value() and GetDistance(unit)<600)then
          self:CastI(unit)
        end
      end
    end

 if IsReady(_W) then
  if self.Config.combo.wgap:Value() then
   if not IsInDistance(target,850) and  ValidTarget(target,1250)  and self.Config.combo.useW:Value() then
     local Wposition =   GetOrigin(myHero) + (Vector(target) - GetOrigin(myHero)):normalized() * 700 
       CastSkillShot(_W, Wposition)
       wgapclose = true
       DelayAction(function ()  wgapclose = false end, 5)
      end
    end
    end

if  self.Config.item.yahu.yahug:Value() then
  if Yahu and IsReady(Yahu) and IsInDistance(target, self.Config.item.yahu.yahud:Value()) then
    if  wgapclose  then
     DelayAction(function ()CastTargetSpell(target, Yahu)end, 0.35)
end
end
end

if    self.Config.combo.turnback.swaphp:Value()  then
  if  (myHero.health / myHero.maxHealth <=  self.Config.combo.turnback.currenthp:Value() /100 ) then
  if (IsInDistance(target,900)  and self.Config.combo.useW:Value()  and IsReady(_W))then
    self:CastW2(myHero.pos)
        end
      end
    end
  end
  function Zed:comboitems()
        if self.Config.combo.useitem:Value() then
 if IsReady(_R)  then
    if    Wpos ~= nil and Rpos ~= nil and  GetCastName(myHero,_R)  == "zedr2" then
if  self.Config.item.bg.usebg:Value()   then
if Blg and IsReady(Blg) and ValidTarget(target, 550 ) then
     DelayAction(function ()CastTargetSpell(target, Blg)end, 0.35)
end
end

if  self.Config.item.yahu.yahuc:Value()   then
if Yahu and IsReady(Yahu) and ValidTarget(target, 550 ) then
     DelayAction(function ()CastTargetSpell(target, Yahu)end, 0.35)
end
end

if self.Config.item.tiamat.usetiac:Value()  then
if Tia and IsReady(Tia) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
     DelayAction(function ()CastSpell(Tia)end, 0.35)
end
end

if self.Config.item.Rhydra.userhc:Value() then
if Rhyd and IsReady(Rhyd) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
     DelayAction(function ()CastSpell(Rhyd)end, 0.35)
end
end

if self.Config.item.thydra.useth:Value() then
if Thyd and IsReady(Thyd) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
    DelayAction(function () CastSpell(Thyd)end, 0.35)
end
end


if self.Config.item.btk.usebtk:Value()  then
if Btk and IsReady(Btk) and ValidTarget(target, 550 ) then
    DelayAction(function () CastTargetSpell(target, Btk)end, 0.35)
end
end


if self.Config.item.randuin.userand:Value() then
if Rand and IsReady(Rand) and EnemiesAround(myHero, 450 )>= self.Config.item.randuin.minrand:Value() then
    DelayAction(function () CastSpell(Rand)end, 0.35)
end
end
end
end
end
if not IsReady(_R) then
if  self.Config.item.bg.usebg:Value()  then
if Blg and IsReady(Blg) and ValidTarget(target, 550 ) then
  DelayAction(function () CastTargetSpell(target, Blg)end, 0.35)
end
end

if  self.Config.item.yahu.yahuc:Value()   then
if Yahu and IsReady(Yahu) and ValidTarget(target, 550 ) then
     DelayAction(function ()CastTargetSpell(target, Yahu)end, 0.35)
end
end

if self.Config.item.tiamat.usetiac:Value()  then
if Tia and IsReady(Tia) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
   DelayAction(function () CastSpell(Tia)end, 0.35)
end
end

if self.Config.item.Rhydra.userhc:Value()  then
if Rhyd and IsReady(Rhyd) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
  DelayAction(function () CastSpell(Rhyd)end, 0.35)
end
end

if self.Config.item.thydra.useth:Value()  then
if Thyd and IsReady(Thyd) and ValidTarget(target, 300) and GetDistance(target) <= 300 then
  DelayAction(function ()CastSpell(Thyd)end, 0.35)
end
end


if self.Config.item.btk.usebtk:Value()   then
if Btk and IsReady(Btk) and ValidTarget(target, 550 ) then
   DelayAction(function ()CastTargetSpell(target, Btk)end, 0.35)
end
end


if self.Config.item.randuin.userand:Value()  then
if Rand and IsReady(Rand) and EnemiesAround(myHero, 450 )>= self.Config.item.randuin.minrand:Value() then
   DelayAction(function ()CastSpell(Rand)end, 0.35)
end
end
end
end
function Zed:clearitems()
if self.Config.item.tiamat.usetiacl:Value() and ( self.Config.Keys.laneclearkey:Value() or self.Config.Keys.jungleclearkey:Value() ) then
if Tia and IsReady(Tia) then
  if self.Config.item.tiamat.tiamatlogic:Value() == 1 and MinionsAround(myHero, 400, MINION_ENEMY) >=1 then
    CastSpell(Tia)
  elseif self.Config.item.tiamat.tiamatlogic:Value() == 2 then
    if MinionsAround(myHero, 400, MINION_ENEMY) >=self.Config.item.tiamat.mintia:Value() then
      CastSpell(Tia)
    end
  end
end
end

if self.Config.item.Rhydra.userhcl:Value() and ( self.Config.Keys.laneclearkey:Value() or self.Config.Keys.jungleclearkey:Value() ) then
if Rhyd and IsReady(Rhyd) then
  if self.Config.item.Rhydra.Rhydralogic:Value() == 1 and MinionsAround(myHero, 400, MINION_ENEMY) >=1  then
    CastSpell(Rhyd)
  elseif self.Config.item.Rhydra.Rhydralogic:Value() == 2 then
    if MinionsAround(myHero, 400 , MINION_ENEMY) >=self.Config.item.Rhydra.minrhydra:Value() then
      CastSpell(Rhyd)
    end
  end
end
end

if self.Config.item.thydra.usethl:Value() and ( self.Config.Keys.laneclearkey:Value() or self.Config.Keys.jungleclearkey:Value() ) then
if Thyd and IsReady(Thyd) then
  if self.Config.item.thydra.Thydralogic:Value() == 1 and MinionsAround(myHero, 400, MINION_ENEMY) >=1  then
    CastSpell(Thyd)
  elseif self.Config.item.thydra.Thydralogic:Value() == 2 then
    if MinionsAround(myHero, 400, MINION_ENEMY) >=self.Config.item.thydra.minthydra:Value() then
      CastSpell(Thyd)
    end
  end
end
end

end
  function  Zed:ProcessSpell(unit, spell)
    if unit == myHero then
      if unit and spell then
        if spell.name:lower():find("zedw") then
          Wpos = Vector(spell.endPos)
          wdt = 5
          Wdmgp = true
            startTime = os.clock() + 5
        elseif spell.name:lower():find("zedw2") then
          Wpos = Vector(spell.startPos)
        end

        if spell.name:lower():find("zedr") then
          Rpos = Vector(spell.startPos)
          rdt = 7.5
  Rdmgp = true
  startTimer = os.clock() + 7.5
        elseif spell.name:lower():find("zedr2") then
          Rpos = GetOrigin(myHero)
        end
      end
    end
    local R = GetTickCount()
    if (GR + 10) < R then
      if rdt == 7.5 then
        DelayAction(function()
        rdt = nil
        Rpos = nil
        Rdmgp = false
        startTimer = 0
        end, rdt)
      end
      GR = R
    end

    local W = GetTickCount()
    if (GW + 10) < W then
      if wdt == 5 then
        DelayAction(function()
        wdt = nil
        Wpos = nil
           Wdmgp = false
           startTime = 0
        end, wdt)
      end
      GW = W
    end
  end
  function Zed:CastQ(unit)
    if self.Config.pred.selectpred:Value() == 1 then
      local QPred = GetPrediction(unit, self.Q)
      if IsReady(_Q) then
        if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100) then
          CastSkillShot(_Q, QPred.castPos)
        end
      end
    elseif self.Config.pred.selectpred:Value() == 2 then
      if ipred then
        local HitChance, y = qSpell:Predict(unit)
        if IsReady(_Q) and HitChance >= 3 then
          CastSkillShot(_Q, y.x, y.y, y.z)
        end
      end
    elseif self.Config.pred.selectpred:Value() == 3 then
      local qPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1700, 250, 900, 50, false, true)
      if IsReady(_Q) and qPred.HitChance == 1 then
        CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
      end
    end
  end
  function Zed:CastWQ(unit)
    if Wpos and Wpos ~=nil  then
      if self.Config.pred.selectpred:Value() == 1 then
        local QPred = GetPrediction(unit, self.Q , Wpos)
        local QPred2 = GetPrediction(unit, self.Q )
        if IsReady(_Q) then
          if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100) and QPred2 and QPred2.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100)  then
            CastSkillShot(_Q, QPred.castPos)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 2 then
        if ipred then
          local HitChance, y = qSpell:Predict(unit)
          if IsReady(_Q) and HitChance >= 3 then
            CastSkillShot(_Q, y.x, y.y, y.z)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 3 then
        local qPred = GetPredictionForPlayer(Wpos, unit, GetMoveSpeed(unit), 1700, 250, 900, 50, false, true)
        if IsReady(_Q) and qPred.HitChance == 1 then
          CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
        end
      end
    end
  end
  function Zed:CastRQ(unit)
    if Rpos and Rpos ~=nil  then
      if self.Config.pred.selectpred:Value() == 1 then
        local QPred = GetPrediction(unit, self.Q, Rpos)
        if IsReady(_Q) then
          if QPred  and QPred.hitChance >= (self.Config.pred.hcgeneral.hcop.hcopq:Value()/100) then
            CastSkillShot(_Q, QPred.castPos)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 2 then
        if ipred then
          local HitChance, y = qSpell:Predict(unit)
          if IsReady(_Q) and HitChance >= 3 then
            CastSkillShot(_Q, y.x, y.y, y.z)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 3 then
        local qPred = GetPredictionForPlayer(Rpos, unit, GetMoveSpeed(unit), 1700, 250, 900, 50, false, true)
        if IsReady(_Q) and qPred.HitChance == 1 then
          CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
        end
      end
    end
  end
  function Zed:CastW( pos)
    if  GetCastName(myHero,_W)  == "ZedW2" then return end
    if IsReady(_W) then
      local Ticker = GetTickCount()
      if (global_ticks + 6000) < Ticker then
        CastSkillShot(_W, pos)
        global_ticks = Ticker
        DelayAction(function()   CastSkillShot(_W, pos) end, 6)
      end
    end
  end
  function Zed:CastW2( pos)
    if GetCastName(myHero,_W)  == "ZedW2" then
      if IsReady(_W) then
        CastSkillShot(_W, pos)
      end
    end
  end
  function Zed:CastE()
    if IsReady(_E) then
      if Rpos and  Rpos ~=nil  then
        if GetDistance(Rpos, target) <= self.E.range then
          CastSpell(_E)
        end
      end
    end
    if IsReady(_E) then
      if Wpos and Wpos ~=nil  then
        if GetDistance(Wpos, target) <= self.E.range then
          CastSpell(_E)
        end
      end
    end
    if IsReady(_E) then
      if GetDistance(target) <= self.E.range then
        CastSpell(_E)
      end
    end
  end
  function Zed:CastR(unit)
    if GetCastName(myHero,_R)  == "ZedR" then
      if IsReady(_R) then
        CastTargetSpell(unit, _R)
      end
    end
  end
  function Zed:CastR2(unit)
    if GetCastName(myHero,_R)  == "ZedR2" then
      if IsReady(_R) then
        CastTargetSpell(unit, _R)
      end
    end
  end
  function Zed:CastI(unit)
    if Ignite then
      if IsReady(Ignite) then
        CastTargetSpell(unit, Ignite)
      end
    end
  end
  function Zed:onload()
    self:findorb()
  end
  function Zed:divelogic(unit)
    if not self.Config.misc.turretdive.use:Value() then
      return true
    end

    if UnderTurret(unit, true) then
      for _, turret in pairs(GetTurrets()) do
        if turret and turret.team ~= myHero.team and GetDistance(turret,myHero) <=1200 then
          if self.Config.misc.turretdive.turretdivelogic:Value() == 1 then
            if MinionsAround(turret, 950, MINION_ALLY) >=self.Config.misc.turretdive.normalmode:Value() and (myHero.health / myHero.maxHealth >= self.Config.misc.turretdive.health:Value() /100 ) then
              return true
            else return false
            end
          elseif  self.Config.misc.turretdive.turretdivelogic:Value() == 2  then
            if MinionsAround(turret, 950, MINION_ALLY) >=self.Config.misc.turretdive.krystramode:Value() and AlliesAround(turret, 950)>=self.Config.misc.turretdive.krystramode2:Value() and (myHero.health / myHero.maxHealth >= self.Config.misc.turretdive.health:Value() /100 ) then
              return true
            else return false
            end
          end
        end
      end
    else
      return true
    end
  end
  function Zed:GetQ2Dmg(target)
    if GetCastLevel(myHero, _Q)< 1 then
                return 0
              end
              if IsReady(_Q) then
                local FinalDamage = (17.5 + (GetCastLevel(myHero, _Q)* 20) +GetBonusDmg(myHero)*0.5)
                return CalcDamage(myHero,target, FinalDamage,0)
              else
                return 0
              end
            end
  function Zed:GetQDmg(target)
    if GetCastLevel(myHero, _Q)< 1 then
      return 0
    end
    if IsReady(_Q) then
      if Wdmgp then
        local FinalDamage = (35 + (GetCastLevel(myHero, _Q)* 40) +  GetBonusDmg(myHero)) + (17.5 + (GetCastLevel(myHero, _Q)* 20) +GetBonusDmg(myHero)*0.5)
        return CalcDamage(myHero,target, FinalDamage,0)
      elseif Rdmgp then
        local FinalDamage = (35 + (GetCastLevel(myHero, _Q)* 40) +  GetBonusDmg(myHero)) + (17.5 + (GetCastLevel(myHero, _Q)* 20) +GetBonusDmg(myHero)*0.5)
        return CalcDamage(myHero,target, FinalDamage,0)
      elseif (Wdmgp and Rdmgp) then
        local FinalDamage = (35 + (GetCastLevel(myHero, _Q)* 40) +  GetBonusDmg(myHero)) + (17.5 + (GetCastLevel(myHero, _Q)* 20) +GetBonusDmg(myHero)*0.5)*2
        return CalcDamage(myHero,target, FinalDamage,0)
      elseif not (Wdmgp and Rdmgp) then
        local FinalDamage = (35 + (GetCastLevel(myHero, _Q)* 40) +  GetBonusDmg(myHero))
        return CalcDamage(myHero,target, FinalDamage,0)
          end
      else
        return 0
      end
    end
    function Zed:GetEDmg(target)
      if GetCastLevel(myHero, _E) < 1 then
        return 0
      end
      if IsReady(_E) then
        local FinalDamage = ( 30+ (GetCastLevel(myHero, _E) * 30) +  (GetBonusDmg(myHero))*0.8)
        return CalcDamage(myHero,target,FinalDamage, 0)
      else
        return 0
      end
    end
    local ratio = {0.20, 0.225, 0.25, 0.275, 0.30}
    function Zed:GetRDmg(target)
  local rlvl = GetCastLevel(myHero, _R)
      if GetCastLevel(myHero, _R) < 1 then
        return 0
      end
      if IsReady(_R) then
        local edmg =self:GetEDmg(target)
        local qdmg =self:GetQDmg(target)
        local dmggive = edmg + qdmg
        local FinalDamage = (myHero.totalDamage) + (dmggive * ratio[rlvl])
        return CalcDamage(myHero,target, FinalDamage,0)
      else
        return 0
      end
    end
function Zed:GetMyDmg(target)
if IsReady(_Q) and IsReady(_R) and IsReady(_E) then
  return self:GetQDmg(target) + self:GetRDmg(target) + self:GetEDmg(target)
elseif IsReady(_Q)  and IsReady(_E) then
  return self:GetQDmg(target) + self:GetEDmg(target)
elseif IsReady(_R) and IsReady(_E) then
  return self:GetRDmg(target) +self:GetEDmg(target)
elseif IsReady(_Q) then
  return self:GetQDmg(target)
elseif IsReady(_E) then
  return self:GetEDmg(target)
elseif IsReady(_R) then
  return self:GetRDmg(target)
elseif IsReady(_Q) and IsReady(_R) then
  return self:GetQDmg(target) + self:GetRDmg(target)
else
  return 0
end
end
function Zed:GetDraws(target)
local qdamage = self:GetQDmg(target)
local edamage = self:GetEDmg(target)
local rdamage = self:GetRDmg(target)
local Idmg=(50+ ((myHero.level)*20))

if qdamage >target.health then
  return 'Q', GoS.White
elseif qdamage+ Idmg>target.health then
  return 'Q + Ignite', GoS.White
elseif edamage >target.health then
  return 'E', GoS.White
elseif edamage + Idmg>target.health then
  return 'E + Ignite', GoS.White
elseif rdamage  >target.health then
  return 'R', GoS.White
elseif rdamage + Idmg>target.health then
  return 'R + Ignite', GoS.White
elseif rdamage +edamage  >target.health then
  return 'R + E',GoS.White
elseif rdamage +edamage+ Idmg>target.health then
  return 'R + E + Ignite',GoS.White
elseif qdamage+edamage>target.health then
  return 'Q + E',GoS.White
elseif qdamage+rdamage >target.health then
  return 'Q + R',GoS.White
elseif qdamage+edamage+ Idmg>target.health then
  return 'Q + E + Ignite',GoS.White
elseif qdamage+rdamage+ Idmg>target.health then
  return 'Q + R + Ignite',GoS.White
elseif qdamage+edamage+rdamage >target.health then
  return 'Kill with full combo',GoS.White
elseif qdamage+edamage+rdamage+ Idmg>target.health then
  return 'Full Combo + Ignite',GoS.White
else
  return "Cant Kill yet", GoS.White
end
end
    function Zed:killsteal()
      for _, unit in pairs(GetEnemyHeroes()) do
        local health = GetCurrentHP(unit)
        local dmgE = self:GetEDmg(unit)
        if(GetDistance(target) <= self.E.range and  IsReady(_E) and not self.Config.Keys.combokey:Value()   and health<dmgE and self.Config.killsteal.useE:Value()   and self.Config.killsteal.ks:Value())then
          self:CastE(unit)
        end
        local dmgQ = self:GetQDmg(unit)
        if(GetDistance(target) <= self.Q.range and  IsReady(_Q) and not self.Config.Keys.combokey:Value()   and health<dmgQ and self.Config.killsteal.useQ:Value() and self.Config.killsteal.ks:Value() )then
          self:CastQ(unit)
        end
        local dmgI =(50+ ((myHero.level)*20))
        if(health<dmgI and self.Config.killsteal.useI:Value() and self.Config.killsteal.ks:Value() and GetDistance(unit)<600)then
          self:CastI(unit)
        end
      end
    end
    function Zed:LoadMenu()
      self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )
      self.Config:Menu("combo",loc_eng[1])
      self.Config.combo:Menu( "turnback","W/R Turn back settings")
      self.Config.combo.turnback:Boolean("targetdied", "Turn Back if target died.", false)
      self.Config.combo.turnback:Boolean("swaphp", "Swap W/R if my hp % <=", false)
      self.Config.combo.turnback:Slider("currenthp","Swap W/R if my hp % <= "  , 10, 10, 100, 1)
      self.Config.combo:Boolean("useQ", loc_eng[2], true)
      self.Config.combo:Boolean("useW", loc_eng[3], true)
      self.Config.combo:Boolean("useE", loc_eng[4], true)
      self.Config.combo:Boolean("useR", loc_eng[5], true)
      self.Config.combo:DropDown("rlogic", "Combo Logic",   1, {"Use Line Mode", "Use Rectangle Mode", "Use Mouse Position"})
      self.Config.combo:Boolean("useI", loc_eng[6], true)
      self.Config.combo:Info("blank", ""   )
      self.Config.combo:Info("blank", "Extra Settings"   )
       self.Config.combo:Boolean("secondw", "Use second W to Chase", false)
      self.Config.combo:Boolean("useitem", "Use Items After R", true)
      self.Config.combo:Boolean("wgap", "Use W to Gap Close", false)
      self.Config.combo:Slider("Mana","Energy Manager %"   , 10, 10, 100, 1)

      self.Config:Menu( "harass",loc_eng[9])
      self.Config.harass:Menu( "autoharass","Auto Harass Settings")
      self.Config.harass.autoharass:Boolean("use", "Use Special Auto Harass", false)
      self.Config.harass.autoharass:DropDown("harasslogic", "Special harass Mode",   1, {"QW", "QWE", "WE"})
      self.Config.harass.autoharass:Boolean("useQ", "Use Auto Q Harass", false)
      self.Config.harass.autoharass:Boolean("useE", "Use Auto E Harass", false)
      self.Config.harass:Boolean("useQ", loc_eng[10], true)
      self.Config.harass:Boolean("useW", loc_eng[11], true)
      self.Config.harass:Boolean("useE", loc_eng[12], true)
      self.Config.harass:Slider("Mana","Energy Manager %"  , 10, 10, 100, 1)

      self.Config:Menu( "farm",loc_eng[14])

      self.Config.farm:Menu("laneclear",loc_eng[15])
      self.Config.farm.laneclear:Boolean("useQ",loc_eng[16], true)
      self.Config.farm.laneclear:Slider("qcount",loc_eng[180]   , 2, 1, 10, 1)
      self.Config.farm.laneclear:Boolean("useW",loc_eng[17], false)
      self.Config.farm.laneclear:Boolean("useE",loc_eng[18], false)
      self.Config.farm.laneclear:Slider("ecount",loc_eng[182]   , 2, 1, 10, 1)
      self.Config.farm.laneclear:Info("blank", ""   )
      self.Config.farm.laneclear:Info("blank", ""   )
      self.Config.farm.laneclear:Info("info2", "           [Energy Manager]"  )
      self.Config.farm.laneclear:Slider("QMana","Q Skill Energy Manager  %"   , 30, 10, 100, 1)
      self.Config.farm.laneclear:Slider("WMana","W Skill Energy Manager  %"    , 30, 10, 100, 1)
      self.Config.farm.laneclear:Slider("EMana","E Skill Energy Manager  %"   , 30, 10, 100, 1)

      self.Config.farm:Menu("jungleclear",loc_eng[20])
      self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21], true)
      self.Config.farm.jungleclear:Boolean("useW",loc_eng[22], true)
      self.Config.farm.jungleclear:Boolean("useE",loc_eng[23], true)
      self.Config.farm.jungleclear:Info("blank", ""   )
      self.Config.farm.jungleclear:Info("blank", ""   )
      self.Config.farm.jungleclear:Info("info2", "           [Energy Manager]"  )
      self.Config.farm.jungleclear:Slider("QMana","Q Skill Energy Manager  %"  , 30, 10, 100, 1)
      self.Config.farm.jungleclear:Slider("WMana","W Skill Energy Manager  %"    , 30, 10, 100, 1)
      self.Config.farm.jungleclear:Slider("EMana","E Skill Energy Manager  %"    , 30, 10, 100, 1)


      self.Config.farm:Menu("lasthit",loc_eng[25])
      self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189], false)
      self.Config.farm.lasthit:Boolean("useQ",loc_eng[26], true)
      self.Config.farm.lasthit:Boolean("useE",loc_eng[28], true)
      self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191],   1, {loc_eng[172],loc_eng[174]})
      self.Config.farm.lasthit:Info("blank", ""   )
      self.Config.farm.lasthit:Info("blank", ""   )
      self.Config.farm.lasthit:Info("info2", "           [Energy Manager]"   )
      self.Config.farm.lasthit:Slider("QMana","Q Skill Energy Manager  %"   , 30, 10, 100, 1)
      self.Config.farm.lasthit:Slider("EMana","E Skill Energy Manager  %"   , 30, 10, 100, 1)

      self.Config:Menu("escape",loc_eng[30])
      self.Config.escape:Boolean("useW",loc_eng[32],true)

      self.Config:Menu("killsteal",loc_eng[35])
      self.Config.killsteal:Boolean("ks",loc_eng[36], true)
      self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
      self.Config.killsteal:Boolean("useE", loc_eng[39], true)
      self.Config.killsteal:Boolean("useI", loc_eng[41], true)

      self.Config:Menu( "item",loc_eng[42])
      self.Config.item:Menu( "autopot",loc_eng[192])
      self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
      self.Config.item.autopot:Slider("autopothp", loc_eng[194] , 10, 0, 100, 1)
      self.Config.item:Menu( "tiamat","Tiamat Settings")
      self.Config.item.tiamat:Boolean("usetiac", "Use Tiamat in combo",  false)
      self.Config.item.tiamat:Boolean("usetiacl", "Use Tiamat in clear",  false)
      self.Config.item.tiamat:DropDown("tiamatlogic","Tiamat logic for clear",   1, {"Always","Depends on Minion Count"})
      self.Config.item.tiamat:Slider("mintia","Minimum Minion to Tiamat"   , 1, 1, 6, 1)
      self.Config.item:Menu( "Rhydra","Ravenous Hydra Settings")
      self.Config.item.Rhydra:Boolean("userhc", "Use Ravenous Hydra in combo ",  false)
      self.Config.item.Rhydra:Boolean("userhcl", "Use Ravenous Hydra in clear ",  false)
      self.Config.item.Rhydra:DropDown("Rhydralogic","Ravenous Hydra logic for clear",   1, {"Always","Depends on Minion Count"})
      self.Config.item.Rhydra:Slider("minrhydra","Minimum Minion to Ravenous Hydra"   , 1, 1, 6, 1)
      self.Config.item:Menu( "thydra","Titanic Hydra Settings")
      self.Config.item.thydra:Boolean("useth", "Use Titanic Hydra in combo",  false)
      self.Config.item.thydra:Boolean("usethl", "Use Titanic Hydra in clear",  false)
      self.Config.item.thydra:DropDown("Thydralogic","Titanic Hydra logic for clear",   1, {"Always","Depends on Minion Count"})
      self.Config.item.thydra:Slider("minthydra","Minimum Minion to Titanic Hydra"   , 1, 1, 6, 1)
      self.Config.item:Menu( "bg","Bilgewater Settings")
      self.Config.item.bg:Boolean("usebg", loc_eng[46],  false)
             self.Config.item:Menu( "yahu","Youmuu's Ghostblade Settings")
      self.Config.item.yahu:Boolean("yahuc", "Use in combo" ,  false)
       self.Config.item.yahu:Boolean("yahug", "Use after gapclose" ,  false)
              self.Config.item.yahu:Slider("yahud","Minimum distance ( Gap close )"   , 550, 100, 1000, 1)
      self.Config.item:Menu( "btk","Blade of the Ruined King Settings")
      self.Config.item.btk:Boolean("usebtk", "Use Blade of the Ruined King",  false)
      self.Config.item:Menu( "randuin","Randuin's Omen Settings")
      self.Config.item.randuin:Boolean("userand", "Use Randuin's Omen",  false)
      self.Config.item.randuin:Slider("minrand","Minimum Enemy to Randuin's Omen"   , 1, 1, 5, 1)
      self.Config.item:Menu( "qss","QSS settings")
      self.Config.item.qss:Boolean("useqss", "Use QSS",  false)

      self.Config:Menu( "misc",loc_eng[92])
      --self.Config.misc:Menu( "autowall","[" .. myHero.charName.. "] - Evade Settings")
     -- self.Config.misc:Menu( "antigap","[" .. myHero.charName.. "] - Anti Gap Closer Settings")
      --self.Config.misc.antigap:Info("info3", loc_eng[98] )
      self.Config.misc:Menu( "turretdive","[" .. myHero.charName.. "] - Turret Dive Settings")
      self.Config.misc.turretdive:Boolean("use", "Use Turret Dive Settings", false)
      self.Config.misc.turretdive:DropDown("turretdivelogic","Turret Dive Mode",   1, {"Normal Mode","Krystra Mode"})
      self.Config.misc.turretdive:Boolean("Drawturret", "Draw Turret Range", false)
      self.Config.misc.turretdive:Info("blank", ""   )
      self.Config.misc.turretdive:Info("blank", "Normal Mode Settings >"   )
      self.Config.misc.turretdive:Slider("normalmode", "Minimum Number of Ally Minions" , 3, 1, 8, 1)
      self.Config.misc.turretdive:Slider("health", "Do not dive if my health > % ", 30, 0, 100, 1)
      self.Config.misc.turretdive:Info("blank", ""   )
      self.Config.misc.turretdive:Info("blank", "Krystra Mode Settings >"   )
      self.Config.misc.turretdive:Slider("krystramode", "Minimum Number of Ally Minions" , 3, 1, 8, 1)
      self.Config.misc.turretdive:Slider("krystramode2", "Minimum Number of Ally Champions" , 2, 1, 4, 1)
      self.Config.misc.turretdive:Slider("health1", "Do not dive if my health > % ", 30, 0, 100, 1)
      self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
      self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
      self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
      self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
      self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
      self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
      self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
      self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)

      Clock = os.clock()


      self.Config:Menu("other",loc_eng[65])
      self.Config.other:Menu( "circlew","Circle for W Shadow")
      self.Config.other.circlew:Boolean("enable","Enable", true)
      self.Config.other.circlew:Boolean("timer","Draw Shadow Time", true)
      self.Config.other.circlew:ColorPick("Wcolor", "Color",   {255, 255, 255, 255})
      self.Config.other.circlew:Slider("Wwidth", "Width", 1, 1, 10, 1)
      self.Config.other:Menu( "circler","Circle for R Shadow")
      self.Config.other.circler:Boolean("enable","Enable", true)
      self.Config.other.circler:Boolean("timer","Draw Shadow Time", true)
      self.Config.other.circler:ColorPick("Wcolor", "Color",   {255, 255, 255, 255})
      self.Config.other.circler:Slider("Wwidth", "Width", 1, 1, 10, 1)
      self.Config.other:Menu( "draw",loc_eng[66])
      self.Config.other.draw:Boolean("qdraw",loc_eng[67], true)
      self.Config.other.draw:Boolean("wdraw",loc_eng[68], true)
      self.Config.other.draw:Boolean("edraw",loc_eng[69], true)
      self.Config.other.draw:Boolean("rdraw",loc_eng[70], true)
      self.Config.other.draw:Boolean("aadraw",loc_eng[71], false)
      self.Config.other:Menu( "color", loc_eng[198])
      self.Config.other.color:ColorPick("Qcolor", loc_eng[199],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("Wcolor", loc_eng[200],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("Ecolor", loc_eng[201],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("Rcolor", loc_eng[202],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("AAcolor", loc_eng[204],   {255, 255,0,0})
      self.Config.other:Boolean("combomode",loc_eng[72], true)
      self.Config.other:Boolean("damage",loc_eng[214], true)
      self.Config.other:Boolean("targetcal",loc_eng[76], true)

      self.Config:Menu("targetsel",loc_eng[77])
      self.Config.targetsel:Boolean("ts",loc_eng[78], false)


      self.Config:Menu("orb","Orbwalker Settings")
      self.Config.orb:Menu( "selectorb","Current Orbwalker :")

      self.Config:Menu("pred","Prediction Settings")
      self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
      self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
      self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
      self.Config.pred.hcgeneral.hcop:Slider("hcopq", "Q Hitchance " , 30, 0, 100, 1)
      self.Config.pred:Info("blank", "    Currently Open Prediction "   )
      self.Config.pred:Info("blank", "      is best with this bundle"   )


      self.Config:Menu( "Keys",loc_eng[79])
      self.Config.Keys:Info("infoK3", loc_eng[80]   )
      self.Config.Keys:Key("combokey", loc_eng[81], string.byte(" "))
      self.Config.Keys:Key("combomode", loc_eng[129],  string.byte("2"))
      self.Config.Keys:Info("infoK4", loc_eng[82]   )
      self.Config.Keys:Key("harasskey", loc_eng[83],    string.byte("C"))
      -- self.Config.Keys:Boolean("harasstoglekey", "Harass Togle Key",, string.byte("T"))
      self.Config.Keys:Info("infoK5", loc_eng[84]   )
      self.Config.Keys:Key("lasthitkey",loc_eng[215],    string.byte("X"))
      self.Config.Keys:Key("laneclearkey", loc_eng[85],    string.byte("V"))
      self.Config.Keys:Key("jungleclearkey", loc_eng[86],    string.byte("V"))
      --self.Config.Keys:Boolean("lasthitkey", "Lasthit Key",    string.byte("X"))
      self.Config.Keys:Info("infoK6", loc_eng[87]   )
      self.Config.Keys:Key("escapekey", loc_eng[88],    string.byte("Y"))
      self.Config.Keys:Info("infoK", "Make Sure That Your Orbwalker"   )
      self.Config.Keys:Info("infoK2", loc_eng[89]   )

      --self.Config:Boolean("lang", loc_eng[165]    1, {loc_eng[166], loc_eng[167],loc_eng[168]})
      self.Config:Info("infoK","           "..Scriptname.."" )
      self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
      self.Config:Info("infoK","   Script was made by  "..Author.. "" )
      self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
      self.Config:Boolean("instruct", loc_eng[216], false)


    end
    function Zed:Antiafk()
      if os.clock() < Clock or not self.Config.misc.antiafk.useafk:Value()  then return end
      Clock = os.clock() + math.random(60,120)
      MoveToXYZ(myHeroPos())
    end
    function Zed:skinhack()
      if ((CurrentTimeInMillis() - lastTimeTickCalled) > 200) then
        lastTimeTickCalled = CurrentTimeInMillis()
        if  self.Config.misc.skinhack.useskin:Value() then
          if self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin'] ~= lastSkin then
            lastSkin = self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()
            HeroSkinChanger(GetMyHero(),self.Config.misc.skinhack['selected' .. myHero.charName .. 'Skin']:Value()-1)
          end
        end
      end
    end
    local spellLevel = 0
    function Zed:autolevel()
      if GetLevelPoints(myHero) >= 1 then
        if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 1 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =    { _Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 2 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _Q,_W,_E,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if(   self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 3 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_Q,_W,_Q,_R,_Q,_Q,_E,_E,_R,_E,_E}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if( self.Config.misc.autolevel.uselevel:Value()and self.Config.misc.autolevel.logic:Value() == 4 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _W,_E,_Q,_W,_W,_R,_W,_E,_W,_E,_R,_E,_E,_Q,_Q,_R,_Q,_Q}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 5 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  { _E,_Q,_W,_E,_E,_R,_E,_W,_E,_W,_R,_W,_W,_Q,_Q,_R,_Q,_Q}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if(  self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 6 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =   { _E,_Q,_W,_E,_E,_R,_E,_Q,_E,_Q,_R,_Q,_Q,_W,_W,_R,_W,_W}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
        if( self.Config.misc.autolevel.uselevel:Value() and self.Config.misc.autolevel.logic:Value() == 7 and os.clock()-Last_LevelSpell > 0.5 ) then
          local levelSequence =  {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}
          LevelSpell(levelSequence[GetLevel(myHero)-GetLevelPoints(myHero)+1])
          Last_LevelSpell = os.clock()
        end
      end
    end
    lastPotion = 0
    function Zed:autopot()
      if os.clock() - lastPotion < 15 then return end
      for SLOT = ITEM_1, ITEM_6 do
        if myHero:GetSpellData(SLOT).name == "RegenerationPotion" and self.Config.item.autopot.enableautopothp:Value() then
          if myHero:CanUseSpell(SLOT) == READY and (myHero.health / myHero.maxHealth < self.Config.item.autopot.autopothp:Value() /100 )  then
            CastSpell(SLOT)
            lastPotion = os.clock()
          end
        end
      end
    end
    function Zed:WndMsg(Msg, Key)
      if self.Config.Keys.combomode:Value() then
        self.Config.combo.rlogic:Value((self.Config.combo.rlogic:Value() + 1))
        self.Config.Keys.combomode:Value(false)
        if self.Config.combo.rlogic:Value() > 3 then self.Config.combo.rlogic:Value(1) end
      end
      if self.Config.targetsel.ts:Value() then
        if Msg == WM_LBUTTONDOWN then
          local minD = 10
          local starget = nil
          for i, enemy in ipairs(GetEnemyHeroes()) do
            if ValidTarget(enemy) then
              if GetDistance(enemy, mousePos) <= minD or starget == nil then
                minD = GetDistance(enemy, mousePos)
                starget = enemy
              end
            end
          end
          if starget and minD < 150 then
            if self.selectedTar and starget.charName == self.selectedTar.charName then
              self.selectedTar = nil
              print("<font color=\"#FFFFFF\">Target <b>is no loger selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            else
              self.selectedTar = starget
              print("<font color=\"#FFFFFF\">New target <b>selected.</b>:<font color=\"#D3649F\"><b> "..starget.charName.." </b></font>")
            end
          end
        end
      end
      if Msg == WM_LBUTTONDOWN then
if PopUp1 then
  PopUp1 = false
end
end
    end
    --[[class "Anivia"
    function Anivia:__init()
      self.Q = { delay = 0.25, speed = math.huge ,width = 40, range = 475  } --aoe false, Col false, lınear
      self.Q3 = { delay = 0.25, speed = math.huge ,width = 120, range = 900 } --aoe false, Col false, lınear
      self.W = { range = 400  }
      self.E = { range = 475 }
      self.R = { range = 1200  }
      Last_LevelSpell = 0
      self.tsg = TargetSelector(1300,TARGET_LESS_CAST_PRIORITY,DAMAGE_PHYSICAL,true,false)
      if ipred then
        q3Spell = IPrediction.Prediction({range = 900, speed =  math.huge, delay = 0.25, width = 120, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
        qSpell = IPrediction.Prediction({range = 475, speed = math.huge, delay = 0.25, width = 40, type = "linear", name =myHero:GetSpellData(_Q).name, collision = false})
      end
      --Callback.Add("Tick", function() self:Tick() end)
      --Callback.Add("Load", function() self:onload() end)
      --Callback.Add("WndMsg", function(Msg, Key) self:WndMsg(Msg, Key) end)
      --Callback.Add("Draw", function() self:Draw() end)
      --Callback.Add("UpdateBuff", function(unit,buff) self:UpdateBuff(unit,buff) end)
      --Callback.Add("RemoveBuff", function(unit,buff) self:RemoveBuff(unit,buff) end)
      --Callback.Add("ProcessSpell", function(unit, spell) self:ProcessSpell(unit, spell) end)
      --Callback.Add("CreateObj", function(obj) self:CreateObj(obj) end)
      --Callback.Add("DeleteObj", function(obj) self:DeleteObj(obj) end)
      self:LoadMenu()
    end
    function Anivia:CastQ(unit)
      if self.Config.pred.selectpred:Value() == 1 then
        local QPred = GetPrediction(unit, self.Q)
        if IsReady(_Q) then
          if QPred  and QPred.hitChance >= 0.25 then
            CastSkillShot(_Q, QPred.castPos)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 2 then
        if ipred then
          local HitChance, y = qSpell:Predict(unit)
          if IsReady(_Q) and HitChance >= 3 then
            CastSkillShot(_Q, y.x, y.y, y.z)
          end
        end
      elseif self.Config.pred.selectpred:Value() == 3 then
        local qPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), math.huge, 250, 725, 20, false, true)
        if IsReady(_Q) and qPred.HitChance == 1 then
          CastSkillShot(_Q, qPred.PredPos.x, qPred.PredPos.y, qPred.PredPos.z)
        end
      end
    end
    function Anivia:CastE(unit)
      if IsReady(_E) then
        CastTargetSpell(unit, _E)
      end
    end

    function Anivia:CastR(unit)
      if IsReady(_R) then
        CastTargetSpell(unit, _R)
      end
    end
    function Anivia:LoadMenu()
      self.Config=MenuConfig("menu",""..Scriptname.." [" .. myHero.charName.."]" )
      self.Config:Menu("combo",loc_eng[1])
      self.Config.combo:Boolean("useQ", loc_eng[2], true)
      self.Config.combo:Boolean("useE", loc_eng[4], true)
      self.Config.combo:Boolean("useR", loc_eng[5], true)
      self.Config.combo:Boolean("useI", loc_eng[6], true)
      self.Config.combo:Slider("Mana",loc_eng[8]   , 10, 10, 100, 1)

      self.Config:Menu( "harass",loc_eng[9])
      self.Config.harass:Boolean("useQ", loc_eng[10], true)
      self.Config.harass:Boolean("useE", loc_eng[12], true)
      self.Config.harass:Boolean("useR", loc_eng[13], true)
      self.Config.harass:Slider("Mana",loc_eng[8]   , 10, 10, 100, 1)

      self.Config:Menu( "farm",loc_eng[14])

      self.Config.farm:Menu("laneclear",loc_eng[15])
      self.Config.farm.laneclear:Boolean("useQ",loc_eng[16], true)
      self.Config.farm.laneclear:Slider("qcount",loc_eng[180]   , 2, 1, 10, 1)
      self.Config.farm.laneclear:Boolean("useE",loc_eng[18], true)
      self.Config.farm.laneclear:Boolean("useR",loc_eng[19], false)
      self.Config.farm.laneclear:Slider("rcount",loc_eng[183]   , 2, 1, 10, 1)
      self.Config.farm.laneclear:Info("blank", ""   )
      self.Config.farm.laneclear:Info("blank", ""   )
      self.Config.farm.laneclear:Info("info2", loc_eng[184]   )
      self.Config.farm.laneclear:Slider("QMana",loc_eng[185]   , 30, 10, 100, 1)
      self.Config.farm.laneclear:Slider("EMana",loc_eng[187]   , 30, 10, 100, 1)
      self.Config.farm.laneclear:Slider("RMana",loc_eng[188]   , 30, 10, 100, 1)

      self.Config.farm:Menu("jungleclear",loc_eng[20])
      self.Config.farm.jungleclear:Boolean("useQ",loc_eng[21], true)
      self.Config.farm.jungleclear:Boolean("useE",loc_eng[23], true)
      self.Config.farm.jungleclear:Boolean("useR",loc_eng[24], false)
      self.Config.farm.jungleclear:Info("blank", ""   )
      self.Config.farm.jungleclear:Info("blank", ""   )
      self.Config.farm.jungleclear:Info("info2", loc_eng[184]   )
      self.Config.farm.jungleclear:Slider("QMana",loc_eng[185]   , 30, 10, 100, 1)
      self.Config.farm.jungleclear:Slider("EMana",loc_eng[187]   , 30, 10, 100, 1)
      self.Config.farm.jungleclear:Slider("RMana",loc_eng[188]   , 30, 10, 100, 1)

      self.Config.farm:Menu("lasthit",loc_eng[25])
      self.Config.farm.lasthit:Boolean("autolasthit",loc_eng[189], false)
      self.Config.farm.lasthit:Boolean("useQ",loc_eng[26], true)
      self.Config.farm.lasthit:Boolean("useE",loc_eng[28], true)
      self.Config.farm.lasthit:DropDown("lasthitlogic",loc_eng[191],   1, {loc_eng[172],loc_eng[174]})
      self.Config.farm.lasthit:Info("blank", ""   )
      self.Config.farm.lasthit:Info("blank", ""   )
      self.Config.farm.lasthit:Info("info2", loc_eng[184]   )
      self.Config.farm.lasthit:Slider("QMana",loc_eng[185]   , 30, 10, 100, 1)
      self.Config.farm.lasthit:Slider("EMana",loc_eng[187]   , 30, 10, 100, 1)


      self.Config:Menu("killsteal",loc_eng[35])
      self.Config.killsteal:Boolean("ks",loc_eng[36], true)
      self.Config.killsteal:Boolean("useQ", loc_eng[37], true)
      self.Config.killsteal:Boolean("useE", loc_eng[39], true)
      self.Config.killsteal:Boolean("useR", loc_eng[40], true)
      self.Config.killsteal:Boolean("useQW", loc_eng[127], true)
      self.Config.killsteal:Boolean("useI", loc_eng[41], true)

      self.Config:Menu( "item",loc_eng[42])
      self.Config.item:Menu( "autopot",loc_eng[192])
      self.Config.item.autopot:Boolean("enableautopothp", loc_eng[193], false)
      self.Config.item.autopot:Slider("autopothp", loc_eng[194] , 10, 0, 100, 1)
      self.Config.item:Boolean("enableautozhonya", loc_eng[43], false)
      self.Config.item:Slider("autozhonya", loc_eng[44] , 10, 0, 100, 1)
      self.Config.item:Boolean("usehg", loc_eng[45],  false)
      self.Config.item:Boolean("usebg", loc_eng[46],  false)

      self.Config:Menu( "misc",loc_eng[92])
      self.Config.misc:Menu( "autowall","[" .. myHero.charName.. "] - Auto Wall Settings")
      self.Config.misc.autowall:Boolean("Draw", "Draw Auto Wall Locations", true)
      self.Config.misc.autowall:Boolean("Drawr", "Use Range While Drawing", false)
      self.Config.misc.autowall:Slider("Drawrrange", "Draw Locations If Range >" , 10, 1000, 10000, 1)
      self.Config.misc.autowall:Info("blank", ""   )
      self.Config.misc.autowall:Info("blank", "        [Color Settings]"   )
      self.Config.misc.autowall:ColorPick("fcolor", "Wall Color",   {255, 255, 255, 255})
      self.Config.misc:Menu( "antigap","[" .. myHero.charName.. "] - Anti Gap Closer Settings")
      self.Config.misc.antigap:Info("info3", loc_eng[98] )
      self.Config.misc:Menu( "skinhack","[" .. myHero.charName.. "] - Skinhack Settings")
      self.Config.misc.skinhack:Boolean("useskin",loc_eng[54], false)
      self.Config.misc.skinhack:DropDown('selected' .. myHero.charName .. 'Skin', loc_eng[57]  ,  1, skinMeta[myHero.charName])
      self.Config.misc:Menu( "autolevel","[" .. myHero.charName.. "] - AutoLevel Settings")
      self.Config.misc.autolevel:Boolean("uselevel",loc_eng[51], false)
      self.Config.misc.autolevel:DropDown("logic", loc_eng[52] , 7, {loc_eng[58], loc_eng[59],loc_eng[60],loc_eng[61],loc_eng[62], loc_eng[63], loc_eng[64]  })
      self.Config.misc:Menu( "antiafk","[" .. myHero.charName.. "] - AntiAFK Settings")
      self.Config.misc.antiafk:Boolean("useafk",loc_eng[196], false)

      Clock = os.clock()


      self.Config:Menu("other",loc_eng[65])
      self.Config.other:Menu( "draw",loc_eng[66])
      self.Config.other.draw:Boolean("qdraw",loc_eng[67], true)
      self.Config.other.draw:Boolean("wdraw",loc_eng[68], true)
      self.Config.other.draw:Boolean("edraw",loc_eng[69], true)
      self.Config.other.draw:Boolean("rdraw",loc_eng[70], true)
      self.Config.other.draw:Boolean("aadraw",loc_eng[71], false)
      self.Config.other:Menu( "color", loc_eng[198])
      self.Config.other.color:ColorPick("Qcolor", loc_eng[199],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("Wcolor", loc_eng[200],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("Ecolor", loc_eng[201],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("Rcolor", loc_eng[202],   {255, 255, 255, 255})
      self.Config.other.color:ColorPick("AAcolor", loc_eng[204],   {255, 255,0,0})
      self.Config.other:Boolean("eggtimer","Draw Egg Timer", true)
      self.Config.other:Boolean("damage",loc_eng[214], true)
      self.Config.other:Boolean("targetcal",loc_eng[76], true)

      self.Config:Menu("targetsel",loc_eng[77])
      self.Config.targetsel:Boolean("ts",loc_eng[78], false)


      self.Config:Menu("orb","Orbwalker Settings")
      self.Config.orb:Menu( "selectorb","Current Orbwalker :")

      self.Config:Menu("pred","Prediction Settings")
      self.Config.pred:DropDown("selectpred","Current Predictions :",   1, {"Open Prediction","IPrediction","Gos Prediction"})
      self.Config.pred:Menu( "hcgeneral","Hitchance Settings")
      self.Config.pred.hcgeneral:Menu( "hcop","Open Prediction Hitchance")
      self.Config.pred.hcgeneral.hcop:Slider("hcopq", "Q Hitchance " , 30, 0, 100, 1)
      self.Config.pred.hcgeneral.hcop:Slider("hcopr", "r Hitchance " , 30, 0, 100, 1)
      self.Config.pred:Info("blank", "    Currently Open Prediction "   )
      self.Config.pred:Info("blank", "      is best with this bundle"   )


      self.Config:Menu( "Keys",loc_eng[79])
      self.Config.Keys:Info("infoK3", loc_eng[80]   )
      self.Config.Keys:Key("combokey", loc_eng[81], string.byte(" "))
      self.Config.Keys:Info("infoK4", loc_eng[82]   )
      self.Config.Keys:Key("harasskey", loc_eng[83],    string.byte("C"))
      -- self.Config.Keys:Boolean("harasstoglekey", "Harass Togle Key",, string.byte("T"))
      self.Config.Keys:Info("infoK5", loc_eng[84]   )
      self.Config.Keys:Key("lasthitkey",loc_eng[215],    string.byte("X"))
      self.Config.Keys:Key("laneclearkey", loc_eng[85],    string.byte("V"))
      self.Config.Keys:Key("jungleclearkey", loc_eng[86],    string.byte("V"))
      --self.Config.Keys:Boolean("lasthitkey", "Lasthit Key",    string.byte("X"))
      self.Config.Keys:Info("infoK6", loc_eng[87]   )
      self.Config.Keys:Key("escapekey", loc_eng[88],    string.byte("Y"))
      self.Config.Keys:Info("infoK", "Make Sure That Your Orbwalker"   )
      self.Config.Keys:Info("infoK2", loc_eng[89]   )

      --self.Config:Boolean("lang", loc_eng[165]    1, {loc_eng[166], loc_eng[167],loc_eng[168]})
      self.Config:Info("infoK","           "..Scriptname.."" )
      self.Config:Info("infoK","         Script Version:  "..Version.. "  " )
      self.Config:Info("infoK","   Script was made by  "..Author.. "" )
      self.Config:Info("infoK","Leauge Of Legends Version: "..LVersion.. "" )
      self.Config:Boolean("instruct", loc_eng[216], false)


      end]]
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
  function Extends(v1, v2, v3)
  return Vector(v1) + (Vector(v2) - Vector(v1)):normalized() * (GetDistance(v1, v2)+v3)
end
      function mPos3D(cx,cz,x,z,r)
        if (math.pow(cx-x,2)+math.pow(cz-z,2)<math.pow(r,2)) then
          return true
        else
          return false
        end
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
      Champions = {
        ["Aatrox"] = {charName = "Aatrox", skillshots = {
          ["AatroxE"] = {spellKey = _E, name = "Blade of Torment (E)", spellName = "AatroxE", spellDelay = 250, projectileName = "AatroxBladeofTorment_mis.troy", projectileSpeed = 1200, range = 1075, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["AatroxW"] = {spellKey = _W, spellName = "Aatrox (W)", checkName = true, name = "AatroxW", isAutoBuff = true, range = 125, isSelfCast = true, noAnimation = true},
          ["AatroxQ"] = {name = "AatroxQ", spellName = "Aatrox (Q)", spellDelay = 250, projectileName = "AatroxQ.troy", projectileSpeed = 450, range = 650, radius = 145, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
          ["AatroxR"] = { spellKey = _R, isSelfCast = true, isAutoBuff = true, spellName = "AatroxR", name = "AatroxR", range = 125},
        }},
        ["Ahri"] = {charName = "Ahri", skillshots = {
          ["AhriOrbofDeception"] = {spellKey = _Q, name = "Orb of Deception (Q)", spellName = "AhriOrbofDeception", spellDelay = 250, projectileName = "Ahri_Orb_mis.troy", projectileSpeed = 1750, range = 800, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Orb of Deception Back"] = {name = "Orb of Deception Back(QB)", spellName = "AhriOrbofDeception!", spellDelay = 750, projectileName = "Ahri_Orb_mis_02.troy", projectileSpeed = 915, range = 800, radius = 100, type = "LINE"},
          ["AhriSeduce"] = {spellKey = _E, isTrueRange = true, isCollision = true, name = "Charm (E)", spellName = "AhriSeduce", spellDelay = 250, projectileName = "Ahri_Charm_mis.troy", projectileSpeed = 1600, range = 1075, radius = 60, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["AhriFoxFire"] = { spellKey = _W, isSelfCast = true, spellName = "AhriFoxFire", name = "AhriFoxFire", range = 750, projectileSpeed = 1400},
        }},
        ["Alistar"] = {charName = "Alistar", skillshots = {
          --unfinished
          ["Headbutt"] = {spellKey = _W, isTargeted = true, name = "Headbutt", spellName = "Headbutt", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 650, type = "LINE"},
          ["Pulverize"] = {spellKey = _Q, isSelfCast = true, name = "Pulverize", spellName = "Pulverize", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 250, type = "CIRCULAR"},
        }},
        ["Amumu"] = {charName = "Amumu", skillshots = {
          ["BandageToss"] = {spellKey = _Q, isCollision = true, name = "Bandage Toss (Q)", spellName = "BandageToss", spellDelay = 250, projectileName = "Bandage_beam.troy", projectileSpeed = 2000, range = 1100, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Tantrum"] = {spellKey = _E, isSelfCast = true, name = "Tantrum", spellName = "Tantrum", spellDelay = 250, range = 200, type = "CIRCULAR"},
          ["AuraofDespair"] = { spellKey = _W, isSelfCast = true, heroHasNoBuff = "AuraofDespair", spellName = "AuraofDespair", name = "AuraofDespair", range = 300, },
        }},
        ["Anivia"] = {charName = "Anivia", skillshots = {
          ["FlashFrostSpell"] = {spellKey = _Q, name = "Flash Frost (Q)", spellName = "FlashFrostSpell", spellDelay = 250, projectileName = "cryo_FlashFrost_mis.troy", projectileSpeed = 850, range = 1100, radius = 110, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Frostbite"] = {spellKey = _E, isTargeted = true, targetHasBuff = "chilled", name = "Frostbite (E)", spellName = "Frostbite", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Glacial Storm"] = {spellKey = _R, name = "Glacial Storm", spellName = "GlacialStorm", spellDelay = 250, projectileName = "Ahri_Orb_mis.troy", range = 615, radius = 400, type = "CIRCULAR"},
        }},
        ["Akali"] = {charName = "Akali", skillshots = {
          --unfinished
          ["AkaliQ"] = {spellKey = _Q, isTargeted = true, name = "Akali(Q)", spellName = "AkaliQ", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Crescent Slash"] = {spellKey = _E, isSelfCast = true, name = "Crescent Slash", spellName = "CrescentSlash", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 325, type = "CIRCULAR"},
          ["Shadow Dance"] = {spellKey = _R, isTargeted = true, name = "Shadow Dance", spellName = "Shadow Dance", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 800, type = "LINE"},
        }},
        ["Ashe"] = {charName = "Ashe", skillshots = {
          ["EnchantedCrystalArrow"] = { name = "Enchanted Arrow", spellName = "EnchantedCrystalArrow", spellDelay = 250, projectileName = "EnchantedCrystalArrow_mis.troy", projectileSpeed = 1600, range = 25000, radius = 130, type = "LINE", fuckedup = false, blockable = true, danger = 1},
          ["Volley"] = {spellKey = _W, isTrueRange = true, name = "Volley", spellName = "Volley", spellDelay = 250, range = 1200, radius = 200, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["FrostShot"] = { spellKey = _Q, isSelfCast = true, isAutoBuff = true, heroHasNoBuff = "FrostShot", noAnimation = true, spellName = "FrostShot", name = "FrostShot", range = 600, projectileName = "IceArrow_mis.troy",},
        }},
        ["Annie"] = {charName = "Annie", skillshots = {
          --unfinished
          ["Disintegrate"] = {spellKey = _Q, isTargeted = true, name = "Disintegrate", spellName = "Disintegrate", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 625, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["MoltenShield"] = { spellKey = _E, isSelfCast = true, spellName = "MoltenShield", name = "MoltenShield", range = math.huge, },
          ["Incinerate"] = {spellKey = _W, isTrueRange = true, name = "Incinerate", spellName = "Incinerate", spellDelay = 500, projectileName = "Thresh_Q_whip_beam.troy", range = 625, radius = 200, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["InfernalGuardian"] = { spellKey = _R, type = "CIRCULAR", checkName = true, spellName = "InfernalGuardian", name = "InfernalGuardian", range = 600, radius = 290},
        }},
        ["Blitzcrank"] = {charName = "Blitzcrank", skillshots = {
          ["RocketGrabMissile"] = {spellKey = _Q, isCollision = true, isTrueRange = true, name = "Rocket Grab", spellName = "RocketGrabMissile", spellDelay = 250, projectileName = "FistGrab_mis.troy", projectileSpeed = 1800, range = 1050, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Power Fist"] = {spellKey = _E, isSelfCast = true, targetHasBuff = "rocketgrab2", name = "Power Fist", spellName = "PowerFist", spellDelay = 250, range = math.huge,},
          ["Static Field"] = {spellKey = _R, isSelfCast = true, name = "Static Field", spellName = "StaticField", spellDelay = 250, range = 550, type = "CIRCULAR"},
        }},
        ["Brand"] = {charName = "Brand", skillshots = {
          ["BrandBlaze"] = {spellKey = _Q, isCollision = true, name = "BrandBlaze", spellName = "BrandBlaze", spellDelay = 250, projectileName = "BrandBlaze_mis.troy", projectileSpeed = 1600, range = 900, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Pillar of Flame"] = {spellKey = _W, name = "Pillar of Flame", spellName = "BrandFissure", spellDelay = 875, projectileName = "BrandPOF_tar_green.troy", range = 900, radius = 240, type = "CIRCULAR"},
          ["BrandWildfire"] = {name = "BrandWildfire", spellName = "BrandWildfire", castDelay = 250, projectileName = "BrandWildfire_mis.troy", projectileSpeed = 1000, range = 1100, radius = 250, type = "circular", fuckedUp = false, blockable = true, danger = 1},
        }},
        ["Caitlyn"] = {charName = "Caitlyn", skillshots = {
          ["CaitlynPiltoverPeacemaker"] = {spellKey = _Q, name = "Piltover Peacemaker", spellName = "CaitlynPiltoverPeacemaker", spellDelay = 625, projectileName = "caitlyn_Q_mis.troy", projectileSpeed = 2200, range = 1300, radius = 90, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Caitlyn Entrapment"] = {name = "Caitlyn Entrapment", spellName = "CaitlynEntrapment", spellDelay = 150, projectileName = "caitlyn_entrapment_mis.troy", projectileSpeed = 2000, range = 950, radius = 80, type = "LINE"},
          ["CaitlynHeadshotMissile"] = {name = "Ace in the Hole", spellName = "CaitlynHeadshotMissile", range = 3000, fuckedup = false, blockable = true, danger = 1, projectileName = "caitlyn_ult_mis.troy"},
        }},
        ["Cassiopeia"] = {charName = "Cassiopeia", skillshots = {
          ["Noxious Blast"] = {spellKey = _Q, name = "Noxious Blast", spellName = "Noxious Blast", spellDelay = 600, range = 850, radius = 75, type = "CIRCULAR"},
          ["CassiopeiaTwinFang"] = {spellKey = _E, isTargeted = true, targetHasBuff = "poison", name = "Twin Fang", spellName = "CassiopeiaTwinFang", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", projectileSpeed = 1800,  range = 700, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        }},
        ["Chogath"] = {charName = "Chogath", skillshots = {
          ["Rupture"] = {spellKey = _Q, name = "Rupture", spellName = "Rupture", spellDelay = 875, projectileName = "rupture_cas_01_red_team.troy", range = 950, radius = 125, type = "CIRCULAR"},
          ["Feast"] = { spellKey = _R, isTargeted = true, isExecute = true, spellName = "Feast", name = "Feast", range = 150, },
          --["Rupture"] = { spellKey = _Q, castType = 0, spellName = "Rupture", name = "Rupture", range = 950, projectileName = "AnnieBasicAttack_mis.troy",},
          --["VorpalSpikes"] = { spellKey = _E, castType = 0, spellName = "VorpalSpikes", name = "VorpalSpikes", range = 40, projectileName = "TristanaBasicAttack_mis.troy", radius = 170,},
          ["FeralScream"] = { spellKey = _W, type = "LINE", spellName = "FeralScream", name = "FeralScream", range = 700, radius = 200 },

        }},
        ["Corki"] = {charName = "Corki", skillshots = {
          ["PhosphorusBomb"] = {spellKey = _Q, name = "Phosphorus Bomb", spellName = "PhosphorusBomb", spellDelay = 750, spellAnimationDelay = 250, projectileName = "LayWaste_point.troy", range = 825, radius = 250, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
          ["GGun"] = { spellKey = _E, type = "LINE", spellName = "GGun", name = "GGun", range = 600, radius = 200, noAnimation = true,},
          ["Missile Barrage"] = {spellKey = _R, isCollision = true, heroHasBuff = "corkimissilebarragenc", isTrueRange = true, name = "Missile Barrage", spellName = "MissileBarrage", spellDelay = 250, projectileName = "corki_MissleBarrage_mis.troy", projectileSpeed = 2000, range = 1300, radius = 40, type = "LINE"},
          ["MissileBarrageBig"] = {spellKey = _R, isCollision = true, name = "Missile Barrage big", heroHasBuff = "mbcheck2", spellName = "MissileBarrageBig", spellDelay = 250, projectileName = "Corki_MissleBarrage_DD_mis.troy", projectileSpeed = 2000, range = 1600, radius = 60, type = "LINE", fuckedUp = false, blockable = true, danger = 1}
        }},
        ["Darius"] = {charName = "Darius", skillshots = {
          --unfinished
          ["Noxian Guillotine"] = {spellKey = _R, isTargeted = true, isExecute = true, name = "Noxian Guillotine", spellName = "NoxianGuillotine", spellDelay = 250, range = 460, type = "LINE"},
          ["Crippling Strike"] = {spellKey = _W, isSelfCast = true, isAutoReset = true, name = "Crippling Strike", spellName = "Crippling Strike", spellDelay = 250, range = 125, type = "CIRCULAR"},
          ["DariusAxeGrabCone"] = {spellKey = _E, isTrueRange = true, name = "Apprehend", spellName = "DariusAxeGrabCone", spellDelay = 320, range = 570, radius = 200, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["DariusCleave"] = {spellKey = _Q, isSelfCast = true, name = "Decimate", spellName = "DariusCleave", spellDelay = 230, range = 425, type = "CIRCULAR"},
        }},
        ["Diana"] = {charName = "Diana", skillshots = {
          --["Diana Arc"] = {spellKey = _Q, name = "DianaArc", spellName = "DianaArc", spellDelay = 250, projectileName = "Diana_Q_trail.troy", projectileSpeed = 1600, range = 830, radius = 100, type = "CIRCULAR"},
          ["DianaArc"] = {spellKey = _Q, name = "DianaArc", spellName = "DianaArc", spellDelay = 250, projectileName = "Diana_Q_trail.troy", range = 830, radius = 200, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
          ["Pale Cascade"] = {spellKey = _W, isSelfCast = true, isShield = true, name = "Pale Cascade", spellName = "PaleCascade", spellDelay = 230, range = 200, type = "CIRCULAR", noAnimation = true,
          damage = function () return 25 + myHero.ap * .3 + 15 * myHero:GetSpellData(_W).level end},
          ["Lunar Rush"] = {spellKey = _R, isTargeted = true, name = "Lunar Rush", spellName = "LunarRush", spellDelay = 250, range = 825, type = "LINE"},
        }},
        ["Draven"] = {charName = "Draven", skillshots = {
          ["DravenFury"] = { spellKey = _W, isSelfCast = true, isAutoBuff = true, noAnimation = true, spellName = "DravenFury", name = "DravenFury", range = 550, },
          ["DravenSpinning"] = { spellKey = _Q, isSelfCast = true, isAutoBuff = true, noAnimation = true, spellName = "DravenSpinning", name = "DravenSpinning", range = 550, },
          ["DravenDoubleShot"] = {spellKey = _E, name = "Stand Aside", spellName = "DravenDoubleShot", spellDelay = 250, projectileName = "Draven_E_mis.troy", projectileSpeed = 1400, range = 1100, radius = 130, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["DravenRCast"] = {spellKey = _R, isExecute = true, name = "DravenR", spellName = "DravenRCast", spellDelay = 500, projectileName = "Draven_R_mis!.troy", projectileSpeed = 2000, range = 25000, radius = 160, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        }},
        ["Elise"] = {charName = "Elise", skillshots = {
          ["EliseHumanE"] = {spellKey = _E, isCollision = true, name = "Cocoon", checkName = true, spellName = "EliseHumanE", spellDelay = 250, projectileName = "Elise_human_E_mis.troy", projectileSpeed = 1450, range = 1100, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["EliseHumanQ"] = {spellKey = _Q, isTargeted = true, checkName = true, name = "Neurotoxin", spellName = "EliseHumanQ", spellDelay = 250, range = 625, type = "LINE", fuckedUp = false, blockable = true, danger = 1, fuckedUp = false, blockable = true, danger = 1},
          ["Venomous Bite"] = {spellKey = _Q, isTargeted = true, checkName = true, name = "Venomous Bite", spellName = "EliseSpiderQCast", spellDelay = 250, range = 475, type = "LINE"},
          ["Skittering Frenzy"] = {spellKey = _W, isSelfCast = true, checkName = true, name = "Skittering Frenzy", spellName = "EliseSpiderW", spellDelay = 250, range = 300, type = "CIRCULAR"},
          ["EliseHumanW"] = {spellKey = _W, isCollision = true, name = "Volatile Spiderling", checkName = true, spellName = "EliseHumanW", spellDelay = 250, projectileName = "Elise_human_E_mis.troy", projectileSpeed = 1450, range = 950, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},

        }},
        ["Ezreal"] = {charName = "Ezreal", skillshots = {
          ["EzrealMysticShot"]             = {spellKey = _Q, isCollision = true, name = "Mystic Shot",      spellName = "EzrealMysticShot", spellDelay = 250, projectileName = "Ezreal_mysticshot_mis.troy",  projectileSpeed = 2000, range = 1100, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["EzrealEssenceFlux"]            = {spellKey = _W, name = "Essence Flux",     spellName = "EzrealEssenceFlux",     spellDelay = 250, projectileName = "Ezreal_essenceflux_mis.troy", projectileSpeed = 1500, range = 900,  radius = 80,  type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["EzrealMysticShotPulse"] = {name = "Mystic ShotPulse(E)",      spellName = "EzrealMysticShotPulse", spellDelay = 250, projectileName = "Ezreal_mysticshot_mis.troy",  projectileSpeed = 2000, range = 1200,  radius = 80,  type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["EzrealTrueshotBarrage"]        = {spellKey = _R, isExecute = true, name = "Trueshot Barrage", spellName = "EzrealTrueshotBarrage", spellDelay = 1000, projectileName = "Ezreal_TrueShot_mis.troy", projectileSpeed = 2000, range = 20000, radius = 160, type = "LINE", fuckedup = false, blockable = true, danger = 1},
        }},
        ["Evelynn"] = {charName = "Evelynn", skillshots = {
          --unfinished
          ["Ravage"] = {spellKey = _E, isTargeted = true, name = "Ravage", spellName = "Ravage", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 225, type = "LINE"},
          ["Dark Frenzy"] = {spellKey = _W, isSelfCast = true, name = "Dark Frenzy", spellName = "DarkFrenzy", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "LINE"},
          ["Hate Spike"] = {spellKey = _Q, isSelfCast = true, name = "Hate Spike", spellName = "HateSpike", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 500, type = "LINE"},
        }},

        ["Heimerdinger"] = {charName = "Heimerdinger", skillshots = {
          ["HextechMicroRockets"]   = {spellKey = _W, isCollision = true, name = "Hextech Micro-Rockets",      spellName = "HextechMicroRockets", spellDelay = 250, projectileName = "Ezreal_mysticshot_mis.troy",  projectileSpeed = 1200, range = 1100, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["CH-2ElectronStormGrenade"]    = {spellKey = _E, name = "CH-2 Electron Storm Grenade",     spellName = "CH-2ElectronStormGrenade",     spellDelay = 250, projectileName = "Ezreal_essenceflux_mis.troy", projectileSpeed = 1750, range = 925,  radius = 80,  type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        }},
        ["FiddleSticks"] = {charName = "FiddleSticks", skillshots = {
          ["DarkWind"] = {spellKey = _E, isTargeted = true, name = "Dark Wind", spellName = "DarkWind", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 750, projectileSpeed = 1500, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        }},
        ["Fiora"] = {charName = "Fiora", skillshots = {
          ["FioraQ"] = { spellKey = _Q, isTargeted = true, spellName = "FioraQ", name = "FioraQ", range = 600,},
          ["FioraFlurry"] = { spellKey = _E, isSelfCast = true, isAutoBuff = true, noAnimation = true, spellName = "FioraFlurry", name = "FioraFlurry", range = 500, projectileSpeed = 0, projectileName = "AnnieBasicAttack_mis.troy",},
          ["FioraDance"] = { spellKey = _R, isTargeted = true, isExecute = true, spellName = "FioraDance", name = "FioraDance", range = 400, },
          --["FioraRiposte"] = { spellKey = _W, castType = 0, spellName = "FioraRiposte", name = "FioraRiposte", range = 20, projectileSpeed = 0, projectileName = "AnnieBasicAttack_mis.troy",},
        }},
        ["Fizz"] = {charName = "Fizz", skillshots = {
          ["Leap Strike"] = {spellKey = _Q, isTargeted = true, name = "Leap Strike", spellName = "LeapStrike", spellDelay = 250, range = 700,},
          ["Seastone Trident"] = {spellKey = _W, isSelfCast = true, isAutoBuff = true, noAnimation = true, name = "Seastone Trident", spellName = "SeastoneTrident", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, type = "CIRCULAR"},
          --["Fizz Ultimate"] = {name = "Fizz ULT", spellName = "FizzMarinerDoom", spellDelay = 250, projectileName = "Fizz_UltimateMissile.troy", projectileSpeed = 1350, range = 1275, radius = 80, type = "LINE"},
          ["FizzMarinerDoom"] = {name = "Fizz ULT", spellName = "FizzMarinerDoom", castDelay = 250, projectileName = "Fizz_UltimateMissile.troy", projectileSpeed = 1350, range = 1275, radius = 80, type = "line", fuckedUp = false, blockable = true, danger = 1},
        }},
        ["Galio"] = {charName = "Galio", skillshots = {
          ["GalioResoluteSmite"] =  { spellKey = _Q, name = "GalioResoluteSmite", spellName = "GalioResoluteSmite", spellDelay = 250, projectileName = "galio_concussiveBlast_mis.troy", projectileSpeed = 850, range = 2000, radius = 200, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["GalioRighteousGust"] = { spellKey = _E, type = "LINE", spellName = "GalioRighteousGust", name = "GalioRighteousGust", range = 1180, projectileSpeed = 1200, radius = 120,},
          ["GalioBulwark"] = { spellKey = _W, isTargeted = true, isShield = true, spellName = "GalioBulwark", name = "GalioBulwark", range = 800, },
          ["GalioIdolOfDurand"] = { spellKey = _R, isSelfCast = true, channelDuration = 2000, spellName = "GalioIdolOfDurand", name = "GalioIdolOfDurand", range = 600, },
        }},
        ["Gangplank"] = {charName = "Gangplank", skillshots = {
          ["RaiseMorale"] = { spellKey = _E, isSelfCast = true, isAutoBuff = true, spellName = "RaiseMorale", name = "RaiseMorale", range = 125, projectileName = "pirate_raiseMorale_mis.troy",},
          --["CannonBarrage"] = { spellKey = _R, castType = 0, spellName = "CannonBarrage", name = "CannonBarrage", range = 20000, projectileName = "missing_instant.troy",},
          ["Parley"] = { spellKey = _Q, isTargeted = true, spellName = "Parley", name = "Parley", range = 625, projectileName = "pirate_parley_mis.troy",},
          --["RemoveScurvy"] = { spellKey = _W, castType = 0, spellName = "RemoveScurvy", name = "RemoveScurvy", range = 20,},
        }},
        ["Gragas"] = {charName = "Gragas", skillshots = {
          ["GragasBarrelRoll"] = {spellKey = _Q, name = "Barrel Roll", spellName = "GragasBarrelRoll", spellDelay = 250, projectileName = "gragas_barrelroll_mis.troy", projectileSpeed = 1000, range = 950, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["Barrel Roll Missile"] = {name = "Barrel Roll Missile", spellName = "GragasBarrelRollMissile", spellDelay = 0, projectileName = "gragas_barrelroll_mis.troy", projectileSpeed = 1000, range = 1115, radius = 180, type = "CIRCULAR"},
        }},
        --edit
        ["Graves"] = {charName = "Graves", skillshots = {
          ["GravesClusterShot"] = {spellKey = _Q, name = "Buckshot", spellName = "GravesClusterShot", spellDelay = 250, projectileName = "Graves_ClusterShot_mis.troy", projectileSpeed = 1750, range = 900, radius = 60, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["SmokeScreen"] = {spellKey = _W, name = "Smoke Screen", spellName = "SmokeScreen", spellDelay = 250, projectileName = "Graves_SmokeGrenade_mis.troy", projectileSpeed = 1500, range = 950, radius = 300, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
          ["GravesChargeShot"] = {spellKey = _R, isExecute = true, name = "Collateral Damage", spellName = "GravesChargeShot", spellDelay = 250, projectileName = "Graves_ChargedShot_mis.troy", projectileSpeed = 1500, range = 1000, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        }},
        ["Irelia"] = {charName = "Irelia", skillshots = {
          ["IreliaGatotsu"] = { spellKey = _Q, isTargeted = true, spellName = "IreliaGatotsu", name = "IreliaGatotsu", range = 650,},
          ["IreliaEquilibriumStrike"] = { spellKey = _E, isTargeted = true, spellName = "IreliaEquilibriumStrike", name = "IreliaEquilibriumStrike", range = 425,
          castReq = function (target) return myHero.health < target.health end},
          ["IreliaTranscendentBlades"] = { spellKey = _R, type = "LINE", spellName = "IreliaTranscendentBlades", name = "IreliaTranscendentBlades", range = 1200, projectileSpeed = 1600, projectileName = "Irelia_ult_dagger_mis.troy", radius = 120, fuckedUp = false, blockable = true, danger = 1},
          ["IreliaHitenStyle"] = { spellKey = _W, isSelfCast = true, noAnimation = true, spellName = "IreliaHitenStyle", name = "IreliaHitenStyle", range = math.huge,},
        }},
        ["Janna"] = {charName = "Janna", skillshots = {
          ["HowlingGale"] = { spellKey = _Q, type = "LINE", spellName = "HowlingGale", name = "HowlingGale", range = 1100, projectileName = "HowlingGale_mis.troy", radius = 150, fuckedUp = false, blockable = true, danger = 1},
          ["Zephyr"] = {spellKey = _W, isTargeted = true, name = "Zephyr", spellName = "Zephyr", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, projectileSpeed = 1500, type = "LINE"},
          ["Eye Of The Storm"] = {spellKey = _E, isTargeted = true, isShield = true, name = "Eye Of The Storm", spellName = "EyeOfTheStorm", spellDelay = 250, range = 800, type = "CIRCULAR",
          damage = function () return 40 + 40 * myHero:GetSpellData(_E).level + myHero.ap * .7 end
        },
      }},
      ["Jax"] = {charName = "Jax", skillshots = {
        --unfinished
        ["Leap Strike"] = {spellKey = _Q, isTargeted = true, name = "Leap Strike", spellName = "LeapStrike", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "CIRCULAR"},
        ["Empower"] = {spellKey = _W, isSelfCast = true, isAutoReset = true, name = "Empower", spellName = "Empower", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "CIRCULAR"},
      }},
      ["Jayce"] = {charName = "Jayce", skillshots = {
        ["JayceToTheSkies"] = {spellKey = _Q, isTargeted = true, checkName = true, name = "JayceQ", spellName = "JayceToTheSkies", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Thundering Blow"] = {spellKey = _E, isTargeted = true, checkName = true, name = "Thundering Blow", spellName = "JayceThunderingBlow", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 240, type = "LINE"},
        ["Hyper Charge"] = {spellKey = _W, isSelfCast = true, checkName = true, isAutoReset = true, name = "Hyper Charge", spellName = "jaycehypercharge", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 500, type = "CIRCULAR"},
        ["JayceStaticField"] = {spellKey = _W, isSelfCast = true, checkName = true, name = "Lightning Field", spellName = "JayceStaticField", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 285, type = "CIRCULAR"},
        ["jayceshockblast"] = {spellKey = _Q, isCollision = true, checkName = true, name = "JayceShockBlast", spellName = "jayceshockblast", spellDelay = 250, projectileName = "JayceOrbLightning.troy", projectileSpeed = 1450, range = 1050, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["JayceShockBlastCharged"] = {name = "JayceShockBlastCharged", spellName = "JayceShockBlast", spellDelay = 250, projectileName = "JayceOrbLightningCharged.troy", projectileSpeed = 2350, range = 1600, radius = 70, type = "LINE"},
      }},
      ["Jinx"] = {charName = "Jinx", skillshots = {
        ["JinxWMissile"] =  {spellKey = _W, isCollision = true, name = "Zap", spellName = "JinxWMissile", spellDelay = 600, projectileName = "Jinx_W_mis.troy", projectileSpeed = 3300, range = 1450, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["JinxRWrapper"] =  {name = "Super Mega Death Rocket", spellName = "JinxRWrapper", spellDelay = 600, projectileName = "Jinx_R_Mis.troy", projectileSpeed = 2200, range = 20000, radius = 120, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      }},
      ["Karthus"] = {charName = "Karthus", skillshots = {
        ["Lay Waste"] = {spellKey = _Q, name = "Lay Waste", spellName = "LayWaste", spellDelay = 750, spellAnimationDelay = 250, projectileName = "LayWaste_point.troy", range = 875, radius = 50, type = "CIRCULAR"},
      }},
      ["Karma"] = {charName = "Karma", skillshots = {
        --unfinished
        ["Focused Resolve"] = {spellKey = _W, isTargeted = true, name = "Focused Resolve", spellName = "FocusedResolve", spellDelay = 250, range = 650, projectileName = "swain_shadowGrasp_transform.troy", type = "LINE"},
        ["Mantra"] = {spellKey = _R, isSelfCast = true, name = "Mantra", spellName = "Mantra", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 950, type = "CIRCULAR"},
        ["KarmaQ"] = {spellKey = _Q, isCollision = true, name = "KarmaQ", spellName = "KarmaQ", spellDelay = 250, projectileName = "TEMP_KarmaQMis.troy", projectileSpeed = 1700, range = 950, radius = 90, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["KarmaSolKimShield"] = { spellKey = _E, isTargeted = true, isShield = true, spellName = "KarmaSolKimShield", name = "KarmaSolKimShield", range = 800, noAnimation = true,
        damage = function () return 40 + myHero.ap * .5 + 40 * myHero:GetSpellData(_E).level end},
      }},
      ["Kassadin"] = {charName = "Kassadin", skillshots = {
        --unfinished
        ["NullSphere"] = {spellKey = _Q, isTargeted = true, name = "Null Sphere", spellName = "NullSphere", spellDelay = 250, range = 650, projectileName = "swain_shadowGrasp_transform.troy", type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Nether Blade"] = {spellKey = _W, isSelfCast = true, isAutoReset = true, isAutoBuff = true, noAnimation = true, name = "Nether Blade", spellName = "NetherBlade", spellDelay = 250, range = 250, type = "CIRCULAR"},
        ["Force Pulse"] = {spellKey = _E, isTrueRange = true, name = "Force Pulse", spellName = "ForcePulse", spellDelay = 250, range = 700, radius = 200, type = "LINE"},
      }},

      ["Katarina"] = {charName = "Katarina", skillshots = {
        ["KatarinaE"] = { spellKey = _E, isTargeted = true, spellName = "KatarinaE", name = "KatarinaE", range = 700, projectileSpeed = 0, projectileName = "AnnieBasicAttack_mis.troy",},
        ["KatarinaW"] = { spellKey = _W, isSelfCast = true, spellName = "KatarinaW", name = "KatarinaW", range = 375, projectileSpeed = 1400, projectileName = "Disintegrate_mis.troy",},
        ["KatarinaR"] = { spellKey = _R, isSelfCast = true, channelDuration = 2500, spellName = "KatarinaR", name = "KatarinaR", range = 550, projectileName = "katarina_deathLotus_mis.troy", fuckedup = false, blockable = true, danger = 1},
        ["KatarinaQ"] = { spellKey = _Q, isTargeted = true, spellName = "KatarinaQ", name = "KatarinaQ", range = 675, projectileSpeed = 1100, projectileName = "katarina_bouncingBlades_mis.troy", fuckedUp = false, blockable = true, danger = 1},
      }},
      ["Kayle"] = {charName = "Kayle", skillshots = {
        --unfinished
        ["Reckoning"] = {spellKey = _Q, isTargeted = true, name = "Reckoning", spellName = "Reckoning", spellDelay = 250, range = 650, fuckedUp = false, blockable = true, danger = 1},
        ["DivineBlessing"] = {spellKey = _W, isTargeted = true, isHeal = true, name = "Divine Blessing", spellName = "DivineBlessing", spellDelay = 250, range = 900, type = "LINE"},
        ["Righteous Fury"] = {spellKey = _E, isSelfCast = true, noAnimation = true, name = "Righteous Fury", spellName = "RighteousFury", spellDelay = 250, range = 650},
        ["JudicatorIntervention"] = { spellKey = _R, isTargeted = true, isShield = true, isUntargetable = true, spellName = "JudicatorIntervention", name = "JudicatorIntervention", range = 900,},
      }},
      ["Kennen"] = {charName = "Kennen", skillshots = {
        ["KennenShurikenHurlMissile1"] = {spellKey = _Q, isCollision = true, name = "Thundering Shuriken", spellName = "KennenShurikenHurlMissile1", spellDelay = 180, projectileName = "kennen_ts_mis.troy", projectileSpeed = 1700, range = 1050, radius = 50, type = "LINE", fuckedUp = false, blockable = true, danger = 1}
      }},
      ["Khazix"] = {charName = "Khazix", skillshots = {
        ["KhazixQ"] = {spellKey = _Q, isTargeted = true, name = "KhazixQ", spellName = "KhazixQ", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 375, type = "LINE"},
        ["KhazixW"] = {spellKey = _W, isCollision = true, name = "KhazixW", spellName = "KhazixW", spellDelay = 250, projectileName = "Khazix_W_mis_enhanced.troy", projectileSpeed = 1700, range = 1000, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["khazixwlong"] = {name = "khazixwlong", spellName = "khazixwlong", spellDelay = 250, projectileName = "Khazix_W_mis_enhanced.troy", projectileSpeed = 1700, range = 1025, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      }},
      ["KogMaw"] = {charName = "KogMaw", skillshots = {
        ["CausticSpittle"] = {spellKey = _Q, isTargeted = true, name = "Caustic Spittle", spellName = "CausticSpittle", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 625, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Bio-Arcane Barrage"] = {spellKey = _W, isSelfCast = true, isAutoBuff = true, name = "Bio-Arcane Barrage", spellName = "BioArcaneBarrage", spellDelay = 250, range = 600, type = "CIRCULAR"},
        ["KogMawVoidOozeMissile"] = {spellKey = _E, name = "Void Ooze", spellName = "KogMawVoidOozeMissile", spellDelay = 250, projectileName = "KogMawVoidOoze_mis.troy", projectileSpeed = 1450, range = 1200, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Living Artillery"] = {spellKey = _R, name = "Living Artillery", spellName = "KogMawLivingArtillery", spellDelay = 850, projectileName = "KogMawLivingArtillery_mis.troy", range = 2200, radius = 100, type = "CIRCULAR"}
      }},
      ["Leblanc"] = {charName = "Leblanc", skillshots = {
        --unfinished
        ["SigilQ"] = {spellKey = _Q, isTargeted = true, name = "Sigil of Silence", spellName = "SigilQ", spellDelay = 250, projectileName = "non.troy", range = 700, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["LeblancChaosOrbM"] = {spellKey = _R, isTargeted = true, checkName = true, name = "Sigil of Silence R", spellName = "LeblancChaosOrbM", spellDelay = 250, projectileName = "non.troy", range = 700, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["LeblancSoulShackle"] = {spellKey = _E, isCollision = true, name = "Ethereal Chains", spellName = "LeblancSoulShackle", spellDelay = 250, projectileName = "leBlanc_shackle_mis.troy", projectileSpeed = 1600, range = 960, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["LeblancSoulShackleM"] = {name = "Ethereal Chains R", spellName = "LeblancSoulShackleM", spellDelay = 250, projectileName = "leBlanc_shackle_mis_ult.troy", projectileSpeed = 1600, range = 960, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      }},
      ["LeeSin"] = {charName = "LeeSin", skillshots = {
        ["BlindMonkQOne"] = {spellKey = _Q, isCollision = true, checkName = true, name = "Sonic Wave", spellName = "BlindMonkQOne", spellDelay = 250, projectileName = "blindMonk_Q_mis_01.troy", projectileSpeed = 1800, range = 975, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["blindmonkqtwo"] = {spellKey = _Q, checkName = true, isSelfCast = true, name = "Sonic Wave2", spellName = "blindmonkqtwo", spellDelay = 250, range = 975, radius = 70, type = "LINE"},
        ["BlindMonkEOne"] = { spellKey = _E, isSelfCast = true, spellName = "BlindMonkEOne", name = "BlindMonkEOne", range = 350, },
        ["BlindMonkRKick"] = { spellKey = _R, isTargeted = true, isExecute = true, spellName = "BlindMonkRKick", name = "BlindMonkRKick", range = 375, projectileSpeed = 1500,},
      }},
      ["Leona"] = {charName = "Leona", skillshots = {
        ["LeonaShieldOfDaybreakAttack"] = {spellKey = _Q, isTargeted = true, isAutoReset = true, name = "Shield of Daybreak", spellName = "LeonaShieldOfDaybreakAttack", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "CIRCULAR"},
        ["LeonaSolarBarrier"] = { spellKey = _W, isSelfCast = true, spellName = "LeonaSolarBarrier", name = "LeonaSolarBarrier", range = 275, },
        ["Zenith Blade"] = {spellKey = _E, name = "Zenith Blade", spellName = "LeonaZenithBlade", spellDelay = 250, projectileName = "Leona_ZenithBlade_mis.troy", projectileSpeed = 2000, range = 900, radius = 80, type = "LINE"},
        ["Leona Solar Flare"] = {spellKey = _R, name = "Leona Solar Flare", spellName = "LeonaSolarFlare", spellDelay = 250, projectileName = "Leona_SolarFlare_cas.troy", projectileSpeed = 2000, range = 1200, radius = 300, type = "CIRCULAR"}
      }},
      ["Lissandra"] = {charName = "Lissandra", skillshots = {
        ["LissandraW"] = { spellKey = _W, isSelfCast = true, isRoot = true, spellName = "LissandraW", name = "LissandraW", range = 450, },
        ["LissandraR"] = { spellKey = _R, isTargeted = true, isStun = true, spellName = "LissandraR", name = "LissandraR", range = 550, },
        --find projectile speed
        ["LissandraQ"] = { spellKey = _Q, type = "LINE", spellName = "LissandraQ", name = "LissandraQ", projectileName = "Lissandra_Q_Shards.troy", projectileSpeed = 1400, range = 725, radius = 75, fuckedUp = false, blockable = true, danger = 1},
        --["LissandraE"] = { spellKey = _E, castType = 0, spellName = "LissandraE", name = "LissandraE", range = 25000, projectileSpeed = 850, projectileName = "Lissandra_E_Missile.troy", radius = 110,},
        ["LissandraE"] = {name = "LissandraE", spellName = "LissandraE", castDelay = 250, projectileName = "Lissandra_E_Missle.troy", projectileSpeed = 850, range = 1500, radius = 140, fuckedUp = false, blockable = true, danger = 1},
      }},
      ["Lucian"] = {charName = "Lucian", skillshots = {
        ["LucianQ"] =  {spellKey = _Q, name = "LucianQ", isTargeted = true, spellName = "LucianQ", spellDelay = 350, projectileName = "Lucian_Q_laser.troy", range = 570, radius = 65, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["LucianW"] =  {spellKey = _W, name = "LucianW", spellName = "LucianW", spellDelay = 300, projectileName = "Lucian_W_mis.troy", projectileSpeed = 1600, range = 1000, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      }},
      ["Lulu"] = {charName = "Lulu", skillshots = {
        ["LuluQ"] = {spellKey = _Q, name = "Lulu (Q)", spellName = "LuluQ", spellDelay = 250, projectileName = "Lulu_Q_Mis.troy", projectileSpeed = 1450, range = 1000, radius = 50, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["LuluW"] = { spellKey = _W, isTargeted = true, isStun = true, spellName = "LuluW", name = "LuluW", range = 650, },
        ["LuluE"] = { spellKey = _E, isTargeted = true, isShield = true, spellName = "LuluE", name = "LuluE", range = 650,
        damage = function () return 40 + 40 * myHero:GetSpellData(_E).level + myHero.ap * .6 end,},
        ["LuluR"] = { spellKey = _R, isTargeted = true, isShield = true, spellName = "LuluR", name = "LuluR", range = 900,
        damage = function () return 150 + 150 * myHero:GetSpellData(_W).level + myHero.ap * .5 end,},
      }},
      ["Lux"] = {charName = "Lux", skillshots = {
        ["LuxLightBinding"] =  {spellKey = _Q, isCollision = true, name = "Light Binding (Q)", spellName = "LuxLightBinding", spellDelay = 250, projectileName = "LuxLightBinding_mis.troy", projectileSpeed = 1200, range = 1175, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["LuxLightStrikeKugel"] = {spellKey = _W, name = "LuxLightStrikeKugel", spellName = "LuxLightStrikeKugel", spellDelay = 250, projectileName = "LuxLightstrike_mis.troy", projectileSpeed = 1400, range = 1100, radius = 275, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["LuxMaliceCannon"] =  {spellKey = _R, isExecute = true, name = "Lux Malice Cannon", spellName = "LuxMaliceCannon", spellDelay = 950, projectileName = "Enrageweapon_buf_02.troy", range = 3500, radius = 190, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        --["LuxPrismaticWave"] = { spellKey = _W, castType = 0, spellName = "LuxPrismaticWave", name = "LuxPrismaticWave", range = 10000, radius = 150,},
      }},
      ["MasterYi"] = {charName = "Master Yi", skillshots = {
        --unfinished
        ["Alpha Strike"] = {spellKey = _Q, isTargeted = true, isUntargetable = true, name = "Alpha Strike", spellName = "AlphaStrike", spellDelay = 250, range = 600,},
        ["Wuju Style"] = {spellKey = _E, isSelfCast = true, isAutoBuff = true, noAnimation = true, name = "Wuju Style", spellName = "WujuStyle", },
        ["Meditate"] = { spellKey = _W, isSelfCast = true, isAutoReset = true, spellName = "Meditate", name = "Meditate", range = 200, },
      }},
      ["Malzahar"] = {charName = "Malzahar", skillshots = {
        ["Null Zone"] = {spellKey = _W, name = "Null Zone", spellName = "NullZone", spellDelay = 600, range = 800, radius = 250, type = "CIRCULAR"},
        ["Malefic Visions"] = {spellKey = _E, isTargeted = true, name = "Malefic Visions", spellName = "MaleficVisions", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 650, type = "LINE"},
        ["Nether Grasp"] = {spellKey = _R, isTargeted = true, channelDuration = 2500, name = "Nether Grasp", spellName = "NetherGrasp", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "LINE"},
      }},
      ["Malphite"] = {charName = "Malphite", skillshots = {
        ["SeismicShard"] = {spellKey = _Q, isTargeted = true, name = "Seismic Shard", spellName = "SeismicShard", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 625, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Ground Slam"] = {spellKey = _E, isSelfCast = true, name = "Ground Slam", spellName = "GroundSlam", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 200, type = "CIRCULAR"},
        ["Brutal Strikes"] = {spellKey = _W, isSelfCast = true, noAnimation = true, isAutoBuff = true, name = "Brutal Strikes", spellName = "BrutalStrikes", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 200, type = "CIRCULAR"},
        ["UFSlash"] = {name = "UFSlash", spellName = "UFSlash", spellDelay = 250, projectileName = "TEST", projectileSpeed = 1800, range = 1000, radius = 160, type = "LINE"},
      }},
      ["Maokai"] = {charName = "Maokai", skillshots = {
        ["MaokaiUnstableGrowth"] = { spellKey = _W, isTargeted = true, spellName = "MaokaiUnstableGrowth", name = "MaokaiUnstableGrowth", range = 650, },
        ["MaokaiTrunkLine"] = { spellKey = _Q, type = "LINE", spellName = "MaokaiTrunkLine", name = "MaokaiTrunkLine", range = 600, projectileSpeed = 1200, radius = 110, fuckedUp = false, blockable = true, danger = 1},
        ["MaokaiDrain3"] = { spellKey = _R, type = "CIRCULAR", spellName = "MaokaiDrain3", name = "MaokaiDrain3", range = 625, radius = 575,},
        ["MaokaiSapling2"] = { spellKey = _E, type = "LINE", spellName = "MaokaiSapling2", name = "MaokaiSapling2", range = 1100, projectileSpeed = 1750, projectileName = "Maokai_sapling_mis.troy", radius = 175},
      }},
      ["Mordekaiser"] = {charName = "Mordekaiser", skillshots = {
        ["MordekaiserMaceOfSpades"] = { spellKey = _Q, isAutoReset = true, spellName = "MordekaiserMaceOfSpades", name = "MordekaiserMaceOfSpades", range = 125,},
        ["MordekaiserCreepingDeathCast"] = { spellKey = _W, isTargeted = true, isShield = true, spellName = "MordekaiserCreepingDeathCast", name = "MordekaiserCreepingDeathCast", range = 750, projectileName = "mordekaiser_creepingDeath_mis.troy", radius = 200,},
        ["MordekaiserChildrenOfTheGrave"] = { spellKey = _R, isTargeted = true, isExecute = true, spellName = "MordekaiserChildrenOfTheGrave", name = "MordekaiserChildrenOfTheGrave", range = 850,},
        ["MordekaiserSyphonOfDestruction"] = { spellKey = _E, type = "LINE", spellName = "MordekaiserSyphonOfDestruction", name = "MordekaiserSyphonOfDestruction", range = 700, radius = 200},
      }},
      ["Morgana"] = {charName = "Morgana", skillshots = {
        ["DarkBindingMissile"] = {spellKey = _Q, isCollision = true, name = "Dark Binding", spellName = "DarkBindingMissile", spellDelay = 250, projectileName = "DarkBinding_mis.troy", projectileSpeed = 1200, range = 1300, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["TormentedSoil"] = { spellKey = _W, spellName = "TormentedSoil", name = "TormentedSoil", range = 900, radius = 175, type = "CIRCULAR"},
        --["SoulShackles"] = { spellKey = _R, castType = 0, spellName = "SoulShackles", name = "SoulShackles", range = 625, projectileName = "AnnieBasicAttack_mis.troy",},
        --["BlackShield"] = { spellKey = _E, castType = 0, spellName = "BlackShield", name = "BlackShield", range = 750, projectileName = "AnnieBasicAttack_mis.troy",},

      }},
      ["DrMundo"] = {charName = "DrMundo", skillshots = {
        ["InfectedCleaverMissile"] = {spellKey = _Q, isCollision = true, name = "Infected Cleaver", spellName = "InfectedCleaverMissile", spellDelay = 250, projectileName = "dr_mundo_infected_cleaver_mis.troy", projectileSpeed = 2000, range = 1000, radius = 75, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        --["BurningAgony"] = { spellKey = _W, isSelfCast = true, spellName = "BurningAgony", name = "BurningAgony", range = 325, projectileName = "AnnieBasicAttack_mis.troy",},
        ["Sadism"] = { spellKey = _R, isSelfCast = true, isHeal = true, spellName = "Sadism", name = "Sadism", range = math.huge, projectileName = "dr_mundo_sadism_cas_02.troy",},
        ["Masochism"] = { spellKey = _E, isSelfCast = true, isAutoBuff = true, spellName = "Masochism", name = "Masochism", range = 300, },
      }},
      ["Nami"] = {charName = "Nami", skillshots = {
        ["NamiQ"] = {spellKey = _Q, name = "NamiQ", spellName = "NamiQ", spellDelay = 850, projectileName = "Nami_Q_mis.troy", range = 875, radius = 100, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
        ["Ebb and Flow"] = {spellKey = _W, isTargeted = true, name = "Ebb and Flow", spellName = "EbbAndFlow", spellDelay = 250, range = 725,},
        ["TidecallersBlessing"] = {spellKey = _E, isSelfCast = true, name = "TidecallersBlessing", spellName = "TidecallersBlessing", spellDelay = 250, range = 800, type = "CIRCULAR"},
      }},
      ["Nasus"] = {charName = "Nasus", skillshots = {
        --unfinished
        ["NasusW"] = {spellKey = _W, isTargeted = true, name = "Wither", spellName = "NasusW", spellDelay = 250, range = 600, type = "LINE"},
        ["NasusE"] = {spellKey = _E, spellName = "NasusE", name = "NasusE", range = 650, radius = 400, type = "CIRCULAR" },
        ["NasusQ"] = {spellKey = _Q, isSelfCast = true, isAutoReset = true, name = "Siphoning Strike", spellName = "NasusQ", spellDelay = 250, range = 125, type = "CIRCULAR"},
      }},
      ["Nautilus"] = {charName = "Nautilus", skillshots = {
        ["NautilusAnchorDrag"] = {spellKey = _Q, isCollision = true, name = "Dredge Line", spellName = "NautilusAnchorDrag", spellDelay = 250, projectileName = "Nautilus_Q_mis.troy", projectileSpeed = 2000, range = 1080, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["NautilusPiercingGaze"] = { spellKey = _W, isSelfCast = true, isShield = true, spellName = "NautilusPiercingGaze", name = "NautilusPiercingGaze", range = math.huge, },
        ["NautilusSplashZone"] = { spellKey = _E, isSelfCast = true, spellName = "NautilusSplashZone", name = "NautilusSplashZone", range = 600, },
        ["NautilusGrandLine"] = { spellKey = _R, isTargeted = true, spellName = "NautilusGrandLine", name = "NautilusGrandLine", range = 825, projectileSpeed = 1400, },
      }},
      ["Nidalee"] = {charName = "Nidalee", skillshots = {
        ["JavelinToss"] = {spellKey = _Q, isCollision = true, name = "Javelin Toss", spellName = "JavelinToss", spellDelay = 125, projectileName = "nidalee_javelinToss_mis.troy", projectileSpeed = 1300, range = 1500, radius = 60, type = "LINE", checkName = true, fuckedUp = false, blockable = true, danger = 1},
        ["PrimalSurge"] = { spellKey = _E, isTargeted = true, isHeal = true, spellName = "PrimalSurge", name = "PrimalSurge", range = 600, checkName = true, },
        ["Bushwhack"] = { spellKey = _W, type = "CIRCULAR", spellName = "Bushwhack", name = "Bushwhack", range = 900, radius = 70, checkName = true, },

        ["Swipe"] = { spellKey = _E, type = "LINE", spellName = "Swipe", name = "Swipe", range = 400, radius = 200, checkName = true, },
        ["Pounce"] = { spellKey = _W, isSelfCast = true, spellName = "Pounce", name = "Pounce", range = 375, checkName = true, },
        ["Takedown"] = { spellKey = _Q, isSelfCast = true, isAutoReset = true, spellName = "Takedown", name = "Takedown", range = 500, checkName = true, },

        --["AspectOfTheCougar"] = { spellKey = _R, castType = 0, spellName = "AspectOfTheCougar", name = "AspectOfTheCougar", range = 20, projectileName = "TeemoBasicAttack_mis.troy",},
      }},
      ["Nocturne"] = {charName = "Nocturne", skillshots = {
        ["NocturneDuskbringer"] =  {spellKey = _Q, name = "NocturneDuskbringer", spellName = "NocturneDuskbringer", spellDelay = 250, projectileName = "NocturneDuskbringer_mis.troy", projectileSpeed = 1400, range = 1200, radius = 60, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Unspeakable Horror"] = {spellKey = _E, isTargeted = true, name = "UnspeakableHorror", spellName = "UnspeakableHorror", spellDelay = 250, range = 425, type = "LINE"},
      }},
      ["Olaf"] = {charName = "Olaf", skillshots = {
        ["OlafAxeThrow"] = {spellKey = _Q, name = "Undertow", spellName = "OlafAxeThrow", spellDelay = 250, projectileName = "olaf_axe_mis.troy", projectileSpeed = 1600, range = 1000, radius = 90, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Reckless Swing"] = {spellKey = _E, isTargeted = true, name = "Reckless Swing", spellName = "RecklessSwing", spellDelay = 250, range = 325, type = "LINE"},
        ["Vicious Strikes"] = {spellKey = _W, isSelfCast = true, isAutoBuff = true, noAnimation = true, name = "Vicious Strikes", spellName = "ViciousStrikes", range = 200},
      }},
      ["Orianna"] = {charName = "Orianna", skillshots = {
        --["OrianaReturn"] = { spellKey = ExtraSpell5, castType = 1, spellName = "OrianaReturn", name = "OrianaReturn", range = 10000, projectileSpeed = 2250, projectileName = "Oriana_Ghost_mis_return.troy", radius = 200,},
        --["OrianaRedact"] = { spellKey = ExtraSpell3, castType = 3, spellName = "OrianaRedact", name = "OrianaRedact", range = 1500, projectileSpeed = 2250, projectileName = "Oriana_Ghost_mis_protect.troy", radius = 80,},
        --["OrianaIzuna"] = { spellKey = ExtraSpell1, castType = 3, spellName = "OrianaIzuna", name = "OrianaIzuna", range = 2000, projectileSpeed = 1350, projectileName = "Oriana_Ghost_mis.troy", radius = 80,},
        --["OrianaDetonateCommand"] = { spellKey = _R, castType = 0, spellName = "OrianaDetonateCommand", name = "OrianaDetonateCommand", range = 410, projectileSpeed = 1200, radius = 80,},
        ["OrianaIzunaCommand"] = { spellKey = _Q, type = "LINE", spellName = "OrianaIzunaCommand", name = "OrianaIzunaCommand", range = 825, projectileSpeed = 1200, radius = 80,},

        ["OrianaRedactCommand"] = { spellKey = _E, isTargeted = true, isShield = true, spellName = "OrianaRedactCommand", name = "OrianaRedactCommand", range = 1120, projectileSpeed = 1200, radius = 80,},
        ["OrianaDissonanceCommand"] = { spellKey = _W, isSelfCast = true, spellName = "OrianaDissonanceCommand", name = "OrianaDissonanceCommand", range = math.huge, radius = 80,},
      }},
      ["Pantheon"] = {charName = "Pantheon", skillshots = {
        --unfinished
        ["SpearShot"] = {spellKey = _Q, isTargeted = true, name = "Spear Shot", spellName = "SpearShot", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
        ["Aegis of Zeonia"] = {spellKey = _W, isTargeted = true, name = "Aegis of Zeonia", spellName = "PantheonW", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, type = "LINE"},
        ["Pantheon_Heartseeker"] = {spellKey = _E, channelDuration = 750, name = "Heartseeker Strike", spellName = "Pantheon_Heartseeker", spellDelay = 250, projectileName = "Thresh_Q_whip_beam.troy", projectileSpeed = 2000, range = 600, radius = 200, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      }},
      ["Poppy"] = {charName = "Poppy", skillshots = {
        --unfinished
        ["Devastating Blow"] = {spellKey = _Q, isTargeted = true, name = "Devastating Blow", spellName = "DevastatingBlow", spellDelay = 250, range = 125, projectileName = "swain_shadowGrasp_transform.troy", type = "LINE"},
        ["Heroic Charge"] = {spellKey = _E, isTargeted = true, name = "Heroic Charge", spellName = "HeroicCharge", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 525, type = "LINE"},
        ["Paragon of Demacia"] = {spellKey = _W, isSelfCast = true, isAutoBuff = true, noAnimation = true, name = "Paragon of Demacia", spellName = "PoppyW", spellDelay = 250, range = 300,},
      }},
      ["Quinn"] = {charName = "Quinn", skillshots = {
        ["QuinnQ"] = {spellKey = _Q, isCollision = true, name = "QuinnQ", spellName = "QuinnQ", spellDelay = 250, projectileName = "Quinn_Q_missile.troy", projectileSpeed = 1550, range = 1050, radius = 80, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["QuinnE"] = { spellKey = _E, isTargeted = true, spellName = "QuinnE", name = "QuinnE", range = 750, },
      }},
      ["Rumble"] = {charName = "Rumble", skillshots = {
        ["RumbleGrenade"] =  {spellKey = _E, name = "RumbleGrenade", spellName = "RumbleGrenade", spellDelay = 250, projectileName = "rumble_taze_mis.troy", projectileSpeed = 2000, range = 800, radius = 90, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Flamespitter"] =  {spellKey = _Q, name = "Flamespitter", spellName = "Flamespitter", spellDelay = 250, range = 650, radius = 90, type = "CIRCULAR"},
        ["RumbleShield"] = { spellKey = _W, isSelfCast = true, isShield = true, spellName = "RumbleShield", name = "RumbleShield", range = math.huge,
        damage = function () return 20 + 30 * myHero:GetSpellData(_W).level + myHero.ap * .4 end,},
      }},
      ["Rengar"] = {charName = "Rengar", skillshots = {
        --unfinished
        ["RengarE"] = {spellKey = _E, isTargeted = true, name = "Bola Strike", spellName = "RengarE", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 575, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Savagery"] = {spellKey = _Q, isSelfCast = true, isAutoReset = true, name = "Savagery", spellName = "Savagery", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "CIRCULAR"},
        --["Empowered Savagery"] = {spellKey = _Q, isSelfCast = true, isAutoReset = true, hasBuff="" ,name = "Empowered Savagery", spellName = "EmpoweredSavagery", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "CIRCULAR"},
        ["Battle Roar"] = {spellKey = _W, isSelfCast = true, noAnimation = true, name = "Battle Roar", spellName = "RengarQ", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 500, type = "CIRCULAR"},
      }},
      ["Renekton"] = {charName = "Renekton", skillshots = {
        --unfinished
        ["Ruthless Predator"] = {spellKey = _W, isTargeted = true, isAutoReset = true, name = "Ruthless Predator", spellName = "RuthlessPredator", spellDelay = 250, range = 125, projectileName = "swain_shadowGrasp_transform.troy", type = "LINE"},
        ["Cull the Meek"] = {spellKey = _Q, isSelfCast = true, isTrueRange = true, name = "Cull the Meek", spellName = "RenektonQ", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 225, type = "CIRCULAR"},
        ["Slice And Dice"] = {spellKey = _E, name = "Slice", spellName = "Slice", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 450, radius = 200, type = "LINE"},
      }},
      ["Riven"] = {charName = "Riven", skillshots = {
        --unfinished
        ["Ki Burst"] = {spellKey = _W, isSelfCast = true, name = "Ki Burst", spellName = "RivenW", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "CIRCULAR"},
        ["Broken Wings"] = {spellKey = _Q, name = "Broken Wings", spellName = "RivenTriCleave", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 260, radius = 200, type = "LINE"},
        ["Valor"] = {spellKey = _E, name = "Valor", spellName = "Valor", spellDelay = 250, projectileName = "Thresh_Q_whip_beam.troy", range = 325, radius = 200, type = "LINE"},
        ["RivenR"] = {spellKey = _R, name = "Blade of the Exile", spellName = "RivenR", spellDelay = 250, projectileName = "Thresh_Q_whip_beam.troy", range = 900, radius = 200, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      }},
      ["Ryze"] = {charName = "Ryze", skillshots = {
        --unfinished
        ["Overload"] = {spellKey = _Q, isTargeted = true, name = "Overload", spellName = "Overload", spellDelay = 250, range = 600, projectileName = "Overload_mis.troy", type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Rune Prison"] = {spellKey = _W, isTargeted = true, name = "Rune Prison", spellName = "RunePrison", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, type = "LINE"},
        ["SpellFlux"] = {spellKey = _E, isTargeted = true, name = "Spell Flux", spellName = "SpellFlux", spellDelay = 250, projectileName = "SpellFlux_mis.troy", range = 600, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["Desperate Power"] = {spellKey = _R, isSelfCast = true, name = "Desperate Power", spellName = "Desperate Power", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 600, type = "CIRCULAR"},
      }},
      ["Sejuani"] = {charName = "Sejuani", skillshots = {
        ["SejuaniR"] = {name = "SejuaniR", spellName = "SejuaniGlacialPrisonCast", spellDelay = 250, projectileName = "Sejuani_R_mis.troy", projectileSpeed = 1600, range = 1200, radius = 110, type = "LINE"},
      }},
      ["Shaco"] = {charName = "Shaco", skillshots = {
        ["TwoShivPoison"] = { spellKey = _E, isTargeted = true, spellName = "TwoShivPoison", name = "TwoShivPoison", range = 625, projectileName = "JesterDagger.troy", fuckedUp = false, blockable = true, danger = 1},
        --["HallucinateFull"] = { spellKey = _R, castType = 0, spellName = "HallucinateFull", name = "HallucinateFull", range = 500, projectileName = "AnnieBasicAttack_mis.troy",},
        --["Deceive"] = { spellKey = _Q, castType = 0, spellName = "Deceive", name = "Deceive", range = 25000, projectileName = "AnnieBasicAttack_mis.troy",},
        --["JackInTheBox"] = { spellKey = _W, type = "CIRCULAR", spellName = "JackInTheBox", name = "JackInTheBox", range = 425, projectileName = "TristannaBasicAttack4_mis.troy",},
      }},
      ["Shen"] = {charName = "Shen", skillshots = {
        ["ShadowDash"] = {name = "ShadowDash", spellName = "ShenShadowDash", spellDelay = 0, projectileName = "shen_shadowDash_mis.troy", projectileSpeed = 3000, range = 575, radius = 50, type = "LINE"},
        ["ShenVorpalStar"] = { spellKey = _Q, isTargeted = true, spellName = "ShenVorpalStar", name = "ShenVorpalStar", range = 475, projectileSpeed = 1500, projectileName = "shen_vorpalStar_mis.troy"},
        ["ShenFeint"] = { spellKey = _W, isShield = true, isSelfCast = true, spellName = "ShenFeint", name = "ShenFeint", range = math.huge,
        damage = function () return 20 + 40 * myHero:GetSpellData(_W).level + myHero.ap * .6 end,},
        --["ShenStandUnited"] = { spellKey = _R, castType = 0, spellName = "ShenStandUnited", name = "ShenStandUnited", range = 25000, projectileName = "AnnieBasicAttack_mis.troy",},
      }},
      ["Shyvana"] = {charName = "Shyvana", skillshots = {
        ["ShyvanaDoubleAttack"] = { spellKey = _Q, isSelfCast = true, isAutoReset = true, spellName = "ShyvanaDoubleAttack", name = "ShyvanaDoubleAttack", range = 125, },
        ["ShyvanaFireball"] = { spellKey = _E, spellName = "ShyvanaFireball", name = "ShyvanaFireball", range = 925, projectileSpeed = 1200, projectileName = "shyvana_flameBreath_mis.troy", radius = 60, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["ShyvanaImmolationAura"] = { spellKey = _W, isSelfCast = true, noAnimation = true, spellName = "ShyvanaImmolationAura", name = "ShyvanaImmolationAura", range = 150, },
      }},
      ["Skarner"] = {charName = "Skarner", skillshots = {
        --unfinished
        ["Crystal Slash"] = {spellKey = _Q, isSelfCast = true, name = "Crystal Slash", spellName = "CrystalSlash", spellDelay = 250, range = 300, type = "CIRCULAR"},
        ["Fracture"] = {spellKey = _E, name = "Fracture", spellName = "Fracture", spellDelay = 250, projectileName = "TEMP_KarmaQMis.troy", projectileSpeed = 1700, range = 900, radius = 45, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
        ["SkarnerExoskeleton"] = { spellKey = _W, isSelfCast = true, isShield = true, spellName = "SkarnerExoskeleton", name = "SkarnerExoskeleton", range = math.huge,
        damage = function () return 25 + 55 * myHero:GetSpellData(_W).level + myHero.ap * .8 end,}
      }},
      ["Sion"] = {charName = "Sion", skillshots = {
        ["CrypticGaze"] = { spellKey = _Q, isTargeted = true, isStun = true, spellName = "CrypticGaze", name = "CrypticGaze", range = 550, projectileName = "CrypticGaze_mis.troy",},
        --["DeathsCaressFull"] = { spellKey = _W, castType = 0, spellName = "DeathsCaressFull", name = "DeathsCaressFull", range = 1, projectileName = "AnnieBasicAttack_mis.troy",},
        --["Cannibalism"] = { spellKey = _R, castType = 0, spellName = "Cannibalism", name = "Cannibalism", range = 1,},
        --["Enrage"] = { spellKey = _E, castType = 0, spellName = "Enrage", name = "Enrage", range = 1, projectileName = "FuryoftheAncient_mis.troy",},
      }},
      ["Sivir"] = {charName = "Sivir", skillshots = { --hard to measure speed
      --unfinished
      ["SivirQ"] = {spellKey = _Q, name = "Boomerang Blade", spellName = "SivirQ", spellDelay = 250, projectileName = "Sivir_Base_Q_mis.troy", projectileSpeed = 1350, range = 1075, radius = 101, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["Ricochet"] = {spellKey = _W, isSelfCast = true, isAutoReset = true, name = "Ricochet", spellName = "Ricochet", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 550, type = "LINE"},
    }},
    ["Sona"] = {charName = "Sona", skillshots = {
      ["HymnofValor"] = {spellKey = _Q, isSelfCast = true, name = "Hymn of Valor", spellName = "HymnofValor", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["SonaAriaofPerseverance"] = { spellKey = _W, isSelfCast = true, isHeal = true, spellName = "SonaAriaofPerseverance", name = "SonaAriaofPerseverance", range = 1000,},
      ["SonaCrescendo"] = {name = "Crescendo", spellName = "SonaCrescendo", spellDelay = 250, projectileName = "SonaCrescendo_mis.troy", projectileSpeed = 2400, range = 1000, radius = 150, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
    }},
    ["Soraka"] = {charName = "Soraka", skillshots = {
      ["Infuse"] = {spellKey = _E, isTargeted = true, name = "Infuse", spellName = "Infuse", spellDelay = 250, range = 725, type = "LINE"},
      ["Starcall"] = {spellKey = _Q, isSelfCast = true, isTrueRange = true, name = "Starcall", spellName = "Starcall", spellDelay = 250, range = 675, type = "CIRCULAR"},
      ["AstralBlessing"] = {spellKey = _W, isTargeted = true, isHeal = true, spellName = "AstralBlessing", name = "AstralBlessing", range = 750},
      ["Wish"] = { spellKey = _R, isTargeted = true, isHeal = true, spellName = "Wish", name = "Wish", range = math.huge},
    }},
    ["Swain"] = {charName = "Swain", skillshots = {
      --unfinished
      ["Decrepify"] = {spellKey = _Q, isTargeted = true, name = "Decrepify", spellName = "Decrepify", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 625, radius = 125, type = "LINE", fuckedUp = false, blockable = true, danger = 1, fuckedUp = false, blockable = true, danger = 1},
      ["Nevermove"] = {spellKey = _W, name = "Nevermove", spellName = "SwainShadowGrasp", spellDelay = 875, projectileName = "swain_shadowGrasp_transform.troy", range = 900, radius = 125, type = "CIRCULAR"},
      ["Torment"] = {spellKey = _E, isTargeted = true, name = "Torment", spellName = "Torment", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", projectileSpeed = 1000, range = 625, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
    }},
    ["Syndra"] = {charName = "Syndra", skillshots = {
      ["SyndraQ"] = {name = "SyndraQ", spellName = "SyndraQ", spellDelay = 200, projectileName = "Syndra_Q_cas.troy", projectileSpeed = 300, range = 800, radius = 180, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1}
    }},
    ["Talon"] = {charName = "Talon", skillshots = {
      --unfinished
      ["Noxian Diplomacy"] = {spellKey = _Q, isSelfCast = true, isAutoReset = true, name = "Noxian Diplomacy", spellName = "TalonQ", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "CIRCULAR"},
      ["Cutthroat"] = {spellKey = _E, isTargeted = true, name = "Cutthroat", spellName = "Cutthroat", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "CIRCULAR"},
      ["Rake"] = {spellKey = _W, name = "Rake", spellName = "Rake", spellDelay = 250, projectileName = "Thresh_Q_whip_beam.troy", projectileSpeed = 2000, range = 600, radius = 200, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["ShadowAssault"] = {spellKey = _R, isSelfCast = true, name = "Shadow Assault", spellName = "ShadowAssault", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 500, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
    }},
    ["Taric"] = {charName = "Taric", skillshots = {
      ["Imbue"] = { spellKey = _Q, isTargeted = true, isHeal = true, spellName = "Imbue", name = "Imbue", range = 750, },
      ["Dazzle"] = {spellKey = _E, isTargeted = true, name = "Dazzle", spellName = "Dazzle", spellDelay = 250, range = 625, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["Shatter"] = {spellKey = _W, isSelfCast = true, name = "Shatter", spellName = "Shatter", spellDelay = 250, range = 200, type = "CIRCULAR"},
      ["Radiance"] = {spellKey = _R, isSelfCast = true, name = "Radiance", spellName = "Radiance", spellDelay = 250, range = 200, type = "CIRCULAR"},
    }},
    ["Teemo"] = {charName = "Teemo", skillshots = {
      --insert projectile speed
      ["BlindingDart"] = {spellKey = _Q, isTargeted = true, name = "BlindingDart", spellName = "BlindingDart", spellDelay = 250, projectileName = "BlindShot_mis.troy", projectileSpeed = 1900, range = 680, fuckedUp = false, blockable = true, danger = 1}
    }},
    ["Thresh"] = {charName = "Thresh", skillshots = {
      ["ThreshQ"] = {spellKey = _Q, isCollision = true, name = "ThreshQ", spellName = "ThreshQ", spellDelay = 500, projectileName = "Thresh_Q_whip_beam.troy", projectileSpeed = 1900, range = 1075, radius = 65, type = "LINE", fuckedUp = false, blockable = true, danger = 1}
    }},
    ["Tristana"] = {charName = "Tristana", skillshots = {
      --unfinished
      ["Explosive Shot"] = {spellKey = _E, isTargeted = true, isAutoReset = true, name = "Explosive Shot", spellName = "ExplosiveShot", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "LINE"},
      ["Rapid Fire"] = {spellKey = _Q, isSelfCast = true, name = "Rapid Fire", spellName = "RapidFire", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "CIRCULAR"},
      ["BusterShot"] = {spellKey = _R, isTargeted = true, isExecute = true, name = "Buster Shot", spellName = "BusterShot", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 645, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
    }},
    ["Trundle"] = {charName = "Trundle", skillshots = {
      ["TrundlePain"] = { spellKey = _R, isTargeted = true, spellName = "TrundlePain", name = "TrundlePain", range = 700,},
      ["trundledesecrate"] = { spellKey = _W, spellName = "trundledesecrate", name = "trundledesecrate", range = 900, radius = 1000, type = "CIRCULAR"},
      ["TrundleTrollSmash"] = { spellKey = _Q, isSelfCast = true, isAutoReset = true, spellName = "TrundleTrollSmash", name = "TrundleTrollSmash", range = 125,},
      ["TrundleCircle"] = { spellKey = _E, spellName = "TrundleCircle", name = "TrundleCircle", range = 1000, radius = 62, type = "CIRCULAR"},
    }},
    ["Tryndamere"] = {charName = "Tryndamere", skillshots = {
      ["UndyingRage"] = { spellKey = _R, isSelfCast = true, isShield = true, spellName = "UndyingRage", name = "UndyingRage", range = math.huge,},
    }},
    ["TwistedFate"] = {charName = "TwistedFate", skillshots = {
      ["WildCards"] = {spellKey = _Q, name = "Loaded Dice", spellName = "WildCards", spellDelay = 250, projectileName = "Roulette_mis.troy", projectileSpeed = 1000, range = 1450, radius = 40, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["Pick A Card"] = {spellKey = _W, isSelfCast = true, checkName = true, name = "Pick A Card", spellName = "PickACard", spellDelay = 250, projectileName = "Thresh_Q_whip_beam.troy", projectileSpeed = 1500, range = 700, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["Gold Card"] = {spellKey = _W, isSelfCast = true, checkName = true, name = "Gold Card", spellName = "goldcardlock", spellDelay = 250, projectileName = "TwistedFate_Base_W_GoldCard.troy", projectileSpeed = 1500, range = math.huge, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["Blue Card"] = {spellKey = _W, isSelfCast = true, checkName = true, name = "Blue Card", spellName = "bluecardlock", spellDelay = 250, projectileName = "TwistedFate_Base_W_BlueCard.troy", projectileSpeed = 1500, range = math.huge, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["Red Card"] = {spellKey = _W, isSelfCast = true, checkName = true, name = "Red Card", spellName = "redcardlock", spellDelay = 250, projectileName = "TwistedFate_Base_W_RedCard.troy", projectileSpeed = 1500, range = math.huge, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
    }},
    ["Twitch"] = {charName = "Twitch", skillshots = {
      ["TwitchVenomCask"] = { spellKey = _W, type = "LINE", spellName = "TwitchVenomCask", name = "TwitchVenomCask", projectileName = "Twitch_Venom_Splash.troy", projectileSpeed = 1400, range = 900, radius = 200, fuckedUp = false, blockable = true, danger = 1},
      ["HideInShadows"] = { spellKey = _Q, isSelfCast = true, isAutoBuff = true, noAnimation = ture, spellName = "HideInShadows", name = "HideInShadows", range = 550, },
      ["Expunge"] = { spellKey = _E, isSelfCast = true, spellName = "Expunge", name = "Expunge", range = 1200, fuckedUp = false, blockable = true, danger = 1},
      --["FullAutomatic"] = { spellKey = _R, castType = 0, spellName = "FullAutomatic", name = "FullAutomatic", range = 1200,},
    }},
    ["Udyr"] = {charName = "Udyr", skillshots = {
      ["UdyrPhoenixStance"] = { spellKey = _R, isSelfCast = true, noAnimation = true, isAutoBuff = true, spellName = "UdyrPhoenixStance", name = "UdyrPhoenixStance", range = math.huge,},
      ["UdyrTurtleStance"] = { spellKey = _W, isSelfCast = true, noAnimation = true, isShield = true, spellName = "UdyrTurtleStance", name = "UdyrTurtleStance", range = math.huge,},
      ["UdyrBearStance"] = { spellKey = _E, isSelfCast = true, noAnimation = true, spellName = "UdyrBearStance", name = "UdyrBearStance", range = math.huge,},
      ["UdyrTigerStance"] = { spellKey = _Q, isSelfCast = true, noAnimation = true, isAutoBuff = true, spellName = "UdyrTigerStance", name = "UdyrTigerStance", range = math.huge,},

    }},

    ["Urgot"] = {charName = "Urgot", skillshots = {
      ["UrgotHeatseekingLineMissile"] = {name = "Acid Hunter", spellName = "UrgotHeatseekingLineMissile", spellDelay = 175, projectileName = "UrgotLineMissile_mis.troy", projectileSpeed = 1600, range = 1000, radius = 60, type = "LINE", fuckedUp = false, blockable = true, danger = 1, fuckedUp = false, blockable = true, danger = 1},
      ["UrgotPlasmaGrenade"] = {name = "Plasma Grenade", spellName = "UrgotPlasmaGrenade", spellDelay = 250, projectileName = "UrgotPlasmaGrenade_mis.troy", projectileSpeed = 1750, range = 900, radius = 250, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
    }},
    ["MonkeyKing"] = {charName = "MonkeyKing", skillshots = {
      --unfinished
      ["MonkeyKingNimbus"] = {spellKey = _E, isTargeted = true, name = "Nimbus Strike", spellName = "MonkeyKingNimbus", spellDelay = 250, range = 625, type = "LINE"},
      ["MonkeyKingQAttack"] = {spellKey = _Q, isSelfCast = true, isAutoReset = true, isTrueRange = true, name = "Crushing Blow", spellName = "MonkeyKingQAttack", spellDelay = 250, range = 325, type = "CIRCULAR"},
    }},
    ["Vladimir"] = {charName = "Vladimir", skillshots = {
      --["VladimirSanguinePool"] = { spellKey = _W, castType = 0, spellName = "VladimirSanguinePool", name = "VladimirSanguinePool", range = 1050, projectileName = "DarkWind_mis.troy", radius = 120,},
      ["VladimirHemoplague"] = { spellKey = _R, type = "CIRCULAR", spellName = "VladimirHemoplague", name = "VladimirHemoplague", range = 700, projectileSpeed = 1200, projectileName = "VladHemoPlague_cas.troy", radius = 175,},
      ["VladimirTidesofBlood"] = { spellKey = _E, isSelfCast = true, spellName = "VladimirTidesofBlood", name = "VladimirTidesofBlood", range = 610, projectileSpeed = 1100, projectileName = "VladTidesofBlood_mis.troy", radius = 120,},
      ["VladimirTransfusion"] = { spellKey = _Q, isTargeted = true, spellName = "VladimirTransfusion", name = "VladimirTransfusion", range = 600,},
    }},
    ["Volibear"] = {charName = "Volibear", skillshots = {
      ["VolibearQ"] = { spellKey = _Q, isAutoReset = true, spellName = "VolibearQ", name = "VolibearQ", range = 125, },
      ["VolibearR"] = { spellKey = _R, isAutoBuff = true, spellName = "VolibearR", name = "VolibearR", range = 125, },
      ["VolibearE"] = { spellKey = _E, isSelfCast = true, spellName = "VolibearE", name = "VolibearE", range = 425, projectileName = "FerosciousHowl_cas3.troy",},
      ["VolibearW"] = { spellKey = _W, isTargeted = true, isExecute = true, spellName = "VolibearW", name = "VolibearW", range = 400, },
    }},
    ["Warwick"] = {charName = "Warwick", skillshots = {
      --unfinished
      ["Hungering Strike"] = {spellKey = _Q, isTargeted = true, name = "Hungering Strike", spellName = "HungeringStrike", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 400, type = "LINE"},
      ["Hunters Call"] = {spellKey = _W, isSelfCast = true, isAutoBuff = true, noAnimation = true, name = "Hunters Call", spellName = "HuntersCall", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 300, type = "CIRCULAR"},
    }},
    ["Varus"] = {charName = "Varus", skillshots = {
      ["VarusQ!"] = {spellKey = _Q, name = "Varus Q Missile", spellName = "VarusQ!", spellDelay = 0, projectileName = "VarusQ_mis.troy", projectileSpeed = 1900, range = 1600, radius = 70, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["VarusE"] = {spellKey = _E, name = "Varus E", spellName = "VarusE", spellDelay = 250, projectileName = "VarusEMissileLong.troy", projectileSpeed = 1500, range = 925, radius = 275, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
      ["VarusR"] = {name = "VarusR", spellName = "VarusR", spellDelay = 250, projectileName = "VarusRMissile.troy", projectileSpeed = 1950, range = 1250, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
    }},

    ["Vayne"] = {charName = "Vayne", skillshots = {
      --["VayneInquisition"] = { spellKey = _R, castType = 0, spellName = "VayneInquisition", name = "VayneInquisition", range = 1, projectileName = "AnnieBasicAttack_mis.troy",},
      --["VayneCondemn"] = { spellKey = _E, castType = 0, spellName = "VayneCondemn", name = "VayneCondemn", range = 550, projectileSpeed = 1200, projectileName = "vayne_E_mis.troy",},
      --["VayneSilveredBolts"] = { spellKey = _W, castType = 0, spellName = "VayneSilveredBolts", name = "VayneSilveredBolts", range = 10000, radius = 50,},
      ["VayneTumble"] = { isAutoReset = true, isDash = true, spellName = "VayneTumble", name = "VayneTumble", range = 300, },
      ["VayneCondemn"] = {name = "VayneCondemn", spellName = "VayneCondemn", castDelay = 250, projectileName = "vayne_E_mis.troy", projectileSpeed = 1200, range = 550, radius = 450, fuckedUp = false, blockable = true, danger = 1}
    }},
    ["Veigar"] = {charName = "Veigar", skillshots = {
      ["BalefulStrike"] = {spellKey = _Q, isTargeted = true, name = "Baleful Strike", spellName = "BalefulStrike", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 650, projectileSpeed = 1500, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["Dark Matter"] = {spellKey = _W, name = "VeigarDarkMatter", targetHasBuff = "Stun", spellName = "VeigarDarkMatter", spellDelay = 1250, projectileName = "!", range = 900, radius = 112, type = "CIRCULAR"},
      ["Primordial Burst"] = {spellKey = _R, isTargeted = true, isExecute = true, name = "Primordial Burst", spellName = "PrimordialBurst", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 650, projectileSpeed = 1500, type = "LINE"},
    }},
    ["Vi"] = {charName = "Vi", skillshots = {
      --unfinished
      ["Excessive Force"] = {spellKey = _E, isSelfCast = true, isAutoReset = true, name = "Excessive Force", spellName = "ExcessiveForce", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 125, type = "CIRCULAR"},
    }},
    ["XinZhao"] = {charName = "XinZhao", skillshots = {
      ["Talon Strike"] = {spellKey = _Q, isSelfCast = true, isAutoReset = true, name = "Talon Strike", spellName = "TalonStrike", spellDelay = 250, range = 175, type = "LINE"},
      ["Battle Cry"] = {spellKey = _W, isSelfCast = true, isAutoBuff = true, noAnimation = true, name = "Battle Cry", spellName = "BattleCry", spellDelay = 250, range = 300,},
      ["Crescent Sweep"] = {spellKey = _R, isSelfCast = true, name = "Crescent Sweep", spellName = "CrescentSweep", spellDelay = 250, range = 300, type = "CIRCULAR"},
      ["Audacious Charge"] = { spellKey = _E, isTargeted = true, spellName = "XinZhaoCharge", name = "Audacious Charge", range = 600, },
    }},
    ["Xerath"] = {charName = "Xerath", skillshots = {
      ["XerathMageSpear"] = { spellKey = _E, type = "LINE", isCollision = true, isStun = true, spellName = "XerathMageSpear", name = "XerathMageSpear", projectileName = "Xerath_Base_E_mis.troy", range = 1050, projectileSpeed = 1600, radius = 70, fuckedUp = false, blockable = true, danger = 1},
      ["XerathArcanopulseChargeUp"] = { spellKey = _Q, type = "LINE", spellName = "XerathArcanopulseChargeUp", heroHasNoBuff = "XerathArcanopulseChargeUp", name = "XerathArcanopulseChargeUp", range = 1000, radius = 100, },
      ["XerathArcanopulseChargeUp2"] = { spellKey = _Q, type = "LINE", spellName = "XerathArcanopulseChargeUp2", heroHasBuff = "XerathArcanopulseChargeUp", name = "XerathArcanopulseChargeUp2", range = 750, radius = 100, fuckedUp = false, blockable = true, danger = 1},
      --range function
      ["XerathArcaneBarrage2"] = { spellKey = _W, type = "CIRCULAR", spellName = "XerathArcaneBarrage2", name = "XerathArcaneBarrage2", range = 1100, spellDelay = 750, radius = 200, fuckedUp = false, blockable = true, danger = 1},
      ["XerathLocusOfPower2"] = { spellKey = _R, type = "CIRCULAR", spellName = "XerathLocusOfPower2", name = "XerathLocusOfPower2", projectileName = "Xerath_Base_R_mis.troy", range = 5600, radius = 100, spellDelay = 750, fuckedUp = false, blockable = true, danger = 1},
    }},
    ["Yasuo"] = {charName = "Yasuo", skillshots = {
      ["Steel Tempest"] = {spellKey = _Q, name = "Steel Tempest", isTrueRange = true, spellName = "SteelTempest", spellDelay = 250, projectileName = "Yasuo_Q_WindStrike.troy", range = 475, radius = 50, type = "LINE"},
      ["YasuoQ3W"] = {spellKey = _Q, name = "Steel Tempest3", checkName = true, spellName = "yasuoq3w", spellDelay = 250, projectileName = "Yasuo_Q_wind_mis.troy", projectileSpeed = 1500, range = 900, radius = 100, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
    }},
    ["Yorick"] = {charName = "Yorick", skillshots = {
      ["YorickDecayed"] = { spellKey = _W, spellName = "YorickDecayed", name = "YorickDecayed", range = 600, radius = 100, type = "CIRCULAR"},
      --["YorickReviveAlly"] = { spellKey = _R, castType = 0, spellName = "YorickReviveAlly", name = "YorickReviveAlly", range = 850, projectileSpeed = 1500,},
      ["YorickSpectral"] = { spellKey = _Q, isSelfCast = true, isAutoReset = true, noAnimation = true, spellName = "YorickSpectral", name = "YorickSpectral", range = 125,},
      ["YorickRavenous"] = { spellKey = _E, isTargeted = true, spellName = "YorickRavenous", name = "YorickRavenous", range = 550, },
    }},
    ["Zed"] = {charName = "Zed", skillshots = {
      ["ZedShuriken"] = {spellKey = _Q, name = "ZedShuriken", spellName = "ZedShuriken", spellDelay = 250, projectileName = "Zed_Q_Mis.troy", projectileSpeed = 1700, range = 925, radius = 50, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["ZedShadowSlash"] = { spellKey = _E, isSelfCast = true, spellName = "ZedShadowSlash", name = "ZedShadowSlash", range = 290,},
    }},
    ["Ziggs"] = {charName = "Ziggs", skillshots = {
      ["ZiggsQ"] =  {spellKey = _Q, isCollision = true, name = "ZiggsQ", spellName = "ZiggsQ", spellDelay = 250, projectileName = "ZiggsQ.troy", projectileSpeed = 1700, range = 1400, radius = 155, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["ZiggsW"] =  {spellKey = _W, name = "ZiggsW", spellName = "ZiggsW", spellDelay = 250, projectileName = "ZiggsW_mis.troy", projectileSpeed = 1700, range = 1000, radius = 325, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["ZiggsE"] =  {spellKey = _E, name = "ZiggsE", spellName = "ZiggsE", spellDelay = 250, projectileName = "ZiggsE_Mis_Large.troy", projectileSpeed = 1700, range = 900, radius = 250, type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["ZiggsR"] = { spellKey = _R, isExecute = true, type = "LINE", spellName = "ZiggsR", name = "ZiggsR", range = 5000, projectileSpeed = 1750, projectileName = "ZiggsR_Mis_Nuke.troy", radius = 550, fuckedup = false, blockable = true, danger = 1},
    }},
    ["Zilean"] = {charName = "Zilean", skillshots = {
      --unfinished
      ["TimeBomb"] = {spellKey = _Q, isTargeted = true, name = "Time Bomb", spellName = "TimeBomb", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, radius = 330, type = "CIRCULAR", fuckedUp = false, blockable = true, danger = 1},
      ["Rewind"] = {spellKey = _W, isSelfCast = true, name = "Rewind", spellName = "Rewind", spellDelay = 250, projectileName = "swain_shadowGrasp_transform.troy", range = 700, type = "CIRCULAR"},
      ["ChronoShift"] = { spellKey = _R, isTargeted = true, isShield = true, spellName = "ChronoShift", name = "ChronoShift", range = 900, },
    }},
    ["Zyra"] = {charName = "Zyra", skillshots = {
      ["Deadly Bloom"]   = {spellKey = _Q, name = "Deadly Bloom", spellName = "ZyraQFissure", spellDelay = 625, projectileName = "zyra_Q_cas.troy", range = 800, radius = 220, type = "CIRCULAR"},
      ["Rampant Growth"]   = {spellKey = _W, name = "Rampant Growth", spellName = "Rampant Growth", spellDelay = 625, projectileName = "zyra_Q_cas.troy", range = 850, radius = 220, type = "CIRCULAR"},
      ["ZyraGraspingRoots"] = {spellKey = _E, name = "Grasping Roots", spellName = "ZyraGraspingRoots", spellDelay = 250, projectileName = "Zyra_E_sequence_impact.troy", projectileSpeed = 1150, range = 1150, radius = 70,  type = "LINE", fuckedUp = false, blockable = true, danger = 1},
      ["ZyraBrambleZone"] = { spellKey = _R, type = "CIRCULAR", spellName = "ZyraBrambleZone", name = "ZyraBrambleZone", range = 700, spellDelay = 250, radius = 400},
      ["zyrapassivedeathmanager"] = { spellKey = _Q, checkName = true, name = "Zyra Passive", spellName = "zyrapassivedeathmanager", spellDelay = 500, projectileName = "zyra_passive_plant_mis.troy", projectileSpeed = 2000, range = 1474, radius = 60,  type = "LINE", fuckedUp = false, blockable = true, danger = 1},
    }},
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
    ["Varus"]        = {"Classic", "Blight Crystal", "Arclight", "Arctic Ops", "Heartseeker", "Swift t"},
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

  function sayhello()
    print("<font color=\"#FF0000\"><b> "..Scriptname.."   </b></font><font color=\"#FFFFFF\"> : [ "..Version.." ] version has succesfully loaded, Good luck and don't forget to give a feedback :) " )
  end
  function Akali:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()
      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
  function Diana:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()
      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
    function Orianna:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()

      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
      function TwistedFate:findorb()
       if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()
      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
  function Lissandra:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()
      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
  function Yasuo:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()

      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
  function Viktor:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()

      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
  function Zed:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()

      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
  function Leblanc:findorb()
    if  _G.DAC_Loaded or _G.DAC_Init then
      loaddac = true
      self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully")
    else
      loadiow = true
      LoadIOW()
      self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
      PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
    end
  end
  lastcheck = 0
  function Yasuo:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end
  function Zed:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end
  function Leblanc:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end
    function Orianna:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end
      function TwistedFate:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end
  function Viktor:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end
  function Diana:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end
  function Lissandra:checkothers()
    if os.clock() - lastcheck < 15 then return end
    if self.Config.pred.selectpred:Value() == 2 then
      if not ipred then
        print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : If you want to use Iprediction, IPrediction should be in common folder. " )
        lastcheck = os.clock()
      end
    end
  end

  if _G[GetObjectName(myHero)] then
    _G[GetObjectName(myHero)]()
   -- sayhello()
    -- DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> Skin Hack currently disabled until the next update") end, 14)
  else
    print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\"> :This champion is not supported. Currently supported champions are: "..list.." " )
    print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">Feel free to check my forum topic and ask a new champion or give feedback")
    print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">"..link.."")
  end
