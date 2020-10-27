require_relative 'valera_action'
load 'lib/valera.rb'
load 'lib/config_file.rb'

class ValeraJob < ValeraActions
  def go_job
    if (@valera.mana >= 50) && (@valera.tiredness >= 10)
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
