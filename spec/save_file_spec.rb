require './lib/save_file'

RSpec.describe SaveFile do
  describe 'Save and load file' do
    let(:config) { IniFile.load('appdata/config.ini') }
    let(:settings) { config['default'] }
    let(:valera_expected) { Valera.new(settings) }
    let(:valera) { Valera.new(settings) }
    let(:save_file) { SaveFile.new }

    it 'Save and load file' do
      save_file.save('1', valera_expected)
      valera = save_file.load('1')
      expect(valera.money).to eq valera_expected.money
      expect(valera.health).to eq valera_expected.health
    end

    it 'Load not created file' do
      valera = save_file.load('2')
      expect(valera).to eq nil
    end

    it 'Get saves list' do
      saves_list = save_file.saves_list_get
      expect(saves_list.length).to eq 1
      expect(saves_list[0]).to eq '1'
    end
  end
end
