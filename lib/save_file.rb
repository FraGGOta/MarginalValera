require 'inifile'
load 'lib/valera.rb'

class SaveFile
  attr_accessor :ini

  def initialize
    @ini = IniFile.load('appdata/save.ini')
  end

  def load
    Valera.new(@ini['default']) if !@ini.nil? && !@ini['default'].nil?
  end

  def save(valera)
    create_file if @ini.nil?
    update_ini(valera)
    write
  end

  private

  def create_file
    f = File.open('appdata/save.ini', 'w')
    f.close
    @ini = IniFile.load('appdata/save.ini')
  end

  def update_ini(valera)
    @ini['default']['health'] = valera.health
    @ini['default']['mana'] = valera.mana
    @ini['default']['positive'] = valera.positive
    @ini['default']['tiredness'] = valera.tiredness
    @ini['default']['money'] = valera.money
  end

  def write
    ini.write
  end
end
