$choicesmade = [] 
$day_counter = 1  
$lines = File.readlines("totalscript.txt")

def CNCA()
  # Introduktion
  puts Typer("INTRODUCTION\nWelcome to Cinco Noches con Alfredo!\nChoose your character:")
  puts "*Carlos* or *Valentina* ** stars mark valid answers"
  Choice("carlos","valentina")
  
  puts Typer(Scriptcall(5, 6))  
  
  # Natt 1
  puts Typer("\nNIGHT 1 – ARRIVAL")
  puts Typer(Scriptcall(8, 11)) 
  Storysplit(1,"wait","explore",15,16,20,21)
  Scriptsplit(1, 17, 18, 22, 24)
  puts Typer(Scriptcall(28, 31)) 
  
  Storysplit(2,"leave","trust",39,40,34,35)
  Scriptsplit(2, 41,42,36,37)
  
  if $choicesmade[1] == "2A"
    puts Typer(Scriptcall(43, 46))
    Storysplit(3,"leave","hotel",48,49,54,55)
    Scriptsplit(3, 50, 52, 56, 57)
    if $choicesmade[2] == "3A"
      GameOver()
    end
  end
  # Natt 2
  $day_counter = 2
  Sleep()

  puts Typer("\nNIGHT 2 – Breakfast")
  puts Typer(Scriptcall(60, 62))
  puts Typer(Scriptcall(65, 66))
  Storysplit(4,"ask","explore",67,68,72,73)
  Scriptsplit(4, 69, 71, 74, 76)
  puts Typer(Scriptcall(77, 78))
  # Natt 3
  $day_counter = 3
  Sleep()
  puts Typer("\nNIGHT 3 – Dinner ")
  puts Typer(Scriptcall(82, 84))
  puts Typer(Scriptcall(87, 88))
  Storysplit(5,"accept","refuse",90,91,95,96)
  if $choicesmade[4] == "5B"
    puts Typer(Scriptcall(97,103))
    GameOver()
  end
  puts Typer(Scriptcall(104, 105))

  # Natt 4
  $day_counter = 4
  Sleep()
  puts Typer("\nNIGHT 4 – Heist")
  puts Typer(Scriptcall(108, 109))
  puts Typer(Scriptcall(112, 113))
  Storysplit(6,"Steal","Sleep",115,116,127,128)
  if $choicesmade[0] == "1B"
    puts Typer(Scriptcall(130, 131))
  else
    puts Typer(Scriptcall(121, 125))
    GameOver()
  end
  puts Typer(Scriptcall(140, 143))
  Storysplit(7, "now", "tomorrow", 145, 147, 160, 161)
  if $choicesmade[6] == "7A"
    Storysplit(8,"looking","waiting",152,154,156,157)
  end
  puts Typer(Scriptcall(162, 163))
  # Natt 5
  $day_counter = 5
  Sleep()
  puts Typer("\nNIGHT 5")
  puts Typer(Scriptcall(167, 168))
  if $choicesmade[6] == "7A"
    if $choicesmade[7] == "8B"
      puts Typer(Scriptcall(173, 174))
      Storysplit(9,"run","wait",179,182,186,187)
      if $choicesmade[8] == "9B"
        GameOver()
      end
      puts Typer("\nCongratulations you survived the five nights at Alfredo.")
     puts Typer("But will alfredo really let you leave...?")
      puts Typer("\nTHE END")
    end
 else
    puts Typer(Scriptcall(193,195))
    puts Typer(Scriptcall(197,199))
    Storysplit(10,"explore","turn",201,208,210,211)
    GameOver
  
  end 
end

def Scriptcall(start_line, end_line)
 # jag subtraherar 1 från "start_line" för att få mer användarvänlig kod. Alltså så att index skall stämma överens med siffran i min totalscript txt
  paragraph = $lines[(start_line - 1)..(end_line - 1)]
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
    sleep(0.01) #justerar hastigheten på texten som skrivs ut
    $stdout.flush #jag frågade chatgpt om hur man kan få textan att se ut att bli skriven i terminalen och den sa att denna skulle vara med för att den skulle komma en bokstav i taget, annars kan det klumpas ihop av ruby för effektivitet
    i += 1
  end
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
  puts Typer("\nThe darkness closes in around you.")
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