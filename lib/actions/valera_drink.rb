require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraDrink < Actions::ValeraActions::Based
  def go_drink
    set_health
    set_mana
    set_positive
    set_tiredness
    set_money
  end
end
