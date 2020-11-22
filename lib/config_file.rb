require 'inifile'

class ConfigFile
  def initialize
    @fdata = IniFile.load('appdata/config.ini')
  end

  def fdata
    @fdata
  end
end
