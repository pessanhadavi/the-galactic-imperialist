require 'rails_helper'

RSpec.describe Planet, :type => :model do
  fixtures :planets

  before(:each) do
    @planet = planets(:terra)
  end

  it "is valid with valid attributes" do
    expect(@planet).to be_valid
  end

  it "is not valid with no name" do
    @planet.name = nil
    expect(@planet).to_not be_valid
  end
end