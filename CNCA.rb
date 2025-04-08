def CNCA()
  lines = File.readlines("totalscript.txt")

   "NIGHT 1"
  puts Typer(Scriptcall(2,4))
  Choice("carlos", "valentina")#Tyckte det kändes kul att an kan välja karaktär och att det sedan inte gör någon skillnad:)
  puts Typer(Scriptcall(7,8))
  puts Typer(Scriptcall(11, 13))
  Storysplit("wait","explore",14,15,16,17)
  
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
  if gets.chomp.to_s == choice1.downcase
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
   sleep(0.03)
   $stdout.flush #jag frågade chatgpt om hur man kan få textan att se ut att bli skriven i terminalen och den sa att denna skulle vara med för att den skulle komma en bokstav i taget, annars kan det klumpas ihop av ruby för effektivitet
    i += 1
  end

end

def Storysplit (choice1,choice2,start_line1, end_line1, start_line2, end_line2 )
  if Choice(choice1,choice2) == 1
    puts Typer(Scriptcall(start_line1,end_line1))
  else
    puts Typer(Scriptcall(start_line2,end_line2))
  end
end

CNCA()