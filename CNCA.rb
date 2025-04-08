def CNCA()
  lines = File.readlines("totalscript.txt")


  puts Scriptcall(2,4)
  Choice("Carlos", "Valentina") #Tyckte det kändes kul att an kan välja karaktär och att det sedan inte gör någon skillnad:)
  puts Scriptcall(7,8)
  puts Scriptcall(11, 17)
  Choice("Wait","Explore")
end 




def Scriptcall (start_line, end_line)
lines = File.readlines("totalscript.txt")

  # jag subtraherar  1 från "star_line" för att få mer användarvänlig kod. Alltså så att index skall stämma överens med siffran i min totalscript txt
  paragraph = lines[(start_line - 1)..(end_line - 1)]
  #.join konkatinerar strängarna i paragraph
  return paragraph.join

end

def Choice(choice1,choice2)

  if gets.chomp.to_s == choice1
      
  elsif gets.chomp.to_s == choice2
      
  end
end

CNCA()