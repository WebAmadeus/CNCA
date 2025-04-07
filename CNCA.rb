def CNCA()
  lines = File.readlines("totalscript.txt")

  start_line = 2
  end_line = 4

  # jag subtraherar  1 från "star_line" för att få mer användarvänlig kod. Alltså så att index skall stämma överens med siffran i min totalscript txt
  paragraph = lines[(start_line - 1)..(end_line - 1)]
  #.join konkatinerar strängarna i paragraph
  puts paragraph.join

  if gets.chomp == "Carlos"
  elsif gets.chomp == "Valentina"
  end #Tyckte det kändes kul att an kan välja karaktär och att det sedan inte gör någon skillnad:)
  
  line_number = 7  #läser upp rad 7 i totalscript.txt
  puts lines[line_number - 1]
  
  start_line = 11
  end_line = 17

  paragraph = lines[(start_line - 1)..(end_line - 1)]
  puts paragraph.join

  if gets.chomp == wait
    mamma mia
end 

CNCA()