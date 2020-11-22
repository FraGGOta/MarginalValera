require './lib/save_file'
require './lib/actions/valera_bar'
require './lib/actions/valera_action'

RSpec.describe SaveFile do
  describe '#SaveFile' do
    let(:config) { ConfigFile.new }
    let(:settings) { config.fdata['default'] }
    let(:valera_expected) { Valera.new(settings) }
    let(:valera) { Valera.new(settings) }
    let(:save_file) { SaveFile.new }

    it 'Save File and Load File' do
      save_file.save('1', valera_expected)
      ValeraJob.new(config.fdata['job'], valera).go_job
      valera = save_file.load('1')
      expect(valera.money).to eq valera_expected.money
    end
  end
end
