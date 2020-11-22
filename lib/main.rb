require_relative 'valera'
require_relative 'config_file'
require_relative 'game'
require_relative 'input'
require_relative 'save_file'

class Main
  attr_accessor :valera, :config, :game, :description, :inpt

  def initialize
    @description = File.new('./gamedata/description.txt', 'r:UTF-8').read
  end

  def menu_new
    @valera = Valera.new(config.fdata['default'])
    @game.valera = @valera
  end

  def menu_save
    print "                                        ~ Enter the slot number to save ~ \n > "
    save_id = $stdin.gets
    SaveFile.new.save(save_id[0, save_id.length - 1], @valera)
  end

  def menu_load
    print "                                   ~ Enter the save slot number to be loaded ~ \n > "
    save_id = $stdin.gets
    valera_new = SaveFile.new.load(save_id[0, save_id.length - 1])
    if valera_new.nil?
      print "                                          ~ Valera coldn\'t be loaded ~ \n\n"
    else
      @valera = valera_new
      @game.valera = valera_new
    end
  end

  def menu_chosen
    case @inpt
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
      @inpt = Input.new.input_choice
      @game.game_loop_first(@inpt)
      @game.game_loop_second(@inpt)
      menu_chosen

      system('cls')
      system('clear')
    end
  end

  def print_stats
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

  def print_game
    puts description
    puts
    print_message
    puts
    puts '     .                .'
    puts ' + ~ | Valera\'s stats |'
    puts ' |'
    print_stats
  end

  def create_valera
    @config = ConfigFile.new
    @valera = Valera.new(@config.fdata['default'])
  end

  def start
    create_valera
    @game = Game.new(@valera, @config.fdata)
    looop
    print_died_message if @valera.health <= 0 || @valera.mana > 100 || @valera.money.negative?
  end

  def print_message
    case @inpt
    when '1'
      puts '                                               ~ You went to work ~'
    when '2'
      puts '                                           ~ You are beholding nature ~'
    when '3'
      puts '                                       ~ You drink wine and watch series ~'
    when '4'
      puts '                                             ~ You went to the bar ~'
    when '5'
      puts '                                         ~ You drinking with marginals ~'
    when '6'
      puts '                                          ~ You singing on the subway ~'
    when '7'
      puts '                                                 ~ You to sleep ~'
    end
  end

  def print_died_message
    print_game
    puts '                                                 ~ YOU DIED ~'
  end
end

main = Main.new
main.start
