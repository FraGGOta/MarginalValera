require './lib/actions/valera_job'
require './lib/actions/valera_bar'
require './lib/actions/valera_behold'
require './lib/actions/valera_sing'
require './lib/actions/valera_sleep'
require './lib/actions/valera_drink'
require './lib/actions/valera_series'
require './lib/actions/valera_action'

RSpec.describe ValeraActions do
  describe 'ValeraActions' do
    context 'job' do
      config = ConfigFile.new
      settings = config.fdata['default']
      valera = Valera.new(settings)
      valera_expected = Valera.new(settings)
      valera_expected.set_stats(100, 0, -10, 70, 100)
      ValeraJob.new(config.fdata['job'], valera).go_job
      it {
        expect(valera.health).to eq valera_expected.health
      }
    end

    context 'behold' do
      config = ConfigFile.new
      settings = config.fdata['default']
      valera = Valera.new(settings)
      valera_expected = Valera.new(settings)
      valera_expected.set_stats(100, 0, -10, 10, 0)
      ValeraBehold.new(config.fdata['behold'], valera).go_behold
      it {
        expect(valera.mana).to eq valera_expected.mana
      }
    end

    context 'series' do
      config = ConfigFile.new
      settings = config.fdata['default']
      valera = Valera.new(settings)
      valera_expected = Valera.new(settings)
      valera_expected.set_stats(95, 30, -10, 10, -20)
      ValeraSeries.new(config.fdata['series'], valera).go_series
      it {
        expect(valera.positive).to eq valera_expected.positive
      }
    end

    context 'bar' do
      config = ConfigFile.new
      settings = config.fdata['default']
      valera = Valera.new(settings)
      valera_expected = Valera.new(settings)
      valera_expected.set_stats(90, 60, -10, 40, -100)
      ValeraBar.new(config.fdata['bar'], valera).go_bar
      it {
        expect(valera.tiredness).to eq valera_expected.tiredness
      }
    end

    context 'drink' do
      config = ConfigFile.new
      settings = config.fdata['default']
      valera = Valera.new(settings)
      valera_expected = Valera.new(settings)
      valera_expected.set_stats(20, 90, -10, 80, -150)
      ValeraDrink.new(config.fdata['drink'], valera).go_drink
      it {
        expect(valera.money).to eq valera_expected.money
      }
    end

    context 'sing' do
      config = ConfigFile.new
      settings = config.fdata['default']
      valera = Valera.new(settings)
      valera_expected = Valera.new(settings)
      valera_expected.set_stats(100, 10, -10, 20, 10)
      ValeraSing.new(config.fdata['sing'], valera).go_sing
      it {
        expect(valera.health).to eq valera_expected.health
      }
    end

    context 'sleep' do
      config = ConfigFile.new
      settings = config.fdata['default']
      valera = Valera.new(settings)
      valera_expected = Valera.new(settings)
      valera_expected.set_stats(190, 0, 0, 0, 0)
      ValeraSleep.new(config.fdata['sleep'], valera).go_sleep
      it {
        expect(valera.mana).to eq valera_expected.mana
      }
    end
  end
end
