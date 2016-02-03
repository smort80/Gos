require ('Inspired')
require ('KLib')
 if not pcall( require, "OpenPredict" )  then  print("<font color=\"#FF0000\"><b> "..Scriptname.." [Prediction Manager]  </b></font><font color=\"#FFFFFF\"> : OpenPredict should be in Common folder in order to use this script. " ) return end
 if FileExist(COMMON_PATH .. "IPrediction.lua") then
      require 'IPrediction'
    ipred = true
  end
    local lastTimeTickCalled = 0
  local DAC = false
  local IOW = false

AutoUpdate("/Lonsemaria/Gos/master/Script/KrystraMidBundle.lua","/Lonsemaria/Gos/master/Version/midbundle.version",SCRIPT_PATH.."KrystraMidBundle.lua",1.01)

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
    target = GetGameTarget()
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
  if GetCastName(myHero,_W) == "leblancslidereturn" then  
  if self.Config.combo.turnw.wbackhp:Value() == 1 and self.Config.Keys.combokey:Value() then
   if myHero.health <= (myHero.maxHealth * self.Config.combo.turnw.hp:Value() / 100) then 
            CastSpell(_W)
   end
   end 
   end 
 if GetCastName(myHero,_W) == "leblancslidereturn" then  
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
            if BestPos ~= nil  and  BestHit >= NumberOfHits then
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
            if BestPos ~= nil and BestHit >= NumberOfHits then
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
            if BestPos ~= nil  and  BestHit >= 1 then
              CastSkillShot(_W, BestPos)
          end
      end
     end
        end
        if (myHero.mana / myHero.maxMana >= self.Config.farm.jungleclear.RMana:Value() /100 ) then
        if IsReady(_R) then
        if self.Config.Keys.jungleclearkey:Value()  and self.Config.farm.jungleclear.useR:Value() and GetCastName(myHero,_R) == 'LeblancSlideM'  then 
            local BestPos, BestHit = GetFarmPosition(self.RW.range, self.RW.width, MINION_JUNGLE)
            if BestPos ~= nil and BestHit >= 1 then
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
    if GetCastName(myHero,_W) == "leblancslidereturn" then 
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
          DelayAction(function()  for i, a in pairs(GetEnemyHeroes()) do
            if Interrupt[a.charName] ~= nil then
                for i, spell in pairs(Interrupt[a.charName].stop) do
                     self.Config.misc.interrupt:Boolean(spell.spellName, a.charName.." - "..spell.name, true)
                end
                 end
          
        end
        end, 1)
     
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
    target = GetGameTarget()
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
          local dmgW = self:GetWDmg(unit)
      if(GetDistance(target) <= self.W.range and  IsReady(_W) and health<dmgW and self.Config.killsteal.useW:Value()   and self.Config.killsteal.ks:Value())then
        self:CastW(unit)  
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
       if GetCastLevel(myHero, _E) > 1 then
if Interrupt[unit.charName] ~= nil then
        spell = Interrupt[unit.charName].stop[spell.name]
        if spell ~= nil then
            if self.Config.misc.interrupt[spell.name]:Value() then
                if ValidTarget(unit) and GetDistance(unit) < self.E.range  and IsReady(_E)  and self.Config.misc.interrupt.r:Value() then
                    self:CastE(unit)
                end
            end
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
       
abuff = true
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
            if BestPos ~= nil and  BestHit >= NumberOfHits then
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
            if BestPos ~= nil and  BestHit >= NumberOfHits then
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
    target = GetGameTarget()
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
       if GetCastLevel(myHero, _R) > 1 then
