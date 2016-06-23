require 'spec_helper'

describe BSSWizard::BSS do
  it 'has a version number' do
    expect(BSSWizard::VERSION).not_to be nil
  end

  it 'responds to get_initialized_sim' do
    expect(BSSWizard::BSS.new("test").respond_to?(:get_initialized_sim)).to be true
  end

end
