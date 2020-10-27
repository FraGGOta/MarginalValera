require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraJob < ValeraActions
  def go_job
    return if (@valera.mana >= 50) && mana(@valera.tiredness >= 10)

    set_health
    set_mana
    set_positive
    set_tiredness
    set_money
  end
end
