$choicesmade = [] #global variabel för att hålla koll på val som gjorts i spelet
def CNCA()

   "NIGHT 1"
  puts Typer(Scriptcall(2,4))
  Choice("carlos","valentina")#Tyckte det kändes kul att an kan välja karaktär och att det sedan inte gör någon skillnad:)
  puts Typer(Scriptcall(7,8))
  puts Typer(Scriptcall(11, 13))
  Storysplit(1,"wait","explore",14,15,16,17)
  Scriptsplit(1, 20, 21, 25, 29)
  puts Typer(Scriptcall(33, 35))
  Storysplit(2,"leave","trust", 39,40,43,44)
  Scriptsplit(2, 49, 50, 45, 46)
  if $choicesmade[1] == "2A" #denna bit händer bara om man valt att lämna i val 2
    puts Typer(Scriptcall(51, 52))
    Storysplit(3,"leave","stay", 56,57,61,62)
    Scriptsplit(3, 64, 65, 82, 83)
  end

  
  
end 




def Scriptcall (start_line, end_line)
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
    puts "Invalid choice. Please try again."
    return Choice(choice1, choice2) #ber dem att svara på frågan igen
  end
  return chosen
end

def Typer (text)
  i = 0
  while i < text.length
   print text[i]
   sleep(0.01) #justerar hastigheten på texten som skrivs ut
   $stdout.flush #jag frågade chatgpt om hur man kan få textan att se ut att bli skriven i terminalen och den sa att denna skulle vara med för att den skulle komma en bokstav i taget, annars kan det klumpas ihop av ruby för effektivitet
    i += 1
  end
  
end

def Storysplit (splitpoint, choice1, choice2, start_line1, end_line1, start_line2, end_line2)
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
 
CNCA()