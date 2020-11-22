require 'inifile'

class ConfigFile
  attr_reader :fdata

  def initialize
    @fdata = IniFile.load('appdata/config.ini')
  end
end
