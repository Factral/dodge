 -- #Dodge Transformice
    --script hecho por factral#0000 , creditos a Deadjerry y maik005
 
    
    
    tfm.exec.disableAutoNewGame(true)
    tfm.exec.disableAutoShaman(true)
    tfm.exec.disableAfkDeath(true)
    tfm.exec.disableAutoScore(true)
    tfm.exec.disableAutoTimeLeft(true)  
    tfm.exec.setGameTime(0)
    tfm.exec.disableAutoScore(true)
 
     system.disableChatCommandDisplay("help")
      system.disableChatCommandDisplay("modos")
 
     print("<img src='https://i.imgur.com/CsIOXFg.png' /><br /><br /><br /><br /><br /> <br>")
 
     boxes={
        help={
            acercade={
                    "<p align='center'><font size='25'><bv>Acerca de</bv></font></p> <p align='left'></font> <br><br>Esto es  <b><font                                             color='#FFFF00'>#DODGE</font></b><br><br>Dodge es un minijuego originalmente creado por <font color='#BBCF7B'>Deadjerry</font> y <font color='#BBCF7B'>Maik005</font> de forma separada, el fin de este script, es hacer un re-diseño implementando nuevas funcionalidades y arreglando algunos bugs <br><br>El objetivo de Dodge es que te puedas divertir en tu casa de tribu,   deberás intentar sobrevivir el mayor tiempo que puedas a los cañones que se te lanzan, ¡para así sobrevivir y ganar todas las rondas! <br><br><br><br><br>                                             &#x3c;3 </p>",
                    },
            modos={
                  "<p align='center'><font size='25'><bv>Modos</bv></font></p><br><br><p align='left'><font size='13' color='#CF7B7B'>Modo estándar:</font> Es el modo que se ejecuta de forma predeterminada, se divide en 7 rondas y el que mas haya sobrevivido en el total de rondas es el ganador, esta habilitado el doble salto durante el modo dios  <br><br><font size='13' color='#CF7B7B'>Modo crono:</font>Es un modo para contabilizar el tiempo que sobrevives en un mapa determinado, al morir automáticamente te dará el tiempo es segundos que has sobrevivido. Para ponerlo simplemente pon el comando  <font color='#BBCF7B'>!crono</font>  <br><br><font size='13' color='#CF7B7B'>Modo individual:</font> Este modo solo se ejecuta cuando hay una persona en la sala</p>",
                    },
            comandos={
"<p align='center'><font size='25'><bv>Comandos</bv></font></p><br><br><p align='left'> <b><font color='#EFF0EE'>!np</font></b> cambia de mapa (disponible durante los primeros 25 segundos)<br><br><font color='#EFF0EE'>!modos</font> muestra los modos disponibles<br><br><font color='#EFF0EE'>!help</font> despliega este menu<br><br><font color='#EFF0EE'>!restart</font> reinicia las rondas desde 1 (disponible al finalizar todas las rondas)<br><br><font color='#EFF0EE'>!redo</font> comando para reiniciar el tiempo (disponible en modo crono)</p>",
                    },
            creditos={
"<p align='center'><font size='25'><bv>Creditos</bv></font></p><br><br>El rediseño de Dodge es desarrollado por mi, <font color='#7BCFC5'>Factral#0000</font>, he aprendido mucho sobre <font color='#CFA97B'>lua</font> mientras lo desarrollaba y mi intención nunca ha sido que este proyecto sea similar a algún modulo oficial, simplemente lo hice por diversión y aprender un poco de <font color='#CFA97B'>lua.</font><br><br><br>Gracias especiales a <font color='#7BCFC5'>Jp_darkuss#4806</font>  y <font color='#7BCFC5'>Mundialpross#0000</font> por ayudar con parte del codigo y ideas con el diseño</p>",
                    }
            }
        }
    
    players = {}
    winer = {}
    IDList = {}
    maps={7813846,7813847,7814210,7815341,7814864,7814091,7816146,7816244,7817457}
    cannones={17,1701,1702,1703,1705,1706,1707,1708,1709,1710,1711,1712,1714,1715,1718,1719,1720,1721}
        
    
    
    
    primeraEjecucion=true;  rondaFinal=false;   bool=false; modoIndividual=false;       modoCrono=false;        muertoJugadorCrono=false;   
    countdown = 0;  playersAlive=0; count = 0;      jump = 5;       can=0;  dios=0; diagonal = 0;   contador=0; timer=0;    help=0; mins=0; 
    seconds=0;      wait = 0;   numeroRonda=1;
 
 
    
    function verjugadores()
    i=0
          for k,v in pairs(tfm.get.room.playerList) do
            i=i+1
       end
     end
    
    
    function EjecutarMapa()
        if primeraEjecucion then
          tfm.exec.newGame(7818703)
          tfm.exec.setUIMapName("<YELLOW>#dodge by factral           ")
            tfm.exec.setGameTime(1)
          end        
         if not primeraEjecucion then
            local valuee = math.random(1,#maps) -- Get random number with 1 to length of table.
            local picked_valuee = maps[valuee] -- Pick value from table
            codigoMapa = picked_valuee
            tfm.exec.newGame(codigoMapa)
                    bool = false
                    countdown = 0
                    dios = 0             
                     contador=0
        end
    end
    
    
 
        
            
    
    
    
    
    
    local Load= function(time, remaining)
      asa=time/1000
      timer=asa
       jump = jump+1
      count = count + 1
      dios = dios + 1
      
      diagonal = diagonal + math.random(0, 4)   
            
        if not primeraEjecucion then
            
            if not bool and not rondaFinal and time >= 6000 and time <=50000 then
                tfm.exec.addShamanObject(idCannon, 820, math.random(150,380), math.random(-135, -45), 0, 0, false)
            end
            
        
            if not bool and not rondaFinal and time >= 8000 then
                if count > 10 and dios <=100 then
                    --tfm.exec.addShamanObject(4, 810, 0, 90)
                    tfm.exec.addShamanObject(idCannon, -10, 200, 180)
                    count = 0
                elseif diagonal >= 14 then
                    tfm.exec.addShamanObject(idCannon, 110, 100, math.random(-160, -120))
                    diagonal = 0
                end
                --modio dios
                if dios == 80 then
                    tfm.exec.setUIMapName("<YELLOW>#dodge by factral| Modo Dios En Unos Segundos ... .. . .. . ")
                end
                if dios == 100 then
                    local value = math.random(1,#cannones) -- Get random number with 1 to length of table.
                    local picked_value = cannones[value] -- Pick value from table
                    idCannon=picked_value
                end
                if dios >= 100 and not modoCrono then
                    tfm.exec.setUIMapName("<YELLOW>#dodge by factral        <N>Ronda: <V>"..numeroRonda.."/7      <N>Modo: <V>Estandar")
                    tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 270)
                    tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 225)
                end
                if dios >= 100 and  modoCrono then
                tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Crono")
                    tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 270)
                    tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 225)
                
                end
            end
                
                    if asa*1000 >=6000 then
                 ui.removeTextArea(25,final)
                       ui.removeTextArea(26,final)
                end
 
                
                
            if bool and not modoCrono then
                countdown = countdown + 1
                if countdown  >= 3 and not rondaFinal then
                 EjecutarMapa()
                end            
               
               --dar ganador al final de el cumulo de rondas
               
                 if rondaFinal and countdown ==3 then
                  tfm.exec.newGame(7815400)                            
                  ui.addTextArea(6, "<p align='center'><font color='#ffe300' size='14'><b>".. campeon.. "</font><N> Ha ganado!" , final , 200, 30, 400, 23,0x373737,0x373737)
                  tfm.exec.setGameTime(25)
                  tfm.exec.movePlayer(campeon,400,210)
                 end
 
 
                 if rondaFinal and countdown>=4 then              
                  tfm.exec.setUIMapName("<YELLOW>#dodge by factral          <N>Modo: <V>Estandar")
                    if time >= 24000 then
                     reiniciartodo()
                    end
                 end
                                                         
            end
                
            if modoCrono and not muertoJugadorCrono then
                       showTime(timer)            
                end
 
            if bool and modoCrono then
             mins=0
             secs=0
            end
                
                
            can = can + 1
                if can <= 10 then
                --creditos para Deadjerry y maik005 en esta parte
                    face="Soopafresh";
                size="120";
                game="#Dodge";
                color="#E7DB25";
                    ui.addTextArea(1, "<BR><B><p align='center'><font face='"..face.."' size='"..size.."' color='#000000'><BR>"..game, p, 10, -30, 790, 400, 1, 1, 0.0, false)
                    ui.addTextArea(2, "<BR><B><p align='center'><font face='"..face.."' sdize='"..size.."' color='#000000'><BR>"..game, p, 0, -30, 790, 400, 1, 1, 0.0, false)
                    ui.addTextArea(3, "<BR><B><p align='center'><font face='"..face.."' size='"..size.."' color='#EAA118'><BR>"..game, p, 5, -35, 790, 400, 1, 1, 0.0, false)
                    ui.addTextArea(4, "<BR><B><p align='center'><font face='"..face.."' size='"..size.."' color='#000000'><BR>"..game, p, 5, -25, 790, 400, 1, 1, 0.0, false)
                    ui.addTextArea(5, "<BR><B><p align='center'><font face='"..face.."' size='"..size.."' color='"..color.."'><BR>"..game, p, 5, -30, 790, 400, 1, 1, 0.0, false)
                else if can >= 11 then  
                    for i = 1,5 do
                        ui.removeTextArea(i, p)
                    end
                end
            end
        end
    end
    
    local Wait= 0
    local winned= false
    function eventLoop(time,remaining)
            if not winned then
                Load(time, remaining)
            else
                Wait= Wait + 500
                if Wait>= 3500 then
                    Wait= 0
                    finish()
                end
            end
    end
    
    
    
        
   verjugadores()
 
