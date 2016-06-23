require 'spec_helper'

describe BSSWizard::BSS do
  it 'has a version number' do
    expect(BSSWizard::VERSION).not_to be nil
  end

  it 'responds to get_initialized_sim' do
    expect(BSSWizard::BSS.new("test").respond_to?(:get_initialized_sim)).to be true
  end

  it 'responds to environment' do
    expect(BSSWizard::BSS.new("test").respond_to?(:environment)).to be true
  end

  describe "environment" do
  	it 'returns production if matches PROD' do
      expect(BSSWizard::BSS.new("production").environment).to eq "production"
    end

    it 'returns production if matches production' do
      expect(BSSWizard::BSS.new("production").environment).to eq "production"
    end

    it 'returns production if matches prod' do
      expect(BSSWizard::BSS.new("production").environment).to eq "production"
    end

    it 'returns production if matches prod anywhere in the word' do
      expect(BSSWizard::BSS.new("testproductiontest").environment).to eq "production"
    end

    it 'returns battlefield if doesnt match prod' do
      expect(BSSWizard::BSS.new("test").environment).to eq "battlefield"
    end
  end

end
