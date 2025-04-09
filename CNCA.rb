$choicesmade = [] #global variabel för att hålla koll på val som gjorts i spelet
def CNCA()
  lines = File.readlines("totalscript.txt")

   "NIGHT 1"
  puts Typer(Scriptcall(2,4))
  Choice("carlos", "valentina")#Tyckte det kändes kul att an kan välja karaktär och att det sedan inte gör någon skillnad:)
  puts Typer(Scriptcall(7,8))
  puts Typer(Scriptcall(11, 13))
  Storysplit(1,"wait","explore",14,15,16,17)
  Scriptsplit(1, 20, 21, 34, 38)
  puts Typer(Scriptcall(42, 43))
  puts Typer(Scriptcall(44, 45))
  Storysplit(2,"try to leave", "trust alfredo", 39,40,43,44)
  
  
end 




def Scriptcall (start_line, end_line)
  lines = File.readlines("totalscript.txt")

    # jag subtraherar 1 från "start_line" för att få mer användarvänlig kod. Alltså så att index skall stämma överens med siffran i min totalscript txt
   paragraph = lines[(start_line - 1)..(end_line - 1)]
   #.join konkatinerar strängarna i paragraph
    return paragraph.join

end

def Choice(choice1,choice2)
  print "> "
  if gets.chomp.to_s.downcase == choice1.downcase
      chosen = 1
  else
     chosen = 0
  end
return chosen
end

def Typer (text)
  i = 0
  while i < text.length
   print text[i]
   sleep(0.023)
   $stdout.flush #jag frågade chatgpt om hur man kan få textan att se ut att bli skriven i terminalen och den sa att denna skulle vara med för att den skulle komma en bokstav i taget, annars kan det klumpas ihop av ruby för effektivitet
    i += 1
  end
  
end

def Storysplit (splitpoint, choice1,choice2,start_line1, end_line1, start_line2, end_line2 )
  if Choice(choice1,choice2) == 1
     puts Typer(Scriptcall(start_line1,end_line1))
     $choicesmade << "A"
  else
     puts Typer(Scriptcall(start_line2,end_line2))
     $choicesmade << "B"
  end
  return
end

def Scriptsplit(splitpoint, start_line1, end_line1, start_line2, end_line2)
 
  if $choicesmade[splitpoint - 1] == "A"
    puts Typer(Scriptcall(start_line1, end_line1))
  elsif $choicesmade[splitpoint - 1] == "B"
    puts Typer(Scriptcall(start_line2, end_line2))
  end
end

CNCA()