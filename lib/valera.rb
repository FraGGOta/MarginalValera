class Valera
  attr_accessor :stats

  def initialize(health = 100, mana = 0, positive = 0, tiredness = 0, money = 0)
    @stats = {
      'health' => health,
      'mana' => mana,
      'positive' => positive,
      'tiredness' => tire,
      'money' => money
    }
  end
end
