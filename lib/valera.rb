class Valera
  attr_accessor :health, :mana, :positive, :tiredness, :money

  def initialize(setting)
    @health = setting['health']
    @mana = setting['mana']
    @positive = setting['positive']
    @tiredness = setting['tiredness']
    @money = setting['money']
  end
end
