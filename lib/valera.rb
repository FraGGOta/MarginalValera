class Valera
  attr_accessor :health
  attr_accessor :mana
  attr_accessor :positive
  attr_accessor :tiredness
  attr_accessor :money

  def initialize(health = 100, mana = 0, positive = 0, tiredness = 0, money = 0)
    @health = health
    @mana = mana
    @positive = positive
    @tiredness = tiredness
    @money = money
  end
end
