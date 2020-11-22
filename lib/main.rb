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

  def menu_new
    @valera = Valera.new(config.fdata['default'])
    @game.valera = @valera
  end

  def menu_save
    puts '                                        ~ Enter the slot number to save ~'
    print ' > '
    save_id = $stdin.gets
    SaveFile.new.save(save_id[0, save_id.length - 1], @valera)
  end

  def menu_load
    puts '                                   ~ Enter the save slot number to be loaded ~'
    print ' > '
    save_id = $stdin.gets
    valera_new = SaveFile.new.load(save_id[0, save_id.length - 1])
    if !valera_new.nil?
      @valera = valera_new
      @game.valera = valera_new
    else
      puts '                                          ~ Valera coldn\'t be loaded ~'
      gets
    end
  end

  def menu_chosen(choise_action)
    case choise_action
    when 'n'
      menu_new
    when 's'
      menu_save
    when 'l'
      menu_load
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
