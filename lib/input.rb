class Input
  def input_choice
    loop do
      print ' > '
      inpt = gets.chomp.downcase
      return inpt if (inpt.to_i >= 1 && inpt.to_i <= 7) || inpt == 'n' || inpt == 's' || inpt == 'l' || inpt == 'q'

      puts '                                          ~ Invalid input. Try again! ~'
    end
  end
end
