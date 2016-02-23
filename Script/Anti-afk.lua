     Config=MenuConfig("menu","Krystra- Anti Afk" )
      Config:Boolean("use", "Use anti afk.", false)
   Clock = os.clock()

OnTick(function(myHero)
      if os.clock() < Clock or not Config.use:Value()  then return end
      Clock = os.clock() + math.random(60,120)
      MoveToXYZ(myHeroPos())
    end)