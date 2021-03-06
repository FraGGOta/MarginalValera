require './lib/actions/valera_series'

RSpec.describe Actions::ValeraActions do
  describe 'Go Series' do
    let(:config) { IniFile.load('appdata/config.ini') }
    let(:settings) { config['default'] }
    let(:valera) { Valera.new(settings) }

    it 'go series' do
      ValeraSeries.new(config['series'], valera).go_series
      expect(valera.health).to eq(95)
      expect(valera.mana).to eq(30)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(10)
      expect(valera.money).to eq(-20)
    end
  end
end
