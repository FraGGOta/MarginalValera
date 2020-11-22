require './lib/actions/valera_job'
require './lib/actions/valera_bar'
require './lib/actions/valera_behold'
require './lib/actions/valera_sing'
require './lib/actions/valera_sleep'
require './lib/actions/valera_drink'
require './lib/actions/valera_series'
require './lib/actions/valera_action'
require './lib/actions/valera_action'
require './lib/actions/valera_action'

RSpec.describe Actions::ValeraActions do
  describe 'ValeraActions' do
	let(:config) {ConfigFile.new}
	let(:settings) {config.fdata['default']}
	let(:valera) {Valera.new(settings)}
		 
    it 'job' do
		ValeraJob.new(config.fdata['job'], valera).go_job
        expect(valera.health).to eq (100)
		expect(valera.mana).to eq (0)
		expect(valera.positive).to eq (-10)
		expect(valera.tiredness).to eq (70)
		expect(valera.money).to eq (100)
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
        expect(valera.tiredness).to eq  valera_expected.set_stats(90, 60, -10, 40, -100).tiredness
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
    end
  end
end
