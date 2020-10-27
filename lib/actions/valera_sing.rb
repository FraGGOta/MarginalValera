require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraSing < ValeraActions
  def go_sing
    set_health
    set_mana
    set_positive
    set_tiredness
    set_money

    bonus_money
  end

  def bonus_money
    first_condition = @valera.mana > @stats['money_bonus_mana_min']
    second_condition = @valera.mana < @stats['money_bonus_mana_max']
    @valera.money += @stats['money_bonus'] if first_condition && second_condition
  end
end
