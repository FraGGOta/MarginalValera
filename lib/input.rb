class Input
  def input_choice
    loop do
      inpt = gets.chomp
      return inpt if inpt.to_i >= 1 || inpt.to_i <= 10

      puts 'Error!'
    end
  end
end
