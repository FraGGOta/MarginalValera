require_relative 'valera'
require_relative 'config_file'
require_relative 'game'
require_relative 'input'
require_relative 'save_file'

class Main
  attr_accessor :valera, :config, :settings, :game, :description

  def initialize
    @description = File.new('./gamedata/description.txt', 'r:UTF-8').read
  end

  def menu_chosen(choise_action)
    case choise_action
    when 'n'
      @valera = Valera.new(config.fdata['default'])
      @game.valera = @valera
    when 's'
      SaveFile.new.save(@valera)
    when 'l'
      valera_new = SaveFile.new.load
      if !valera_new.nil?
        @valera = valera_new
        @game.valera = valera_new
      else
        puts '                                          ~ Valera coldn\'t be loaded ~'
        gets
      end
    when 'q'
      exit
    end
  end

  def looop
    while @valera.health.positive? && @valera.mana <= 100 && @valera.money >= 0
      system('cls')
      system('clear')

      print_game

      inpt = Input.new.input_choice

      @game.game_loop_first(inpt)
      @game.game_loop_second(inpt)
      menu_chosen(inpt)

      system('cls')
      system('clear')
    end
  end

  def print_game_header
    puts description
    puts
    puts '     .                .'
    puts ' + ~ | Valera\'s stats |'
    puts ' |'
  end

  def print_game
    print_game_header
    puts " + ~ [HP]           #{@valera.health}"
    puts ' |'
    puts " + ~ [MANA]         #{@valera.mana}"
    puts ' |'
    puts " + ~ [POSITIVE]     #{@valera.positive}"
    puts ' |'
    puts " + ~ [TIREDNESS]    #{@valera.tiredness}"
    puts ' |'
    puts " + ~ [MONEY]        #{@valera.money}"
    puts
  end

  def console
    @config = ConfigFile.new
    @settings = @config.fdata['default']
    @valera = Valera.new(@settings)
  end

  def start
    console
    @game = Game.new(@valera, @config.fdata)
    looop

    print_died_message if @valera.health <= 0 || @valera.mana > 100 || @valera.money.negative?
  end

  def print_died_message
    print_game
    puts '                                                 ~ YOU DIED ~'
  end
end

main = Main.new
main.start
