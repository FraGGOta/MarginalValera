class Game
  attr_accessor :valera
  attr_accessor :config

  def initialize(valera, config)
	@valera = valera
	@config = config
  end
  
  def game_loop(name_action)
	valera_actions = ValeraActions.new
	result_action = valera_actions(name_action, valera)
	
	valera.health += result_action['health']
	valera.mana += result_action['mana']
	valera.positive += result_action['positive']
	valera.tiredness += result_action['tiredness']
	valera.money += result_action['money']
  end
end