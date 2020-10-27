require_relative 'valera'
require_relative 'config_file'
require_relative 'game'

class Main
  def start
    config = ConfigFile.new
    settings = config.fdata['default']
    valera = Valera.new(settings)
    game = Game.new(valera, config.fdata)
    choice_action = gets.chomp
    game.game_loop_first(choice_action)
    game.game_loop_second(choice_action)
  end
end

main = Main.new
main.start
