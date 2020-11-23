require './lib/valera'

RSpec.describe Actions::ValeraActions do
  describe 'Valera Default' do
    let(:config) { ConfigFile.new }
    let(:settings) { config.fdata['default'] }
    let(:valera) { Valera.new(settings) }

    it 'start config' do
      expect(valera.health).to eq(100)
      expect(valera.mana).to eq(0)
      expect(valera.positive).to eq(0)
      expect(valera.tiredness).to eq(0)
      expect(valera.money).to eq(0)
    end
  end
end
