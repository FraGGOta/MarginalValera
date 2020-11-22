require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraSleep < Actions::ValeraActions::Based
  def go_sleep
    @valera.health += @stats['health'] if @valera.mana < @stats['health_mana_max']
    @valera.positive += @stats['positive'] if @valera.mana > @stats['positive_mana_min']

    set_mana
    set_tiredness
    set_money
  end
end
