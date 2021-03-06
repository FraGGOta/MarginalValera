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

  def valera_set(valera_new)
    @valera = valera_new
  end

  @choose = {

    '1' => ->(conf, val) { ValeraJob.new(conf['job'], val).go_job },
    '2' => ->(conf, val) { ValeraBehold.new(conf['behold'], val).go_behold },
    '3' => ->(conf, val) { ValeraSeries.new(conf['series'], val).go_series },
    '4' => ->(conf, val) { ValeraBar.new(conf['bar'], val).go_bar },
    '5' => ->(conf, val) { ValeraDrink.new(conf['drink'], val).go_drink },
    '6' => ->(conf, val) { ValeraSing.new(conf['sing'], val).go_sing },
    '7' => ->(conf, val) { ValeraSleep.new(conf['sleep'], val).go_sleep }
  }

  class << self
    attr_reader :choose
  end

  def game_loop(choice_action)
    zxc = Game.choose[choice_action]
    zxc&.call(@config, @valera)
  end
end