function reiniciartodo()
    numeroRonda=1
    bool=false
    rondaFinal=false
       for name, player in pairs(tfm.get.room.playerList) do
          players[name].score = 0
        end
    EjecutarMapa()
    ui.removeTextArea(6,final)
    darscore()
end
 
function box(input)
return boxes.help[input]
end
 
 
function showTime(timer)
 
    amount = timer / 60
    mins = math.floor(amount)
    seconds = math.floor((amount - mins)*60)
    
    if mins<=9 then
      if seconds <=9 then
      tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Crono         <N>Time : <V>0"..mins..":0"..seconds.."\n")
      end
      if seconds >=10 then
      tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Crono         <N>Time : <V>0"..mins..":"..seconds.."\n")
      end
     end
      if mins>=9 then
      if seconds <=9 then
      tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Crono         <N>Time : <V>"..mins..":0"..seconds.."\n")
      end
      if seconds >=10 then
      tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Crono         <N>Time : <V>"..mins..":"..seconds.."\n")
      end
     end
     
end
 
function eventChatCommand(name,command)
                   
                   if command== "np" then
                      if  not muertoJugadorCrono then
                         if asa*1000 <=3000 then
                            ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
                                ui.addTextArea(26,"<p align='center'><b>Vuelve a escribir el comando.</b></a></p>",final,2,383,270,16,0,0,0,true)
                         end
                          if asa*1000 >=3000 then
                            if bool then
                              ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
                                ui.addTextArea(26,"<p align='center'><b>Espera al siguiente mapa.</b></a></p>",final,2,383,270,16,0,0,0,true)
                                end
                            if not bool then
                            ui.removeTextArea(25,final)
                            ui.removeTextArea(26,final)
                            EjecutarMapa()
                            end
                        end
                    end
                  end
                    
                    if command=="restart" then
                       if numeroRonda==8 then
                       reiniciartodo()    
                     end
                     end
                    
                    if command=="crono" then
                     if asa*1000 <=3000 then
                       ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
                        ui.addTextArea(26,"<p align='center'><b>Vuelve a escribir el comando.</b></a></p>",final,2,383,270,16,0,0,0,true)
                      end
                     if asa*1000 >=3000 then
                       ui.removeTextArea(25,final)
                       ui.removeTextArea(26,final)
                        reiniciartodo()
                        modoCrono=true
                        modoIndividual=false
                        muertoJugadorCrono=false
                       ui.removeTextArea(7,final)
                       ui.removeTextArea(22,final)
                       ui.removeTextArea(23,final)
                       mins=0
                       seconds=0
                       timer=0
                     end
                  end
                    
                   if command=="redo" then
                     if muertoJugadorCrono then
                      reiniciartodo()
                      muertoJugadorCrono=false
                      ui.removeTextArea(7,final)
                      ui.removeTextArea(22,final)
                      ui.removeTextArea(23,final)
                        mins=0
                        seconds=0
                      timer=0
                     end
                   end
                   
                   if command=="estandar" then
                   
                     if i>=2 then
                     if asa*1000 <=3000 then
                               ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
             ui.addTextArea(26,"<p align='center'><b>Vuelve a escribir el comando.</b></a></p>",final,2,383,270,16,0,0,0,true)
             end
             if asa*1000 >=3000 then
                      modoCrono=false
                      invidual=false
                      ui.removeTextArea(7,final)
                       ui.removeTextArea(22,final)
                       ui.removeTextArea(23,final)
                        ui.removeTextArea(25,final)
                       ui.removeTextArea(26,final)
                      reiniciartodo()    
                    end                
                    end
                    
                    end
                    
                    if command=="help" then
                       ui.addTextArea(12,"<p align='left'><a href='event:acercade'><b>Acerca de</b></a></p>",name,149,122,90,16,0x231414,0x3e5d2e,nil,true)
                       ui.addTextArea(13,"<p align='left'><a href='event:modos'><b>Modos</b></a></p>",name,149,152,90,16,0x231414,0x3e5d2e,nil,true)
                       ui.addTextArea(14,"<p align='left'><a href='event:comandos'><b>Comandos</b></a></p>",name,149,182,90,16,0x231414,0x3e5d2e,nil,true)
                       ui.addTextArea(15,"<p align='left'><a href='event:creditos'><b>Creditos</b></a></p>",name,149,212,90,16,0x231414,0x3e5d2e,nil,true)
                      
                       ui.addTextArea(16,box("acercade")[players[name].helpid],name,230,70,380,280,0x1d1b1b,0x242525,nil,true) 
 
                       ui.addTextArea(17,"<p align='center'><font size='25'><a href='event:close'><b>X</b></a></p>",name,565,72,53,43,0,0,0,true)
 
                       end
                       
                       
                      if command=="modos" then
                       ui.addTextArea(27," ",name,200,120,400,180,0x1d1b1b,0xFFFFFF,nil,true)
                       ui.addTextArea(28,"<p align='center'><b><font size='23' color='#37C68E'>Escoge un modo</font></b></a></p>",name,201,125,400,180,0,0,0,true)  
                       ui.addTextArea(29," ",name,240,175,100,90,0x141816,0xFFFFFF,nil,true)
                       ui.addTextArea(30," ",name,460,175,100,90,0x141816,0xFFFFFF,nil,true)
                       ui.addTextArea(31,"<p align='center'><a href='event:modoestandar'><b><font size='17' color='#EC1616'>Modo <br>Estandar</font></b></a></p>",name,240,195,100,90,0,0,0,true)
                         ui.addTextArea(32,"<p align='center'><a href='event:modocrono'><b><font size='17' color='#EC1616'>Modo <br>Crono</font></b></a></p>",name,460,195,100,90,0,0,0,true)
                         if not primeraEjecucion then
                         ui.addTextArea(33,"<p align='center'><font size='25'><a href='event:cerrar'><b>X</b></a></p>",name,552,119,53,43,0,0,0,true)
                         end
                         
                          end        
                         
                             if command=="primeraejecucion" then
                             if primeraEjecucion then
                       ui.addTextArea(27," ",final,200,120,400,180,0x1d1b1b,0xFFFFFF,nil,true)
                       ui.addTextArea(28,"<p align='center'><b><font size='23' color='#37C68E'>Escoge un modo</font></b></a></p>",final,201,125,400,180,0,0,0,true)  
                       ui.addTextArea(29," ",final,240,175,100,90,0x141816,0xFFFFFF,nil,true)
                       ui.addTextArea(30," ",final,460,175,100,90,0x141816,0xFFFFFF,nil,true)
                       ui.addTextArea(31,"<p align='center'><a href='event:modoestandar'><b><font size='17' color='#EC1616'>Modo <br>Estandar</font></b></a></p>",final,240,195,100,90,0,0,0,true)
                         ui.addTextArea(32,"<p align='center'><a href='event:modocrono'><b><font size='17' color='#EC1616'>Modo <br>Crono</font></b></a></p>",final,460,195,100,90,0,0,0,true)
                         end

                    end
