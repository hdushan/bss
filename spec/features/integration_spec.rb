require 'spec_helper'

describe BSSWizard::BSS, feature: true do

  describe "get_initialized_sim" do
  	let(:original_sim_number) {"9999105952506"}
  	it 'returns initialized sim with same number on battlefield' do
      expect(BSSWizard::BSS.new("battlefield").get_initialized_sim(original_sim_number)).to eq original_sim_number
    end

    it 'returns different sim on production' do
      expect(BSSWizard::BSS.new("production").get_initialized_sim(original_sim_number)).not_to eq original_sim_number
    end
  end
end
