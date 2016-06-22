require 'spec_helper'

describe BSS do
  it 'has a version number' do
    expect(BSS::VERSION).not_to be nil
  end

  it 'responds to get_initialized_sim' do
    expect(BSS::BSS.new.respond_to?(:get_initialized_sim)).to be true
  end

end
