class ValeraActions
  def valera_actions(name_action, valera)
	if action_condition(name_action, valera)
		get_reult_action(config, name_action)
  end
  
  def action_condition(name_action, valera)
	case name_action
		when 'job'
		
	
  end
  
  def get_add_stats(config, nameAction)
	config[nameAction]
  end
end