require_relative 'actions/valera_job'
require_relative 'actions/valera_bar'
require_relative 'actions/valera_behold'
require_relative 'actions/valera_sing'
require_relative 'actions/valera_sleep'
require_relative 'actions/valera_drink'
require_relative 'actions/valera_series'
require_relative 'actions/valera_action'

class Game
  def initialize(valera, config)
    @valera = valera
    @config = config
  end

  def game_loop_first(choise_action)
    case choise_action
    when '1'
      ValeraJob.new(@config['job'], @valera).go_job
    when '2'
      ValeraBehold.new(@config['behold'], @valera).go_behold
    when '3'
      ValeraSeries.new(@config['series'], @valera).go_series
    when '4'
      ValeraBar.new(@config['bar'], @valera).go_bar
    end
  end

  def game_loop_second(choise_action)
    case choise_action
    when '5'
      ValeraDrink.new(@config['drink'], @valera).go_drink
    when '6'
      ValeraSing.new(@config['sing'], @valera).go_sing
    when '7'
      ValeraSleep.new(@config['sleep'], @valera).go_sleep
    end
  end
end
