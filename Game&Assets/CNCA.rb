$choicesmade = [] #global variabel för att hålla koll på val som gjorts i spelet
$day_counter = 1  #global variabel för att hålla koll på vilken dag/natt vi är på

def CNCA()
  # Spelets introduktion
  puts Typer("INTRODUCTION\nWelcome to Cinco Noches con Alfredo!\nChoose your character:")
  puts "Carlos or Valentina"
  Choice("carlos","valentina") #Spelaren kan välja karaktär men det påverkar inte spelandet
  
  puts Typer(Scriptcall(6, 8))  # Bakgrundshistoria
  
  # Börja Natt 1
  puts Typer("\nNIGHT 1 – ARRIVAL")
  puts Typer(Scriptcall(10, 13))
  Storysplit(1,"wait","explore",14,16,17,19)
  Scriptsplit(1, 19, 24, 25, 32)
  puts Typer(Scriptcall(33, 38))
  Storysplit(2,"leave","trust", 39,42,43,47)
  Scriptsplit(2, 49, 52, 45, 48)
  
  if $choicesmade[1] == "2A" #detta händer bara om spelaren valde att lämna i val 2
    puts Typer(Scriptcall(50, 54))
    Storysplit(3,"leave","stay", 56,60,61,63)
    Scriptsplit(3, 64, 67, 86, 90)
    
    if $choicesmade[2] == "3A" #detta händer om de valde att lämna för gott
      puts Typer("Choice 4:\n(4A) Run Back into the Hotel\n(4B) Run Away into the Storm")
      Storysplit(4, "back", "away", 69, 70, 73, 76)
      
      if $choicesmade[3] == "4B"
        GameOver()
        return # Avsluta spelet om spelaren dör
      end
    elsif $choicesmade[2] == "3B" #detta händer om de ändrade sig och stannade
      puts Typer("Choice 5:\n(5A) Run Back into the Lobby\n(5B) Explore the Room\n(5C) Go to Sleep")
      ThreeWayChoice(5, "lobby", "explore", "sleep", 91, 93, 96, 98, 99, 101)
    end
  end
  
  # Natt 1 är klar, gå vidare till Dag 2
  $day_counter = 2
  Sleep()
  
  # Dag 2
  puts Typer("\nDAY 2 – MORNING MYSTERIES")
  puts Typer(Scriptcall(104, 112))
  Storysplit(6, "accept", "explore", 113, 114, 115, 118)
  
  if $choicesmade[5] == "6A" #Frukost med Alfredo
    puts Typer(Scriptcall(119, 123))
    Storysplit(7, "ask", "silent", 124, 126, 127, 129)
    
    if $choicesmade[6] == "7A"
      puts Typer(Scriptcall(130, 134)) #Utfall av att konfrontera mysteriet
    else
      puts Typer(Scriptcall(136, 140)) #Utfall av tyst rädsla
    end
  else #Utforska ensam
    puts Typer(Scriptcall(143, 149))
    Storysplit(8, "gather", "deeper", 150, 152, 153, 155)
    
    if $choicesmade[7] == "8A"
      puts Typer(Scriptcall(156, 161)) #Utfall av dolda bevis
    else
      puts Typer(Scriptcall(163, 168)) #Utfall av att gå djupare in i förbjudna flygeln
    end
  end
  
  # Dag 2 är klar, gå vidare till Natt 3
  $day_counter = 3
  Sleep()
  
  # Natt 3
  puts Typer("\nNIGHT 3 – THE MASK SLIPS")
  puts Typer(Scriptcall(173, 179))
  Storysplit(9, "accept", "refuse", 180, 181, 182, 184)
  
  if $choicesmade[8] == "9A" #Middag med en dold agenda
    puts Typer(Scriptcall(186, 190))
    Storysplit(10, "confront", "silent", 191, 192, 193, 195)
    
    if $choicesmade[9] == "10A"
      puts Typer(Scriptcall(197, 204)) #Utfall av den röda frågan
    else
      puts Typer(Scriptcall(206, 212)) #Utfall av tyst observation
    end
  else #Omedelbart flyktförsök
    puts Typer(Scriptcall(215, 222))
    puts Typer(Scriptcall(224, 228)) #Utfall av misslyckat flyktförsök
  end
  
  # Natt 3 är klar, gå vidare till Natt 4
  $day_counter = 4
  Sleep()
  
  # Natt 4
  puts Typer("\nNIGHT 4 – THE SHIFTING MAZE")
  puts Typer(Scriptcall(233, 239))
  Storysplit(11, "follow", "resist", 240, 241, 242, 245)
  
  if $choicesmade[10] == "11A" #Gå in i privata salongen
    puts Typer(Scriptcall(246, 251))
    Storysplit(12, "question", "explore", 252, 253, 254, 256)
    
    if $choicesmade[11] == "12A"
      puts Typer(Scriptcall(258, 264)) #Utfall av frågandet
    else
      puts Typer(Scriptcall(266, 271)) #Utfall av det dolda arbetsrummet
    end
  else #Utforska labyrinten ensam
    puts Typer(Scriptcall(274, 283))
  end
  
  # Natt 4 är klar, gå vidare till Natt 5
  $day_counter = 5
  Sleep()
  
  # Natt 5
  puts Typer("\nNIGHT 5 – THE FINAL STRUGGLE")
  puts Typer(Scriptcall(289, 295))
  Storysplit(13, "confront", "escape", 296, 297, 298, 301)
  
  if $choicesmade[12] == "13A" #Konfrontation
    puts Typer(Scriptcall(302, 309))
    Storysplit(14, "activate", "fail", 311, 315, 316, 319)
    
    if $choicesmade[13] == "14B"
      GameOver()
      return # Avsluta spelet om spelaren dör
    end
  else #Det slutliga flyktförsöket
    puts Typer(Scriptcall(322, 329))
    Storysplit(15, "rush", "crouch", 330, 331, 332, 334)
    
    if $choicesmade[14] == "15A"
      puts Typer(Scriptcall(336, 341))
      GameOver()
      return # Avsluta spelet om spelaren dör
    else
      puts Typer(Scriptcall(343, 350)) #Den tålmodiga flykten och slutet
    end
  end
  
  puts Typer("\nCongratulations you survived teh five nights at Alfredo.")
  puts Typer("But will alfredo really let you leave...?")
  puts Typer("\nTHE END")
