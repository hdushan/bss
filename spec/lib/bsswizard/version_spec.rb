require 'spec_helper'

describe BSSWizard::BSS, feature: true do
  it 'has a version number' do
    expect(BSSWizard::VERSION).not_to be nil
  end
end
