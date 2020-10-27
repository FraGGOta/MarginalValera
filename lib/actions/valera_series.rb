require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraSeries < ValeraActions
  def go_series
    set_health
    set_mana
    set_positive
    set_tiredness
    set_money
  end
end
