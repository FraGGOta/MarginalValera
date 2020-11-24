require 'inifile'
require_relative 'valera'
require_relative 'game'
require_relative 'input'
require_relative 'save_file'

class MarginalValera
  def initialize
    @description = File.new('./gamedata/description.txt', 'r:UTF-8').read
    @messages = IniFile.load('gamedata/ingame_messages.ini')['default']
    @config = IniFile.load('appdata/config.ini')
    @valera = Valera.new(@config['default'])
    @inpt = 'n'
    @game = Game.new(@valera, @config)
  end

  def menu_new
    @valera = Valera.new(@config['default'])
    @game.valera_set(@valera)
  end

  def menu_save
    sv = SaveFile.new
    print "                                        ~ Enter the slot number to save ~ \n > "
    save_id = $stdin.gets
    sv.save(save_id[0, save_id.length - 1], @valera)
  end

  def menu_load
    sv = SaveFile.new
    print "                                   ~ Enter the save slot number to be loaded ~ \n > "
    save_id = $stdin.gets
    valera_new = sv.load(save_id[0, save_id.length - 1])
    if valera_new.nil?
      @inpt = 'nl'
    else
      @valera = valera_new
      @game.valera_set(valera_new)
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

  def main_game_loop
    while @valera.health.positive? && @valera.mana <= 100 && @valera.money >= 0
      print_game
      @inpt = Input.new.input_choice
      @game.game_loop_first(@inpt)
      @game.game_loop_second(@inpt)
      menu_chosen
    end
  end

  def print_game
    system('cls')
    system('clear')
    puts @description
    puts @messages[@inpt]
    puts "\n     .                .\n + ~ | Valera\'s stats |\n"
    puts " |\n + ~ [HP]           #{@valera.health}\n"
    puts " |\n + ~ [MANA]         #{@valera.mana}\n"
    puts " |\n + ~ [POSITIVE]     #{@valera.positive}\n"
    puts " |\n + ~ [TIREDNESS]    #{@valera.tiredness}\n"
    puts " |\n + ~ [MONEY]        #{@valera.money}\n\n"
  end

  def start
    main_game_loop
    if @valera.health <= 0
      @inpt = 'dh'
    elsif @valera.mana > 100
      @inpt = 'da'
    elsif @valera.money.negative?
      @inpt = 'dm'
    end
    print_game
  end
end
