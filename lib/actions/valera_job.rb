require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraJob < Actions::ValeraActions::Based
  def go_job
    if (@valera.mana >= @stats['req_mana_max']) && (@valera.tiredness >= @stats['req_tiredness_max'])
      puts 'Action is impossible. You are too drunk!'
      gets.chomp
      return
    end

    set_health
    set_mana
    set_positive
    set_tiredness
    set_money
  end
end
