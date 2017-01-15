local Scriptname,Version,Author,LVersion = "Krystra Auto Leveler","Beta Release","Krystra","7.1"
local leveltracker = 0


class "KrystraLevel"

function KrystraLevel:__init( )
  self:LoadTables()
  self:LoadMenu()
  Callback.Add("Tick", function() self:Tick() end)
end
function KrystraLevel:Tick()
  self:LevelLogic()
end
local slotcheck =nil
function KrystraLevel:LevelLogic()
  local logicorder = levelSequenceOrder[self.Config.logic:Value()][myHero.levelData.lvl-myHero.levelData.lvlPts+1]
  local logicspecial =levelSpecialOrder[myHero.charName][myHero.levelData.lvl-myHero.levelData.lvlPts+1]
  if myHero.levelData.lvlPts >0 then
    if os.clock()-leveltracker >0.75 and self.Config.uselevel:Value() and (logicorder  ~= nil and logicspecial  ~= nil)then
      if (self.Config.donot:Value() and myHero.levelData.lvl ==1) then return end
      Control.KeyDown(HK_LUS)
      if self.Config.logic:Value() == 7 then
        Control.KeyDown(logicspecial)
        slotcheck =logicspecial
      else
        Control.KeyDown(logicorder)
        slotcheck =logicorder
      end
      leveltracker = os.clock()
    end
  else
    if Control.IsKeyDown(HK_LUS) then
      Control.KeyUp(HK_LUS)
    end
    if slotcheck ~= nil  then
      if Control.IsKeyDown(slotcheck) then
        Control.KeyUp(slotcheck)
      end
    end
  end


end
function KrystraLevel:LoadMenu()
  self.Config = MenuElement({type = MENU, id = "self.Config", name = ""..Scriptname.." [" .. myHero.charName.."]", leftIcon = "http://ddragon.leagueoflegends.com/cdn/6.24.1/img/champion/"..myHero.charName..".png"})

  self.Config:MenuElement({id = "blank", type = SPACE , name = "              --------  Auto Level Settings ------- "})
  self.Config:MenuElement({id = "uselevel", name = "Use auto level", value =false})
  self.Config:MenuElement({id = "logic", name = "Select auto level logic", value =7, drop = {"Focus Q>W>E", "Focus Q>E>W","Focus W>Q>E","Focus W>E>Q","Focus E>W>Q", "Focus E>Q>W","Smart Selection"}})
  self.Config:MenuElement({id = "donot", name = "Disable on first level", value =true})

  self.Config:MenuElement({id = "blank", type = SPACE , name = "                  "..Scriptname..""})
  self.Config:MenuElement({id = "blank", type = SPACE , name = "Script Version:  "..Version.. "  " })
  self.Config:MenuElement({id = "blank", type = SPACE , name = "Script was made by  "..Author.. ""})
  self.Config:MenuElement({id = "blank", type = SPACE , name = "Leauge Of Legends Version: "..LVersion.. ""})
