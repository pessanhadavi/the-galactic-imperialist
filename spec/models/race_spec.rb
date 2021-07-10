require 'rails_helper'

RSpec.describe Race, :type => :model do
  fixtures :races

  before(:each) do
    @race = races(:droid)
  end

  it "is valid with valid attributes" do
    expect(@race).to be_valid
  end

  it "is not valid with no kind" do
    @race.kind = nil
    expect(@race).to_not be_valid
  end
end
