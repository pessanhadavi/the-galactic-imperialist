require 'rails_helper'

RSpec.describe Starcraft, :type => :model do
  fixtures :starcrafts

  before(:each) do
    @starcraft = starcrafts(:starcraft_22)
  end

  it "is valid with valid attributes" do
    expect(@starcraft).to be_valid
  end

  it "is not valid without a name" do
    @starcraft.name = nil
    expect(@starcraft).to_not be_valid
  end
end