end
function KrystraLevel:LoadTables()
  levelSequenceOrder = {
    [1]={ HK_Q,HK_W,HK_E,HK_Q,HK_Q,HK_R,HK_Q,HK_W,HK_Q,HK_W,HK_R,HK_W,HK_W,HK_E,HK_E,HK_R,HK_E,HK_E},
    [2]= { HK_Q,HK_W,HK_E,HK_Q,HK_Q,HK_R,HK_Q,HK_E,HK_Q,HK_E,HK_R,HK_E,HK_E,HK_W,HK_W,HK_R,HK_W,HK_W},
    [3]={ HK_W,HK_E,HK_Q,HK_W,HK_W,HK_R,HK_W,HK_Q,HK_W,HK_Q,HK_R,HK_Q,HK_Q,HK_E,HK_E,HK_R,HK_E,HK_E},
    [4]={ HK_W,HK_E,HK_Q,HK_W,HK_W,HK_R,HK_W,HK_E,HK_W,HK_E,HK_R,HK_E,HK_E,HK_Q,HK_Q,HK_R,HK_Q,HK_Q},
    [5]={ HK_E,HK_Q,HK_W,HK_E,HK_E,HK_R,HK_E,HK_W,HK_E,HK_W,HK_R,HK_W,HK_W,HK_Q,HK_Q,HK_R,HK_Q,HK_Q},
    [6]= { HK_E,HK_Q,HK_W,HK_E,HK_E,HK_R,HK_E,HK_Q,HK_E,HK_Q,HK_R,HK_Q,HK_Q,HK_W,HK_W,HK_R,HK_W,HK_W},
    [7]= { HK_E,HK_Q,HK_W,HK_E,HK_E,HK_R,HK_E,HK_W,HK_E,HK_W,HK_R,HK_W,HK_W,HK_Q,HK_Q,HK_R,HK_Q,HK_Q},
  }

  levelSpecialOrder = {
    ["Aatrox"]          =   {HK_W, HK_Q, HK_E, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["AurelionSol"]     =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Ahri"]            =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_W, HK_W},
    ["Akali"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Alistar"]         =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Amumu"]           =   {HK_W, HK_E, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Anivia"]          =   {HK_Q, HK_E, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Annie"]           =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Ashe"]            =   {HK_Q, HK_W, HK_Q, HK_W, HK_E, HK_R, HK_Q, HK_Q, HK_W, HK_Q, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Azir"]            =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Bard"]            =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Blitzcrank"]      =   {HK_Q, HK_E, HK_W, HK_E, HK_W, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Brand"]           =   {HK_W, HK_Q, HK_E, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Braum"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Caitlyn"]         =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Cassiopeia"]      =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Chogath"]         =   {HK_E, HK_Q, HK_W, HK_W, HK_W, HK_R, HK_W, HK_E, HK_W, HK_E, HK_R, HK_E, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Corki"]           =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W},
    ["Darius"]          =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Diana"]           =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["DrMundo"]         =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_E, HK_W, HK_W, HK_W, HK_W},
    ["Draven"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Ekko"]            =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Elise"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Evelynn"]         =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Ezreal"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["FiddleSticks"]    =   {HK_W, HK_E, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Fiora"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Fizz"]            =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Galio"]           =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_E, HK_E},
    ["Gnar"]            =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Gangplank"]       =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Garen"]           =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Gragas"]          =   {HK_W, HK_E, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Graves"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Hecarim"]         =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Heimerdinger"]    =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Illaoi"]          =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Irelia"]          =   {HK_Q, HK_E, HK_W, HK_W, HK_W, HK_R, HK_W, HK_E, HK_W, HK_E, HK_R, HK_E, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Janna"]           =   {HK_E, HK_W, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["JarvanIV"]        =   {HK_E, HK_Q, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Jax"]             =   {HK_E, HK_W, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Jayce"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Jinx"]            =   {HK_Q, HK_W, HK_E, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Jhin"]            =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Kalista"]         =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Karma"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_E, HK_Q, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Karthus"]         =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Kassadin"]        =   {HK_Q, HK_W, HK_E, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Katarina"]        =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Kayle"]           =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Kennen"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Khazix"]          =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Kindred"]         =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["KogMaw"]          =   {HK_W, HK_E, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Leblanc"]         =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_E, HK_W, HK_E, HK_R, HK_E, HK_E},
    ["LeeSin"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Leona"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Lissandra"]       =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Lucian"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Lulu"]            =   {HK_E, HK_W, HK_Q, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Lux"]             =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Malphite"]        =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Malzahar"]        =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_W, HK_R, HK_W, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Maokai"]          =   {HK_E, HK_Q, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["MasterYi"]        =   {HK_E, HK_Q, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["MissFortune"]     =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["MonkeyKing"]      =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Mordekaiser"]     =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Morgana"]         =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Nami"]            =   {HK_Q, HK_W, HK_E, HK_W, HK_W, HK_R, HK_W, HK_E, HK_W, HK_E, HK_R, HK_E, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Nasus"]           =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_E, HK_W, HK_E, HK_R, HK_E, HK_E},
    ["Nautilus"]        =   {HK_W, HK_E, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_E, HK_W, HK_E, HK_R, HK_E, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Nidalee"]         =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Nocturne"]        =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Nunu"]            =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Olaf"]            =   {HK_Q, HK_E, HK_W, HK_E, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Orianna"]         =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Pantheon"]        =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W},
    ["Poppy"]           =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Quinn"]           =   {HK_E, HK_Q, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Rammus"]          =   {HK_W, HK_Q, HK_E, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["RekSai"]          =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Renekton"]        =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Rengar"]          =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Riven"]           =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Rumble"]          =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Ryze"]            =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Sejuani"]         =   {HK_W, HK_Q, HK_E, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Shaco"]           =   {HK_W, HK_E, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Shen"]            =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Shyvana"]         =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Singed"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Sion"]            =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Sivir"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Skarner"]         =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Sona"]            =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Soraka"]          =   {HK_Q, HK_W, HK_E, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Swain"]           =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Syndra"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Taliyah"]         =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["TahmKench"]       =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Talon"]           =   {HK_W, HK_E, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Taric"]           =   {HK_E, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Teemo"]           =   {HK_Q, HK_E, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Thresh"]          =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Tristana"]        =   {HK_E, HK_W, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Trundle"]         =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Tryndamere"]      =   {HK_Q, HK_E, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["TwistedFate"]     =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Twitch"]          =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_Q, HK_W, HK_W},
    ["Udyr"]            =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_R, HK_Q, HK_E, HK_E, HK_E, HK_E, HK_W, HK_R, HK_R, HK_R, HK_R},
    ["Urgot"]           =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Varus"]           =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Vayne"]           =   {HK_Q, HK_W, HK_E, HK_W, HK_W, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_Q, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Veigar"]          =   {HK_Q, HK_W, HK_E, HK_E, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_W, HK_E, HK_R, HK_E, HK_E},
    ["Velkoz"]          =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Vi"]              =   {HK_W, HK_E, HK_Q, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Viktor"]          =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Vladimir"]        =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Volibear"]        =   {HK_W, HK_E, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_E, HK_W, HK_E, HK_R, HK_E, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Warwick"]         =   {HK_W, HK_Q, HK_E, HK_W, HK_Q, HK_R, HK_W, HK_Q, HK_W, HK_Q, HK_R, HK_W, HK_Q, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Xerath"]          =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_W, HK_Q, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["XinZhao"]         =   {HK_W, HK_Q, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Yorick"]          =   {HK_E, HK_W, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_Q},
    ["Zac"]             =   {HK_W, HK_Q, HK_E, HK_E, HK_E, HK_R, HK_E, HK_W, HK_E, HK_W, HK_R, HK_W, HK_W, HK_E, HK_E, HK_R, HK_E, HK_E},
    ["Zed"]             =   {HK_Q, HK_E, HK_W, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Ziggs"]           =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Zilean"]          =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Zyra"]            =   {HK_Q, HK_W, HK_E, HK_Q, HK_Q, HK_R, HK_Q, HK_E, HK_Q, HK_E, HK_R, HK_E, HK_E, HK_W, HK_W, HK_R, HK_W, HK_W},
    ["Yasuo"]           =   {HK_E, HK_Q, HK_W, HK_E, HK_E, HK_R, HK_E, HK_Q, HK_E, HK_Q, HK_R, HK_Q, HK_Q, HK_W, HK_W, HK_R, HK_W, HK_W},
  }
end
function OnLoad()
  DelayAction(function() KrystraLevel()
  PrintChat("Welcome to Krystra Auto Leveler") end ,1)
end
