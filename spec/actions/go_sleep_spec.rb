require './lib/actions/valera_sleep'

RSpec.describe Actions::ValeraActions do
  describe 'Go Sleep' do
    let(:config) { ConfigFile.new }
    let(:settings) { config.fdata['default'] }
    let(:valera) { Valera.new(settings) }

    it 'go sleep' do
      ValeraSleep.new(config.fdata['sleep'], valera).go_sleep
      expect(valera.health).to eq(190)
      expect(valera.mana).to eq(0)
      expect(valera.positive).to eq(0)
      expect(valera.tiredness).to eq(0)
      expect(valera.money).to eq(0)
    end

    it 'go sleep add condition mana < 30' do
      valera_def = Valera.new(settings)
      valera_def.set_stats(100, 20, 0, 5, 100)
      ValeraSleep.new(config.fdata['sleep'], valera_def).go_sleep
      expect(valera_def.health).to eq(190)
      expect(valera_def.mana).to eq(0)
      expect(valera_def.positive).to eq(0)
      expect(valera_def.tiredness).to eq(0)
      expect(valera_def.money).to eq(100)
    end

    it 'go sleep add condition mana > 70' do
      valera_def = Valera.new(settings)
      valera_def.set_stats(100, 80, 0, 5, 100)
      ValeraSleep.new(config.fdata['sleep'], valera_def).go_sleep
      expect(valera_def.health).to eq(100)
      expect(valera_def.mana).to eq(30)
      expect(valera_def.positive).to eq(-3)
      expect(valera_def.tiredness).to eq(0)
      expect(valera_def.money).to eq(100)
    end
  end
end
