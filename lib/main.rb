require_relative 'valera'
require_relative 'config_file'
require_relative 'game'
require_relative 'input'
require_relative 'read'

class Main
  attr_accessor :valera, :config, :settings

  def print_stats
    puts 'Valera\'s parameters:'
    puts "health = #{@valera.health}"
    puts "mana = #{@valera.mana}"
    puts "positive = #{@valera.positive}"
    puts "tiredness = #{@valera.tiredness}"
    puts "money = #{@valera.money}"
  end

  def console
    @config = ConfigFile.new
    @settings = @config.fdata['default']
    @valera = Valera.new(@settings)
  end

  def start
    MyFile.new.read_file

    console
    print_stats
    game = Game.new(@valera, @config.fdata)

    inpt = Input.new.input_choice

    game.game_loop_first(inpt)
    game.game_loop_second(inpt)

    exit if inpt == 9
  end
end

main = Main.new
main.start
