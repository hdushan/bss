require 'spec_helper'

describe BSSWizard::BSS do
  it 'responds to get_initialized_sim' do
    expect(BSSWizard::BSS.new('test').respond_to?(:get_initialized_sim)).to be true
  end

  it 'responds to environment' do
    expect(BSSWizard::BSS.new('test').respond_to?(:environment)).to be true
  end

  describe 'environment' do
    it 'returns production if matches PROD' do
      expect(BSSWizard::BSS.new('production').environment).to eq 'production'
    end

    it 'returns production if matches production' do
      expect(BSSWizard::BSS.new('production').environment).to eq 'production'
    end

    it 'returns production if matches prod' do
      expect(BSSWizard::BSS.new('production').environment).to eq 'production'
    end

    it 'returns production if matches prod anywhere in the word' do
      expect(BSSWizard::BSS.new('testproductiontest').environment).to eq 'production'
    end

    it 'returns battlefield if doesnt match prod' do
      expect(BSSWizard::BSS.new('test').environment).to eq 'battlefield'
    end
  end

  describe 'get_initialized_sim with stubbed bss' do
    let(:original_sim_number) { '9999105952506' }

    it 'returns initialized sim with same number on stubbed battlefield' do
      battlefield_yaml = { sim_reset_url: 'http://sim_reset_url/' }
      allow(YAML).to receive(:load_file).and_return(battlefield_yaml)
      stub_request(:get, "http://sim_reset_url/#{original_sim_number}")

      expect(BSSWizard::BSS.new('battlefield').get_initialized_sim(original_sim_number)).to eq original_sim_number
    end

    it 'returns different sim on stubbed production' do
      production_yaml = { tds_url: 'https://tds_url/' }
      allow(YAML).to receive(:load_file).and_return(production_yaml)
      stub_request(:get, 'https://tds_url/').to_return(body: '12345')

      expect(BSSWizard::BSS.new('production').get_initialized_sim(original_sim_number)).not_to eq original_sim_number
    end
  end
end
