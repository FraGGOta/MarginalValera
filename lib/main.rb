require_relative 'valera'
require_relative 'config_file'
require_relative 'game'
require_relative 'input'
require_relative 'save_file'

module MainGame
  class Main
    attr_accessor :valera, :config, :game, :description, :inpt, :messages

    def initialize
      @description = File.new('./gamedata/description.txt', 'r:UTF-8').read
      @messages =
        {
          '1' => '                                               ~ You went to work ~',
          '2' => '                                           ~ You are beholding nature ~',
          '3' => '                                       ~ You drink wine and watch series ~',
          '4' => '                                             ~ You went to the bar ~',
          '5' => '                                         ~ You drinking with marginals ~',
          '6' => '                                          ~ You singing on the subway ~',
          '7' => '                                                 ~ You to sleep ~',
          'n' => '                                                ~ New game begun ~',
          's' => '                                                  ~ Game saved ~',
          'l' => '                                                  ~ Game loaded ~',
          'nl' => '                                     ~ Game coldn\'t be loaded from this slot ~'
        }
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
        @inpt = 'nl'
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
      print "\n     .                .\n + ~ | Valera\'s stats |\n |\n"
      print_stats
    end

    def create_valera
      @config = ConfigFile.new
      @valera = Valera.new(@config.fdata['default'])
    end

    def start
      create_valera
      @inpt = 'n'
      @game = Game.new(@valera, @config.fdata)
      looop
      print_died_message if @valera.health <= 0 || @valera.mana > 100 || @valera.money.negative?
    end

    def print_message
      puts @messages[@inpt]
    end

    def print_died_message
      print_game
      puts '                                                 ~ YOU DIED ~'
    end
  end
end

main = MainGame::Main.new
main.start