if Interrupt[unit.charName] ~= nil then
        spell = Interrupt[unit.charName].stop[spell.name]
        if spell ~= nil then
            if self.Config.misc.interrupt[spell.name]:Value() then
                if ValidTarget(unit) and GetDistance(unit) < self.R.range  and IsReady(_R)  and self.Config.misc.interrupt.r:Value() then
                    self:CastR(unit)
                end
            end
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
        if(GetDistance(target) <= self.E.range and  IsReady(_E) and health<dmgE and self.Config.killsteal.useE:Value()    and self.Config.killsteal.ks:Value() )then
          self:CastE(unit)  
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
            if BestPos ~= nil  and  BestHit >= NumberOfHits then
                    CastSkillShot(_Q, BestPos)   
          end
      end
        end
        end
        if (myHero.mana / myHero.maxMana >=  self.Config.farm.laneclear.EMana:Value() /100 ) then
            local NumberOfHits = self.Config.farm.laneclear.ecount:Value()
          if self.Config.farm.laneclear.useE:Value()   then 
            local BestPos, BestHit = GetLineFarmPosition(self.E.range, self.E.width, MINION_ENEMY)
            if BestPos ~= nil and  BestHit >= NumberOfHits then
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
            if BestPos ~= nil  and  BestHit >= NumberOfHits then
                    CastSkillShot(_Q, BestPos)   
          end
      end
        end
        end
        if (myHero.mana / myHero.maxMana >=  self.Config.farm.jungleclear.EMana:Value() /100 ) then
            local NumberOfHits = 1
          if self.Config.farm.jungleclear.useE:Value()   then 
            local BestPos, BestHit = GetLineFarmPosition(self.E.range, self.E.width, MINION_JUNGLE)
            if BestPos ~= nil and  BestHit >= NumberOfHits then
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
        self.Config.escape:Boolean("useW",loc_eng[31],true)
        self.Config.escape:Boolean("useE",loc_eng[32],true)
        
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
      DelayAction(function()  for i, a in pairs(GetEnemyHeroes()) do
            if Interrupt[a.charName] ~= nil then
                for i, spell in pairs(Interrupt[a.charName].stop) do
                     self.Config.misc.interrupt:Boolean(spell.spellName, a.charName.." - "..spell.name, true)
                end
                 end
          
        end
        end, 1)
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
    target = GetGameTarget()
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
    target = GetGameTarget()
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
       if GetCastLevel(myHero, _R) > 1 then
if Interrupt[unit.charName] ~= nil then
        spell = Interrupt[unit.charName].stop[spell.name]
        if spell ~= nil then
            if self.Config.misc.interrupt[spell.name]:Value() then
                if ValidTarget(unit) and GetDistance(unit) < self.R.range  and IsReady(_R)  and self.Config.misc.interrupt.r:Value() then
                    self:CastR(unit)
                end
            end
            end
        end
    end
     if GetCastLevel(myHero, _W) > 1 then
    if Interrupt[unit.charName] ~= nil then
        spell = Interrupt[unit.charName].stop[spell.name]
        if spell ~= nil then
            if self.Config.misc.interrupt[spell.name]:Value() then
                if ValidTarget(unit) and GetDistance(unit) < self.W.range  and IsReady(_W) and self.Config.misc.interrupt.w:Value() then
                    self:CastW(unit)
                end
                end
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
       DelayAction(function()  for i, a in pairs(GetEnemyHeroes()) do
            if Interrupt[a.charName] ~= nil then
                for i, spell in pairs(Interrupt[a.charName].stop) do
                     self.Config.misc.interrupt:Boolean(spell.spellName, a.charName.." - "..spell.name, true)
                end
                 end
          
        end
        end, 1)
       
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
  function sayhello()
       print("<font color=\"#FF0000\"><b> "..Scriptname.."   </b></font><font color=\"#FFFFFF\"> : [ "..Version.." ] version has succesfully loaded, Good luck and don't forget to give a feedback :) " ) 
end
function Akali:findorb()
if  _G.DAC_Loaded or _G.DAC_Init then
     DAC = true
                       self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
    PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully") 
else
IOW = true
LoadIOW()
                  self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
        PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
end
end
function Diana:findorb()
if  _G.DAC_Loaded or _G.DAC_Init then
     DAC = true
                       self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
    PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully") 
else
IOW = true
LoadIOW()
                  self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
        PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
end
end
function Lissandra:findorb()
if  _G.DAC_Loaded or _G.DAC_Init then
     DAC = true
                       self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
    PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully") 
else
IOW = true
LoadIOW()
                  self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
        PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
end
end
function Viktor:findorb()
if  _G.DAC_Loaded or _G.DAC_Init then
     DAC = true
                       self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
    PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully") 
else
IOW = true
LoadIOW()

                  self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
        PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
end
end
function Leblanc:findorb()
if  _G.DAC_Loaded or _G.DAC_Init then
     DAC = true
                       self.Config.orb.selectorb:Info("infoK5", "Deftsu's Auto Carry")
    PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Deftsu's Auto Carry integration has been finished succesfully") 
else
IOW = true
LoadIOW()
                  self.Config.orb.selectorb:Info("infoK5", "Insprieds Orb Walker")
        PrintChat("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\">Insprieds Orb Walker integration has been finished succesfully")
end
end
  lastcheck = 0
function Leblanc:checkothers()
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
                    sayhello()
                 -- DelayAction(function() print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#FFFFFF\"> Skin Hack currently disabled until the next update") end, 14)
          else
           print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\"> :This champion is not supported. Currently supported champions are: "..list.." " )
           print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">Feel free to check my forum topic and ask a new champion or give feedback") 
           print("<font color=\"#FF0000\"><b> "..Scriptname.." - </b></font><font color=\"#CBF6FF\">"..link.."") 
          end
