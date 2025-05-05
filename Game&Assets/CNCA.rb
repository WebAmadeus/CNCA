$choicesmade = [] 
$day_counter = 1  
$lines = File.readlines("totalscript.txt")

def CNCA()
  # Introduktion
  puts Typer("INTRODUCTION\nWelcome to Cinco Noches con Alfredo!\nChoose your character:")
  puts "*Carlos* or *Valentina* ** stars mark valid answers"
  Choice("carlos","valentina")
  
  puts Typer(Scriptcall(7, 8))  
  
  # Natt 1
  puts Typer("\nNIGHT 1 – ARRIVAL")
  puts Typer(Scriptcall(11, 14)) 
  Storysplit(1,"wait","explore",16,17,19,20)
  Scriptsplit(1, 24, 25, 29, 34)
  puts Typer(Scriptcall(37, 39)) 
  
  Storysplit(2,"leave","trust",43,44,47,48)
  Scriptsplit(2, 53, 54, 49, 50)
  
  if $choicesmade[1] == "2A"
    puts Typer(Scriptcall(55, 57))
    Storysplit(3,"leave","stay",60,61,66,67)
    Scriptsplit(3, 69, 72, 87, 89)
    
    if $choicesmade[2] == "3A"
      Storysplit(4, "away", "back",80,81,76,77)
      
      if $choicesmade[3] == "4A"
        puts Typer(Scriptcall(89, 90))
        GameOver()
        return
      end
    elsif $choicesmade[2] == "3B"
      Storysplit(5, "flee", "sleep", 78, 79, 82, 83)
      
    end
  end
  
  # Dag 2
  $day_counter = 2
  Sleep()
  
  # Natt 3
  $day_counter = 3
  Sleep()
  
  # Natt 4
  $day_counter = 4
  Sleep()
  
  # Natt 5
  $day_counter = 5
  Sleep()
  
  
  end
  
  puts Typer("\nCongratulations you survived the five nights at Alfredo.")
  puts Typer("But will alfredo really let you leave...?")
  puts Typer("\nTHE END")
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
    sleep(0.00) #justerar hastigheten på texten som skrivs ut
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