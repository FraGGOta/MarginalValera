require 'inifile'
load 'lib/valera.rb'

class SaveFile
  attr_accessor :ini

  def load
    @ini = IniFile.load('appdata/save.ini')
    make_valera if !@ini.nil? && !@ini['default'].nil?
  end

  def save(valera)
    @ini['default']['health'] = valera.health
    @ini['default']['mana'] = valera.mana
    @ini['default']['positive'] = valera.positive
    @ini['default']['tiredness'] = valera.tiredness
    @ini['default']['money'] = valera.money
    write
  end

  private

  def make_valera
    health = @ini['default']['health']
    mana = @ini['default']['mana']
    positive = @ini['default']['positive']
    tiredness = @ini['default']['tiredness']
    money = @ini['default']['money']
    Valera.new(health, mana, positive, tiredness, money)
  end

  def write
    ini.write
  end
end
