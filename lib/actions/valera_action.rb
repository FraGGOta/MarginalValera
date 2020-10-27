require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraActions
  attr_accessor :stats, :valera

  def initialize(stats, valera)
    @stats = stats
    @valera = valera
  end

  def set_health
    @valera.health += @stats['health'].nil? ? 0 : @stats['health']
  end

  def set_mana
    @valera.mana += @stats['mana'].nil? ? 0 : @stats['mana']
  end

  def set_positive
    @valera.positive += @stats['positive'].nil? ? 0 : @stats['positive']
  end

  def set_tiredness
    @valera.tiredness += @stats['tiredness'].nil? ? 0 : @stats['tiredness']
  end

  def set_money
    @valera.money += @stats['money'].nil? ? 0 : @stats['money']
  end
end