end
                    
                    
function eventKeyboard(name,key,down,x,y)
            if dios >=99 and not modoCrono then
                if jump >= 5 then
                    if key == 32 then
                        tfm.exec.movePlayer(name,0,0,true,0,-60,false)
                        jump = 0
                    end
                end
            end
            if key == 72 then
                eventChatCommand(name,"help")
                help=help+1
            end
            
            if help==2 then
                for id=12,17 do
                    ui.removeTextArea(id,name)
                end
              help=0
            end
                        
end
                    
                    
                    
                    
  if primeraEjecucion then
    eventChatCommand(name,"primeraejecucion")
    end
 
 
    
function eventNewPlayer(name)
            players[name] = {
                score = 0,
                helpid=1
            }
    ui.addTextArea(10,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",name,779,387,17,12,0x030200,0x2a291a,nil,true)
    ui.addTextArea(11,"<p align='center'><a href='event:help'><b><font color='#FFFFFF'>?</font></b></a></p>",name,780,383,16,16,0,0,0,true)
end
    
    
function darscore(name)
    for name, player in pairs(tfm.get.room.playerList) do
      tfm.exec.setPlayerScore(name, 0, false)
    end
end
    
darscore()
        
        
for name in pairs(tfm.get.room.playerList) do
    for keys, k in pairs({32, 72}) do
       tfm.exec.bindKeyboard(name, k, true, true)
    end
end
    
    
function eventTextAreaCallback(id,name,callback)
  if callback=="help" then
    eventChatCommand(name,callback)
 
  elseif callback=="close" then
    players[name].helpid=1
     for id=12,17 do
     ui.removeTextArea(id,name)
     ui.removeTextArea(6969+id,name)
     ui.removeTextArea(7979+id,name)
  end
 
  elseif callback=="acercade"  then
   ui.updateTextArea(16,box("acercade")[players[name].helpid],name)
   ui.addTextArea(17,"<p align='center'><font size='25'><a href='event:close'><b>X</b></a></p>",name,565,72,53,43,0,0,0,true)
 
  elseif callback=="modos"  then
   ui.updateTextArea(16,box("modos")[players[name].helpid],name)
   ui.addTextArea(17,"<p align='center'><font size='25'><a href='event:close'><b>X</b></a></p>",name,565,72,53,43,0,0,0,true)
 
  elseif callback=="comandos"  then
   ui.updateTextArea(16, box("comandos")[players[name].helpid],name)
   ui.addTextArea(17,"<p align='center'><font size='25'><a href='event:close'><b>X</b></a></p>",name,565,72,53,43,0,0,0,true)
 
  elseif callback=="creditos"  then
  ui.updateTextArea(16, box("creditos")[players[name].helpid],name)
  ui.addTextArea(17,"<p align='center'><font size='25'><a href='event:close'><b>X</b></a></p>",name,565,72,53,43,0,0,0,true)
  
  elseif callback=="modoestandar" then
  
  crono=false
    if asa*1000<=3000 then
    ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
    ui.addTextArea(26,"<p align='center'><b>Vuelve a escoger porfavor.</b></a></p>",final,2,383,270,16,0,0,0,true)
    
    else
    
    primeraEjecucion=false
     for id=25,33 do
     ui.removeTextArea(id,final)
     end
        if i>=2 then
            eventChatCommand(name,"estandar")
        else 
            EjecutarMapa()
            end
        end
    
  
  elseif callback=="modocrono" then
  if asa*1000<=3000 then
    ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
    ui.addTextArea(26,"<p align='center'><b>Vuelve a escoger porfavor.</b></a></p>",final,2,383,270,16,0,0,0,true)
    
    else
  primeraEjecucion=false
   for id=25,33 do
     ui.removeTextArea(id,final)
   end
     end
  eventChatCommand(name,"crono")
  
  elseif callback=="cerrar" then
   for id=25,33 do
     ui.removeTextArea(id,final)
     end
  
  
  end
  
 
end
 
 
    
    
 
    
    
function eventPlayerDied(name)  
    playersAlive=playersAlive-1
    
        if not modoCrono then
            if playersAlive  == 1 and not rondaFinal then
                bool = true
                winned= true
                tfm.exec.setGameTime(5)
                tfm.exec.setUIMapName("<YELLOW>#dodge by factral  |  Cambiando De Mapa.....")
                --eliminar cañones
                 for idCannon, object in pairs(tfm.get.room.objectList) do
                    table.insert(IDList, idCannon)
                 end
                 for i, idCannon in pairs(IDList) do
                    tfm.exec.removeObject(idCannon)
                 end
 
            end
            
            if playersAlive  == 0 and not rondaFinal     then
                bool = true
                tfm.exec.setGameTime(5)
                tfm.exec.setUIMapName("<YELLOW>#dodge by factral  |  Cambiando De Mapa.....")
                --eliminar cañones
                  for idCannon, object in pairs(tfm.get.room.objectList) do
                    table.insert(IDList, idCannon)
                   end
                  for i, idCannon in pairs(IDList) do
                    tfm.exec.removeObject(idCannon)
                  end
            end
            else
                    if playersAlive  == 0 and not rondaFinal then
                        muertoJugadorCrono=true
                        bool=true
                        --eliminar cañones
                            for idCannon, object in pairs(tfm.get.room.objectList) do
                            table.insert(IDList, idCannon)
                        end
                        for i, idCannon in pairs(IDList) do
                            tfm.exec.removeObject(idCannon)
                        end
          
                print("<font color='#24CBC5'>"..name.."</font> ha sobrevivido por <ROSE>"..asa.." sg</ROSE>  en el mapa <font color='#6DD6A9'>@"..codigoMapa.."</font>")
       ui.addTextArea(7, "<p align='center'><font size='14' color='#24CBC5'><b>"..name.. "</font><N> ha sobrevivido por "..asa.." segundos wow!" , final , 120, 30, 550, 23,0x030303,0x030303)
       
       
                  ui.addTextArea(22,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
ui.addTextArea(23,"<p align='center'><b>escribe el comando <font color='#EFF0EE'>!redo</font> para reiniciar</b></a></p>",final,2,383,270,16,0,0,0,true)
       
                tfm.exec.respawnPlayer(name)
                    end
     
            end
end    
    
    
    
    
function eventNewGame()
    
      --toma un id para el cañon
                local value = math.random(1,#cannones) -- Get random number with 1 to length of table.
            local picked_value = cannones[value] -- Pick value from table
            idCannon=picked_value
 
    
              verjugadores()
             
           
             
             if i==1 and not modoCrono then
              tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Individual")
              modoIndividual = true
              numeroRonda=1
                 elseif modoCrono==true  then            
             tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Crono         <N>Time : <V>"..mins..":"..seconds.."\n")
 
 
                         
             else
            tfm.exec.setUIMapName("<YELLOW>#dodge by factral        <N>Ronda: <V>"..numeroRonda.."/7      <N>Modo: <V>Estandar")
            modoIndividual = false
            end
            
            playersAlive=0
            for n,p in pairs(tfm.get.room.playerList) do
                playersAlive=playersAlive+1
            end
            
            if primeraEjecucion then
            tfm.exec.setUIMapName("<YELLOW>#dodge by factral                                 ")
            end
end
 
    
    
 
    
 
    
    
function finish ()
           numeroRonda=numeroRonda+1
        for name, player in pairs(tfm.get.room.playerList) do
            if not player.isDead then
                players[name].score = players[name].score + 1
                tfm.exec.setPlayerScore(name, 5, true)
            end
            tfm.exec.giveCheese(name)
            tfm.exec.playerVictory(name)
        end
        if not modoIndividual and not modoCrono then
        ganadorTotal()
        end
        winned= false
        Wait= 0 
            
end 
 
 
 
 
function ganadorTotal()
    if numeroRonda==8 then
    for name, player in pairs(tfm.get.room.playerList) do
            playerPoint = players[name].score
            winer[name] = playerPoint   
    end
        
    local key = next(winer)
    local max = winer[key]
        for k, v in pairs(winer) do
            if winer[k] > max then
                key, max = k, v
            end
        end
    campeon = key, max                              
    rondaFinal = true
    bool = true     
                    
                
    end
end
    
    
 
 
for name, player in pairs(tfm.get.room.playerList) do
            eventNewPlayer(name)            
end
 
 
 
EjecutarMapa()
