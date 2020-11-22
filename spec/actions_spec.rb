require './lib/actions/valera_job'
require './lib/actions/valera_bar'
require './lib/actions/valera_behold'
require './lib/actions/valera_sing'
require './lib/actions/valera_sleep'
require './lib/actions/valera_drink'
require './lib/actions/valera_series'
require './lib/actions/valera_action'

RSpec.describe Actions::ValeraActions do
  describe 'ValeraActions' do
    let(:config) { ConfigFile.new }
    let(:settings) { config.fdata['default'] }
    let(:valera) { Valera.new(settings) }

<<<<<<< HEAD
    it 'job' do
      ValeraJob.new(config.fdata['job'], valera).go_job
      expect(valera.health).to eq(100)
      expect(valera.mana).to eq(0)
      expect(valera.positive).to eq(-10)
      expect(valera.tiredness).to eq(70)
      expect(valera.money).to eq(100)
    end

    it 'behold' do
      ValeraBehold.new(config.fdata['behold'], valera).go_behold
      expect(valera.mana).to eq valera_expected.set_stats(100, 0, -10, 10, 0).mana
    end

    it 'series' do
      ValeraSeries.new(config.fdata['series'], valera).go_series
      expect(valera.positive).to eq valera_expected.set_stats(95, 30, -10, 10, -20).positive
    end

    context 'bar' do
      it {
        ValeraBar.new(config.fdata['bar'], valera).go_bar
        expect(valera.tiredness).to eq valera_expected.set_stats(90, 60, -10, 40, -100).tiredness
      }
    end

    context 'drink' do
      it {
        ValeraDrink.new(config.fdata['drink'], valera).go_drink
        expect(valera.money).to eq valera_expected.set_stats(20, 90, -10, 80, -150).money
      }
    end

    context 'sing' do
      it {
        ValeraSing.new(config.fdata['sing'], valera).go_sing
        expect(valera.health).to eq valera_expected.set_stats(100, 10, -10, 20, 10).health
      }
    end

    context 'sleep' do
      it {
        ValeraSleep.new(config.fdata['sleep'], valera).go_sleep
        expect(valera.mana).to eq valera_expected.set_stats(190, 0, 0, 0, 0).mana
      }
=======
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
>>>>>>> f91a473dc63993d9e46a828c1170df87b4972df3
    end
  end
end