end 

def Scriptcall(start_line, end_line)
  lines = File.readlines("totalscript.txt")

  # jag subtraherar 1 från "start_line" för att få mer användarvänlig kod. Alltså så att index skall stämma överens med siffran i min totalscript txt
  paragraph = lines[(start_line - 1)..(end_line - 1)]
  #.join konkatinerar strängarna i paragraph
  return paragraph.join
end

def Choice(choice1, choice2)
  print "> "
  input = gets.chomp.to_s.downcase
  if input.include?(choice1.downcase)
    chosen = 1
  elsif input.include?(choice2.downcase)
    chosen = 0
  else
    puts "Bad choice, try again."
    return Choice(choice1, choice2) #ber dem att svara på frågan igen
  end
  return chosen
end

def Typer(text)
  i = 0
  while i < text.length
    print text[i]
    sleep(0) #justerar hastigheten på texten som skrivs ut
    $stdout.flush #jag frågade chatgpt om hur man kan få textan att se ut att bli skriven i terminalen och den sa att denna skulle vara med för att den skulle komma en bokstav i taget, annars kan det klumpas ihop av ruby för effektivitet
    i += 1
  end
  return ""
end

def Storysplit(splitpoint, choice1, choice2, start_line1, end_line1, start_line2, end_line2)
  if Choice(choice1, choice2) == 1
    puts Typer(Scriptcall(start_line1, end_line1))
    $choicesmade << "#{splitpoint}A" #här sparar jag valet i en array som jag kan kolla på senare för att se vad som ska hända
  else
    puts Typer(Scriptcall(start_line2, end_line2))
    $choicesmade << "#{splitpoint}B"
  end
  return
end

def Scriptsplit(splitpoint, start_line1, end_line1, start_line2, end_line2) #här kollar man på ett tidigare val för att se vad som ska hända
  if $choicesmade[splitpoint - 1] == "#{splitpoint}A"
    puts Typer(Scriptcall(start_line1, end_line1))
  elsif $choicesmade[splitpoint - 1] == "#{splitpoint}B"
    puts Typer(Scriptcall(start_line2, end_line2))
  end
end

# Ny funktion för val med tre alternativ
def ThreeWayChoice(splitpoint, choice1, choice2, choice3, start_line1, end_line1, start_line2, end_line2, start_line3, end_line3)
  print "> "
  input = gets.chomp.to_s.downcase
  if input.include?(choice1.downcase)
    puts Typer(Scriptcall(start_line1, end_line1))
    $choicesmade << "#{splitpoint}A"
  elsif input.include?(choice2.downcase)
    puts Typer(Scriptcall(start_line2, end_line2))
    $choicesmade << "#{splitpoint}B"
  elsif input.include?(choice3.downcase)
    puts Typer(Scriptcall(start_line3, end_line3))
    $choicesmade << "#{splitpoint}C"
  else
    puts "Bad choice, try again."
    return ThreeWayChoice(splitpoint, choice1, choice2, choice3, start_line1, end_line1, start_line2, end_line2, start_line3, end_line3)
  end
  return
end

# Funktion för övergång mellan dagar/nätter
def Sleep()
  puts Typer("\n*You fall into a troubled sleep...*")
  puts Typer("\n...")
  sleep(2) # Paus för dramatisk effekt
  puts Typer("\n...")
  sleep(2)
end

# Funktion för att hantera spelslut
def GameOver()
  puts Typer("\nYOU DIED")
  puts Typer("\nThe darkness closes in around you. GAME OVER")
  puts Typer("\nGAME OVER")
  
  puts Typer("\nDo you want to play again? (yes/no)")
  if Choice("yes", "no") == 1
    $choicesmade = []
    $day_counter = 1
    CNCA()
  else
    puts Typer("\nThanks for playing Cinco Noches con Alfredo!")
    exit
  end
end

# Starta spelet
CNCA()