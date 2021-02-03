 -- #Dodge Transformice
    --script hecho por factral#0000 , creditos a Deadjerry y maik005
    
    tfm.exec.disableAutoNewGame(true); tfm.exec.disableAutoShaman(true)
    tfm.exec.disableAfkDeath(true); tfm.exec.disableAutoScore(true)
    tfm.exec.disableAutoTimeLeft(true); tfm.exec.disableAutoScore(true)
    tfm.exec.disableMinimalistMode(); tfm.exec.disableMortCommand() 
    tfm.exec.disablePhysicalConsumables()
 
    for _, v in next, {'help', 'modos', 'settings', 'restart',} do system.disableChatCommandDisplay(v) end

    print("<img src='https://i.imgur.com/CsIOXFg.png' /><br /><br /><br /><br /><br /> <br>")
    print("<br><p align='left'><font color='#638071'>[DODGE] </font><font color='#7CD499'>Welcome to </font><b><font color='#D2EC16'>#dodge </font></b><font color='#7CD499'>survive the cannons!<br>Plase Type</br> <b><font color='#33AA74'>!help</font></b> to show more information about this. </font><font color='#7CD499'>see the project repository here:</font><b><font color='#33AA74'>https://github.com/Factral/dodge</font></b></p>")
 
    boxes={
      help={
        acercade={
          "<p align='center'><font size='25'><bv>Acerca de</bv></font></p> <p align='left'></font> <br><br>Esto es  <b><font                                             color='#FFFF00'>#DODGE</font></b><br><br>Dodge es un minijuego originalmente creado por <font color='#BBCF7B'>Deadjerry</font> y <font color='#BBCF7B'>Maik005</font> de forma separada, el fin de este script, es hacer un re-diseño implementando nuevas funcionalidades y arreglando algunos bugs <br><br>El objetivo de Dodge es que te puedas divertir en tu cTiempoTranscurrido de tribu,   deberás intentar sobrevivir el mayor tiempo que puedas a los cañones que se te lanzan, ¡para así sobrevivir y ganar todas las rondas! <br><br><br><br><br>                                             &#x3c;3 </p>",
                  },
        modos={
          "<p align='center'><font size='25'><bv>Modos</bv></font></p><br><br><p align='left'><font size='13' color='#CF7B7B'>Modo estándar:</font> Es el modo que se ejecuta de forma predeterminada, se divide en 7 rondas y el que mas haya sobrevivido en el total de rondas es el ganador, esta habilitado el doble salto durante el modo dios  <br><br><font size='13' color='#CF7B7B'>Modo crono:</font>Es un modo para contabilizar el tiempo que sobrevives en un mapa determinado, al morir automáticamente te dará el tiempo es segundos que has sobrevivido. Para ponerlo simplemente pon el comando  <font color='#BBCF7B'>!crono</font>  <br><br><font size='13' color='#CF7B7B'>Modo individual:</font> Este modo solo se ejecuta cuando hay una persona en la sala</p>",
              },
        comandos={
          "<p align='center'><font size='25'><bv>Comandos</bv></font></p><br><p align='left'> <b><font color='#EFF0EE'>!np</font></b> cambia de mapa<br><br><b><font color='#EFF0EE'>!modos</font></b> muestra los modos disponibles<br><br><b><font color='#EFF0EE'>!restart</font></b> reinicia las rondas desde 1 (disponible al finalizar todas las rondas)<br><br><b><font color='#EFF0EE'>!redo</font></b> comando para reiniciar el tiempo (disponible en modo crono)</p><br><p align='center'><font size='25'><bv>Teclas</bv></font></p><br><p align='left'><b><font color='#EFF0EE'>L </font></b>: muestra la clasificacion en el modo estandar<br><br><b><font color='#EFF0EE'>O </font></b>: muestra la configuracion de dodge<br><br><b><font color='#EFF0EE'>M </font></b>: muestra los modos disponibles</p>",
                    },
        creditos={
          "<p align='center'><font size='25'><bv>Creditos</bv></font></p><br><br>El rediseño de Dodge es desarrollado por mi, <font color='#7BCFC5'>Factral#0000</font>, he aprendido mucho sobre <font color='#CFA97B'>lua</font> mientras lo desarrollaba y mi intención nunca ha sido que este proyecto sea similar a algún modulo oficial, simplemente lo hice por diversión y aprender un poco de <font color='#CFA97B'>lua.</font><br><br><br>Gracias especiales a <font color='#7BCFC5'>Jp_darkuss#4806</font>  y <font color='#7BCFC5'>Mundialpross#0000</font> por ayudar con parte del codigo y ideas con el diseño</p>",
                  }
            }
          }
    
    players = {}
    winer = {}
    IDList = {}
    maps={7813846,7813847,7814210,7815341,7814864,7814091,7816146,7816244}
    cannones={17,1701,1702,1703,1705,1706,1707,1708,1709,1710,1711,1712,1714,1715,1718,1719,1720,1721}
    specialcannons={ 
      deathmatch={ --creditos a los desarrolladores de deathmatch
                  {"Star of death", "1502f9cb9a8"};    {"Balanced", "149af0fdbf7"};  {"Plate spike", "149af0ef041"};   {"Diamon ore", "149af129a4c"};    {"baffbot", "149af1482f5"};    {"girly", "149aeabeff6"};    {"disturbed eye", "149aeaab097"};    {"cow", "149af1414ae"};    {"magma", "149aea9f2cc"};    {"demon", "149aeab32ec"};   {"shymer", "175c88cf5bd"};    {"contest", "149aeac1f50"};    {"sweet", "149aeac07ee"};    {"cookie", "149af11f084"};    {"drop the boss", "149af134d03"};    {"troll", "149af11af76"};    {"venom", "16ebc8b35de"};    {"nocturnal", "17045bccc54"};    {"cardistry", "169550c8e43"};    {"sharingan", "16943972c4a"};    {"lollipop", "1693eb4fc8b"};    {"oblivion", "172576581a4"};   {"energon", "166216a1a33"};   {"metal plates", "1660c17bb0e"};   {"bronze", "149af130a30"};   {"silver", "149af12c2d6"};    {"vermilion", "1705dfa253d"};      {"target", "175db7c6a9a"};    {"water", "1660c65740f"};    {"air", "1660c5db325"};    {"flame", "1660c4bf1a4"};    {"nature", "149af13faa2"};    {"recycle", "149aeaaf47a"};    {"vine", "149af122bb3"};    {"music", "149af146cb6"};
                 },
      ffarace={  -- creditos a los desarrolladores de ffarace
                "1725661e561","17256629950","172566b1f35","17256648ca4","1725660c3a3","1725664047b","1725663bf5c","1725662f803","1725660a1bf","1725660878e","17256614f72","1725660dd88","17256627e1f","1725662627f","17256646dac","1725661c3f7","1725663e5be","1725662b1d7","17256658589"
              }
                   }

    ffaracecannons=false;deathmatchcannons = false;mostrarTitulo=true;primeraEjecucion=true;rondaFinal=false;bool=false;modoIndividual=false;modoCrono=false;muertoJugadorCrono=false;   
    countdown = 0;  playersAlive=0; count = 0;diagonal=0;mins=0; seconds=0;wait = 0;numeroRonda=1;cambiocannones=0;

    function shootcannonspecial(idcannonn)
      if deathmatchcannons then
        tfm.exec.addImage(""..specialcannons.deathmatch[cannD][2]..".png","#" .. idcannonn,-16,-16,nil)
      elseif ffaracecannons then
        tfm.exec.addImage(""..specialcannons.ffarace[cannF]..".png","#" .. idcannonn,-16,-16,nil)
      end   
    end

    function cerrartodo(name)
      ui.removeTextArea(95,name); ui.removeTextArea(99,name);
      for id=12,17 do  ui.removeTextArea(id,name)   end
      for id=25,33 do  ui.removeTextArea(id,final)  end
    end

    function actualizarcuadro(namee)
      local textcannondeathmatch = "<font color='#B1B0B0' size='13' align='center' face='Ubuntu'>  Cañones Deathmatch     </font>"
      local textcannonffarace = "<font color='#B1B0B0' size='13' align='center' face='Ubuntu'>  Cañones FFArace           </font>"
      local rand_can_txt = deathmatchcannons and "<font color='#63da0b' size='15' align='center' face='Ubuntu'>☑</font>" or "<font color='#727272' size='15' align='center' face='Ubuntu'>☐</font>"
      local rand_can_txt2 = ffaracecannons and "<font color='#63da0b' size='15' align='center' face='Ubuntu'>☑</font>" or "<font color='#727272' size='15' align='center' face='Ubuntu'>☐</font>"
      settings = "<p align='center'><font color='#ffffff' size='13' align='center' face='Ubuntu'>Settings</font></p><br/>"..textcannondeathmatch.."<a href='event:deathmatchcannons'>"..rand_can_txt.."</a><br>"..textcannonffarace.."<a href='event:ffaracecannons'>"..rand_can_txt2.."</a>"
      for name, player in pairs(tfm.get.room.playerList) do
        if players[name].opened.sett then  ui.addTextArea(95, settings, name, 280,145, 210, 110, 0x171616, 0x555555, 0.9, true)   end
      end
    end

    function generarCannonId()
       -- genera numero aleatorio para la posicion dentro de specialcannons     
       cannD = math.random (1,35); cannF=math.random(1,19)
       -- genera el id del cañon para los cañones estandar               
       local value = math.random(1,#cannones) -- Get random number with 1 to length of table.
       local picked_value = cannones[value] -- Pick value from table
       idCannon=picked_value
    end

    function suprimircannones()
      for idCannon, object in pairs(tfm.get.room.objectList) do
            table.insert(IDList, idCannon)
      end
      --eliminar cañones
      for i, idCannon in pairs(IDList) do
        tfm.exec.removeObject(idCannon)
      end
    end

    function verjugadores()
        i=0
          for k,v in pairs(tfm.get.room.playerList) do
            i=i+1
          end
     end   
    
    function EjecutarMapa()        
        if primeraEjecucion then
          tfm.exec.newGame(7818703)
          tfm.exec.setGameTime(1)
        end        
        if not primeraEjecucion then
            local valuee = math.random(1,#maps) -- Get random number with 1 to length of table.
            local picked_valuee = maps[valuee] -- Pick value from table
            codigoMapa = picked_valuee
            tfm.exec.newGame(codigoMapa)
            bool = false; countdown = 0;cambiocannones=0;ui.removeTextArea(101,final);ui.removeTextArea(102,final)
            for name, player in pairs(tfm.get.room.playerList) do players[name].jump = 5  end
        end
    end
    
    local Load= function(time, remaining)
      
      TiempoTranscurrido=time/1000;count = count + 1; diagonal = diagonal + math.random(0, 4)

      if not primeraEjecucion then
            
        if not bool and not rondaFinal and time >= 6000 and time <=50000 then
          shootedcannon= tfm.exec.addShamanObject(idCannon, 820, math.random(150,380), math.random(-135, -45), 0, 0, false)
          shootcannonspecial(shootedcannon)
        end
                    
        if not bool and not rondaFinal and time >= 8000 then
          if count > 10 and TiempoTranscurrido <= 53 then
            shootedcannon1 = tfm.exec.addShamanObject(idCannon, -10, 200, 180)
            shootcannonspecial(shootedcannon1)
            count = 0
          elseif diagonal >= 14 then
            shootedcannon2 = tfm.exec.addShamanObject(idCannon, 110, 100, math.random(-160, -120))
           shootcannonspecial(shootedcannon2)
            diagonal = 0
          end
          --modio dios
          if math.floor(TiempoTranscurrido) == 43 then
            tfm.exec.setUIMapName("<YELLOW>#dodge by factral  <font color='#5c5474'>|</font> <N> Modo Dios En Unos Segundos.... ... .. .")
          end
          if TiempoTranscurrido>= 53 and TiempoTranscurrido <=53.5 then
            generarCannonId()
          end
          if TiempoTranscurrido >= 53 and not modoCrono then
            for name, player in pairs(tfm.get.room.playerList) do players[name].jump = players[name].jump+1  end
            if  modoIndividual then
              tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Individual")
            else
              tfm.exec.setUIMapName("<YELLOW>#dodge by factral        <N>Ronda: <V>"..numeroRonda.."/7      <N>Modo: <V>Estandar")
            end
            shootedcannon4 = tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 270)
            shootedcannon5 = tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 225)
              shootcannonspecial(shootedcannon4)
              shootcannonspecial(shootedcannon5)
          end
          if TiempoTranscurrido >= 53 and  modoCrono then
            tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Crono")
            shootedcannon4 = tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 270)
            shootedcannon5 = tfm.exec.addShamanObject(idCannon, 840, math.random()*350, 225)
              shootcannonspecial(shootedcannon4)
              shootcannonspecial(shootedcannon5)
          end
        end
                
        if TiempoTranscurrido >=6 then
          ui.removeTextArea(25,final); ui.removeTextArea(26,final)
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
            for i=1, 50 do
              tfm.exec.displayParticle(math.random(21,24), math.random(1,800), 20, math.random(-20,20)/100, math.random(10,1000)/100, 0, 0, nil)
            end
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
          showTime(TiempoTranscurrido)            
        end
 
        if bool and modoCrono then
          mins=0; secs=0
        end
                      
        if mostrarTitulo and TiempoTranscurrido <=5 then
          --creditos para Deadjerry y maik005 en esta parte
          game="#Dodge";
          ui.addTextArea(1, "<BR><B><p align='center'><font face='Soopafresh' size='120' color='#000000'><BR>"..game, p, 10, -30, 790, 400, 1, 1, 0.0, false)
          ui.addTextArea(2, "<BR><B><p align='center'><font face='Soopafresh' sdize='120' color='#000000'><BR>"..game, p, 0, -30, 790, 400, 1, 1, 0.0, false)
          ui.addTextArea(3, "<BR><B><p align='center'><font face='Soopafresh' size='120' color='#EAA118'><BR>"..game, p, 5, -35, 790, 400, 1, 1, 0.0, false)
          ui.addTextArea(4, "<BR><B><p align='center'><font face='Soopafres' size='120' color='#000000'><BR>"..game, p, 5, -25, 790, 400, 1, 1, 0.0, false)
          ui.addTextArea(5, "<BR><B><p align='center'><font face='Soopafresh' size='120' color='#E7DB25'><BR>"..game, p, 5, -30, 790, 400, 1, 1, 0.0, false)
        elseif mostrarTitulo and TiempoTranscurrido >=5 then
          for i = 1,5 do   ui.removeTextArea(i, p)   end
          mostrarTitulo=false
        end
      end
    end   
    
    local Wait= 0
    local winned= false
    function eventLoop(time,remaining)
      if not winned then
        if cambiocannones>=3 then
          Wait= Wait + 500
          if Wait>= 3500 then
            Wait= 0
            ui.removeTextArea(101,name)
            ui.removeTextArea(102,name)
          end
        end
        Load(time, remaining)
      else
        Wait= Wait + 500
        if Wait>= 3500 then
          Wait= 0
          finish()
        end
      end
    end   
         
  function reiniciartodo()
    numeroRonda=1;   bool=false;    rondaFinal=false
    for name, player in pairs(tfm.get.room.playerList) do
       players[name].score = 0
    end
    EjecutarMapa()
    darscore()
    ui.removeTextArea(6,final)    
  end
 
  function box(input)
    return boxes.help[input]
  end
 
  function showTime(TiempoTranscurrido) 
    amount = TiempoTranscurrido / 60
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
                   
    if command=="settings" then
      if not primeraEjecucion then
        players[name].opened.help=false;players[name].opened.leader=false;players[name].opened.modos=false;
        cerrartodo(name)        
        if players[name].opened.sett then
          players[name].opened.sett=false
          ui.removeTextArea(95,name)
        else
          players[name].opened.sett=true
        end
        actualizarcuadro(name)    
      end
    end
               
    if command== "lea" then
      if not modoCrono and not primeraEjecucion then
        players[name].opened.help=false;players[name].opened.sett=false;players[name].opened.modos=false;
        cerrartodo(name)
        local leaderboard="<p align='center'><font color='#FFFFFF'>Leaderboard</font><br/><br/>"                    
        for name, player in pairs(tfm.get.room.playerList) do
          leaderboard= leaderboard..players[name].nombre.." - "..players[name].score.." pts<br/>"
        end
        ui.addTextArea(99, leaderboard, name, 280,85, 210, 250, 0x171616, 0x555555, 0.9, true)
        if players[name].opened.leader then
          players[name].opened.leader=false
          ui.removeTextArea(99,name)
        else
          players[name].opened.leader=true
        end       
      end
    end                   
                   
    if command== "np" then
      if  not muertoJugadorCrono then
        if TiempoTranscurrido*1000 <=3000 then
          ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
          ui.addTextArea(26,"<p align='center'><b>Vuelve a escribir el comando.</b></a></p>",final,2,383,270,16,0,0,0,true)
        end
        if TiempoTranscurrido*1000 >=3000 then
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
                    
    if command=="modocrono" then
      if TiempoTranscurrido*1000 >=3000 then
          ui.removeTextArea(22,final); ui.removeTextArea(23,final)
          ui.removeTextArea(25,final);ui.removeTextArea(26,final)
          ui.removeTextArea(7,final)
          reiniciartodo()
          mins=0;  seconds=0;players[name].opened.modos=false;modoCrono=true;modoIndividual=false;muertoJugadorCrono=false
      end
    end
                    
    if command=="redo" then
      if muertoJugadorCrono then                    
        ui.removeTextArea(7,final); ui.removeTextArea(22,final)
        ui.removeTextArea(23,final)
        reiniciartodo()   
        mins=0; seconds=0; muertoJugadorCrono=false
      end
    end
                   
    if command=="modoestandar" then       
      if i>=2 then
        if TiempoTranscurrido*1000 >=3000 then     
          ui.removeTextArea(7,final);ui.removeTextArea(22,final);ui.removeTextArea(23,final)
          ui.removeTextArea(25,final);ui.removeTextArea(26,final)
          reiniciartodo() 
          players[name].opened.modos=false;modoCrono=false;modoIndividual=false;muertoJugadorCrono=false
        end                
      end             
      if i==1 then
        if TiempoTranscurrido*1000 >=3000 then            
          ui.removeTextArea(7,final);ui.removeTextArea(22,final);ui.removeTextArea(23,final)
          ui.removeTextArea(25,final);ui.removeTextArea(26,final)
          reiniciartodo()  
          modoCrono=false;modoIndividual=true;muertoJugadorCrono=false ;players[name].opened.modos=false;                   
        end
      end                                  
    end
                    
    if command=="help" then
     if not primeraEjecucion then 
      players[name].opened.leader=false;players[name].opened.sett=false;players[name].opened.modos=false;     
      cerrartodo(name)
      ui.addTextArea(12,"<p align='left'><a href='event:acercade'><b>Acerca de</b></a></p>",name,149,122,90,16,0x231414,0x3e5d2e,nil,true)
      ui.addTextArea(13,"<p align='left'><a href='event:modos'><b>Modos</b></a></p>",name,149,152,90,16,0x231414,0x3e5d2e,nil,true)
      ui.addTextArea(14,"<p align='left'><a href='event:comandos'><b>Comandos</b></a></p>",name,149,182,90,16,0x231414,0x3e5d2e,nil,true)
      ui.addTextArea(15,"<p align='left'><a href='event:creditos'><b>Creditos</b></a></p>",name,149,212,90,16,0x231414,0x3e5d2e,nil,true)
      --contenido de ccada event
      ui.addTextArea(16,box("acercade")[players[name].helpid],name,230,70,380,280,0x1d1b1b,0x242525,nil,true) 
      --boton para cerrar
      ui.addTextArea(17,"<p align='center'><font size='25'><a href='event:close'><b>X</b></a></p>",name,565,72,53,43,0,0,0,true)                      
    
      if players[name].opened.help then
        players[name].opened.help=false
        for id=12,17 do
          ui.removeTextArea(id,name)
        end
      else
        players[name].opened.help=true
      end     
     end                
    end
                                         
  if command=="modos" then 
    if not primeraEjecucion then    
      players[name].opened.help=false;players[name].opened.leader=false;players[name].opened.sett=false;
      cerrartodo(name)
    end     
    ui.addTextArea(27," ",name,200,120,400,180,0x1d1b1b,0xFFFFFF,nil,true)
    ui.addTextArea(28,"<p align='center'><b><font size='23' color='#37C68E'>Escoge un modo</font></b></a></p>",name,201,125,400,180,0,0,0,true)  
    ui.addTextArea(29," ",name,240,175,100,90,0x141816,0xFFFFFF,nil,true)
    ui.addTextArea(30," ",name,460,175,100,90,0x141816,0xFFFFFF,nil,true)
    ui.addTextArea(31,"<p align='center'><a href='event:modoestandar'><b><font size='17' color='#EC1616'>Modo <br>Estandar</font></b></a></p>",name,240,195,100,90,0,0,0,true)
    ui.addTextArea(32,"<p align='center'><a href='event:modocrono'><b><font size='17' color='#EC1616'>Modo <br>Crono</font></b></a></p>",name,460,195,100,90,0,0,0,true)
    if not primeraEjecucion then
      ui.addTextArea(33,"<p align='center'><font size='25'><a href='event:cerrar'><b>X</b></a></p>",name,552,119,53,43,0,0,0,true)        
      if players[name].opened.modos == true then
        players[name].opened.modos=false
        for id=25,33 do
          ui.removeTextArea(id,final)
        end
      else         
        players[name].opened.modos=true
      end
    end                     
  end
  end
                    
  function eventKeyboard(name,key,down,x,y)
      
    if (key == 32 and TiempoTranscurrido >=53 and not modoCrono and players[name].jump >= 5) then
          tfm.exec.movePlayer(name,0,0,true,0,-60,false)
          players[name].jump = 0
    end
            
    if key == 72 then
      eventChatCommand(name,"help")        
    elseif key==76 then     
      eventChatCommand(name,"lea")
    elseif key==77 then
      eventChatCommand(name,"modos")
    elseif key==79 then
      eventChatCommand(name,"settings")      
    end
    
  end                 
      
  function eventNewPlayer(name)
    players[name] = {
                score = 0,
                helpid=1,
                jump=5,
                nombre=name,
                opened={
                  help=false;
                  leader=false;
                  sett=false;
                  modos=false;
                        }
                    }
    ui.addTextArea(10,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",name,779,387,17,12,0x030200,0x2a291a,nil,true)
    ui.addTextArea(11,"<p align='center'><a href='event:help'><b><font color='#FFFFFF'>?</font></b></a></p>",name,780,383,16,16,0,0,0,true)           
    for name in pairs(tfm.get.room.playerList) do
      for keys, k in pairs({32, 72, 76,79,77}) do
        tfm.exec.bindKeyboard(name, k, true, true)
      end
    end
  end
        
  function darscore()
    for name, player in pairs(tfm.get.room.playerList) do
      tfm.exec.setPlayerScore(name, 0, false)
    end
  end      
    
  function eventTextAreaCallback(id,name,callback)
    if callback=="deathmatchcannons" then
      if deathmatchcannons then
        if cambiocannones<=2 then
          deathmatchcannons=false
          actualizarcuadro(name)
          cambiocannones=cambiocannones+1
        else
        ui.addTextArea(101,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",name,2,387,270,12,0x171616,0x772727,nil,true)
        ui.addTextArea(102,"<p align='center'><b>Espera al siguiente mapa.</b></a></p>",name,2,383,270,16,0,0,0,true)
        end   
      elseif deathmatchcannons==false then
        if cambiocannones<=2 then
          ffaracecannons=false; cannons=deathmatch;
          deathmatchcannons=true
          actualizarcuadro(name)
          cambiocannones=cambiocannones+1
        else
        ui.addTextArea(101,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",name,2,387,270,12,0x171616,0x772727,nil,true)
        ui.addTextArea(102,"<p align='center'><b>Espera al siguiente mapa.</b></a></p>",name,2,383,270,16,0,0,0,true)                                
        end 
      end
    end


    if callback=="ffaracecannons" then
      if ffaracecannons then
        if cambiocannones<=2 then
          ffaracecannons=false
          actualizarcuadro(name)
          cambiocannones=cambiocannones+1
        else
        ui.addTextArea(101,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",name,2,387,270,12,0x171616,0x772727,nil,true)
        ui.addTextArea(102,"<p align='center'><b>Espera al siguiente mapa.</b></a></p>",name,2,383,270,16,0,0,0,true)
        end   
      elseif ffaracecannons==false then
        if cambiocannones<=2 then
          deathmatchcannons=false; cannons=ffarace;
          ffaracecannons=true
          actualizarcuadro(name)
          cambiocannones=cambiocannones+1
        else
        ui.addTextArea(101,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",name,2,387,270,12,0x171616,0x772727,nil,true)
        ui.addTextArea(102,"<p align='center'><b>Espera al siguiente mapa.</b></a></p>",name,2,383,270,16,0,0,0,true)                                
        end 
      end
    end

    if callback=="help" then
      eventChatCommand(name,callback) 
      elseif callback=="close" then
        players[name].helpid=1
        for id=12,17 do
          ui.removeTextArea(id,name)
          players[name].opened.help=false
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
        if TiempoTranscurrido*1000<=3000 then
          ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
          ui.addTextArea(26,"<p align='center'><b>Vuelve a escoger porfavor.</b></a></p>",final,2,383,270,16,0,0,0,true)    
        else    
          primeraEjecucion=false
          for id=25,33 do
            ui.removeTextArea(id,final)
          end        
          eventChatCommand(name,"modoestandar")
        end
      
      elseif callback=="modocrono" then
        if TiempoTranscurrido*1000<=3000 then
          ui.addTextArea(25,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
          ui.addTextArea(26,"<p align='center'><b>Vuelve a escoger porfavor.</b></a></p>",final,2,383,270,16,0,0,0,true)    
        else
          primeraEjecucion=false
          for id=25,33 do
          ui.removeTextArea(id,final)
          end
        end
        eventChatCommand(name,"modocrono")
  
      elseif callback=="cerrar" then
        players[name].opened.modos=false
        for id=25,33 do
          ui.removeTextArea(id,final)
        end   
      end
  end
    
  function eventPlayerDied(name)  
    playersAlive=playersAlive-1
    
    if not modoCrono then
      if playersAlive  == 1 and not rondaFinal then
        bool = true;   winned= true
        tfm.exec.setGameTime(5)
        tfm.exec.setUIMapName("<YELLOW>#dodge by factral  <font color='#5c5474'>|</font>  <N>Cambiando De Mapa.....")                
        suprimircannones()
      end
            
      if playersAlive  == 0 and not rondaFinal     then
        bool = true
        tfm.exec.setGameTime(5)
        tfm.exec.setUIMapName("<YELLOW>#dodge by factral  <font color='#5c5474'>|</font>  <N>Cambiando De Mapa.....")                 
        suprimircannones()
      end
    else
      if playersAlive  == 0 and not rondaFinal then
        muertoJugadorCrono=true
        bool=true                        
        suprimircannones()          
        print("<font color='#24CBC5'>"..name.."</font> ha sobrevivido por <ROSE>"..TiempoTranscurrido.." sg</ROSE>  en el mapa <font color='#6DD6A9'>@"..codigoMapa.."</font>")
        ui.addTextArea(7, "<p align='center'><font size='14' color='#24CBC5'><b>"..name.. "</font><N> ha sobrevivido por "..TiempoTranscurrido.." segundos wow!" , final , 120, 30, 550, 23,0x030303,0x030303)
        ui.addTextArea(22,"<p align='center'><b><font color='#EB1D51'></font></b></a></p>",final,2,387,270,12,0x171616,0x772727,nil,true)
        ui.addTextArea(23,"<p align='center'><b>escribe el comando <font color='#EFF0EE'>!redo</font> para reiniciar</b></a></p>",final,2,383,270,16,0,0,0,true)       
        tfm.exec.respawnPlayer(name)
      end     
    end
  end    
       
  function eventNewGame()
    
    --toma un id para el cañon
    generarCannonId() 
    -- ve los jugadores 
    verjugadores()             
                        
    if i==1 and not modoCrono then
      tfm.exec.setUIMapName("<YELLOW>#dodge by factral              <N>Modo: <V>Individual")
      modoIndividual = true; numeroRonda=1
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
    
  function finish()
    numeroRonda=numeroRonda+1
    for name, player in pairs(tfm.get.room.playerList) do
      if not player.isDead then
        players[name].score = players[name].score + 1
        tfm.exec.setPlayerScore(name, 5, true)
      end
      tfm.exec.giveCheese(name)
      tfm.exec.playerVictory(name)
    end
    winned= false; Wait= 0 
    if not modoIndividual and not modoCrono then
      ganadorTotal()
    end               
end 
 
  function ganadorTotal()
    if numeroRonda==8 then
      for name, player in pairs(tfm.get.room.playerList) do
            playerPoint = players[name].score
            winer[name] = playerPoint   
      end
      --dar ganador total de todas las rondas    
      local key = next(winer)
      local max = winer[key]
          for k, v in pairs(winer) do
              if winer[k] > max then
                  key, max = k, v
              end
          end
      campeon = key, max                              
      rondaFinal = true;  bool = true; winned=true                                        
    end
  end   
 
  table.foreach(tfm.get.room.playerList, eventNewPlayer)

  eventChatCommand(nil,"modos")
  verjugadores()
  darscore() 
  EjecutarMapa()
