require './lib/actions/valera_sing'

RSpec.describe Actions::ValeraActions do
  describe 'Go Sing' do
    let(:config) { IniFile.load('appdata/config.ini') }
    let(:settings) { config['default'] }
    let(:valera) { Valera.new(settings) }

    it 'go sing' do
      ValeraSing.new(config['sing'], valera).go_sing
      expect(valera.health).to eq(100)
      expect(valera.mana).to eq(10)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(20)
      expect(valera.money).to eq(10)
    end
  end
end
