require 'inifile'

class ConfigFile
  attr_accessor :fdata

  def initialize
    @fdata = IniFile.load('appdata/config.ini')
  end
end
