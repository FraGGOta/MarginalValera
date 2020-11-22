require './lib/actions/valera_job'
require './lib/actions/valera_bar'
require './lib/actions/valera_behold'
require './lib/actions/valera_sing'
require './lib/actions/valera_sleep'
require './lib/actions/valera_drink'
require './lib/actions/valera_series'
require './lib/actions/valera_action'
require './lib/valera'

RSpec.describe Actions::ValeraActions do
  describe 'ValeraActions' do
    let(:config) { ConfigFile.new }
    let(:settings) { config.fdata['default'] }
    let(:valera) { Valera.new(settings) }

    it 'start' do
      expect(valera.health).to eq(100)
      expect(valera.mana).to eq(0)
      expect(valera.positive).to eq(0)
      expect(valera.tiredness).to eq(0)
      expect(valera.money).to eq(0)
    end

    it 'go_job' do
      ValeraJob.new(config.fdata['job'], valera).go_job
      expect(valera.health).to eq(100)
      expect(valera.mana).to eq(0)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(70)
      expect(valera.money).to eq(100)
    end

    it 'go_behold' do
      ValeraBehold.new(config.fdata['behold'], valera).go_behold
      expect(valera.health).to eq(100)
      expect(valera.mana).to eq(0)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(10)
      expect(valera.money).to eq(0)
    end

    it 'go_series' do
      ValeraSeries.new(config.fdata['series'], valera).go_series
      expect(valera.health).to eq(95)
      expect(valera.mana).to eq(30)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(10)
      expect(valera.money).to eq(-20)
    end

    it 'go_bar' do
      ValeraBar.new(config.fdata['bar'], valera).go_bar
      expect(valera.health).to eq(90)
      expect(valera.mana).to eq(60)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(40)
      expect(valera.money).to eq(-100)
    end

    it 'go_drink' do
      ValeraDrink.new(config.fdata['drink'], valera).go_drink
      expect(valera.health).to eq(20)
      expect(valera.mana).to eq(90)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(80)
      expect(valera.money).to eq(-150)
    end

    it 'go_sing' do
      ValeraSing.new(config.fdata['sing'], valera).go_sing
      expect(valera.health).to eq(100)
      expect(valera.mana).to eq(10)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(20)
      expect(valera.money).to eq(10)
    end

    it 'go_sleep' do
      ValeraSleep.new(config.fdata['sleep'], valera).go_sleep
      expect(valera.health).to eq(190)
      expect(valera.mana).to eq(0)
      expect(valera.positive).to eq(0)
      expect(valera.tiredness).to eq(0)
      expect(valera.money).to eq(0)
    end

    it 'valera set data' do
      valera_ss = Valera.new(settings)
      valera_ss.set_stats(100, 0, 0, 0, 0)
      expect(valera_ss.health).to eq(100)
    end

    it 'go job' do
      valera_def = Valera.new(settings)
      valera_def.set_stats(100, 40, 0, 5, 100)
      ValeraJob.new(config.fdata['job'], valera_def).go_job
      expect(valera_def.health).to eq(100)
      expect(valera_def.mana).to eq(10)
      expect(valera_def.positive).to eq(-10)
      expect(valera_def.tiredness).to eq(75)
      expect(valera_def.money).to eq(200)
    end

    it 'not go job' do
      valera_def = Valera.new(settings)
      valera_def.set_stats(100, 50, 0, 20, 100)
      ValeraJob.new(config.fdata['job'], valera_def).go_job
      expect(valera_def.health).to eq(100)
      expect(valera_def.mana).to eq(50)
      expect(valera_def.positive).to eq(0)
      expect(valera_def.tiredness).to eq(20)
      expect(valera_def.money).to eq(100)
    end
  end
end
