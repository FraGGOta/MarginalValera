class Valera
  attr_accessor :stats

  def initialize(health = 100, mana = 0, fun = 0, money = 0, tire = 0)
    @stats = {
      'health' => health,
      'mana' => mana,
      'fun' => fun,
      'tire' => tire,
      'money' => money
    }
  end
end