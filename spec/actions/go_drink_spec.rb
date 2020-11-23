require './lib/actions/valera_drink'

RSpec.describe Actions::ValeraActions do
  describe 'Go Drink' do
    let(:config) { ConfigFile.new }
    let(:settings) { config.fdata['default'] }
    let(:valera) { Valera.new(settings) }

    it 'go drink' do
      ValeraDrink.new(config.fdata['drink'], valera).go_drink
      expect(valera.health).to eq(20)
      expect(valera.mana).to eq(90)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(80)
      expect(valera.money).to eq(-150)
    end
  end
end
