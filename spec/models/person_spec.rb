require 'rails_helper'

RSpec.describe Person, :type => :model do
  fixtures :planets, :races, :people

  before(:each) do
    @person = people(:michael)
  end

  it "is valid with valid attributes" do
    expect(@person).to be_valid
  end

  it "is not valid without a name" do
    @person.name = nil
    expect(@person).to_not be_valid
  end

  it "is not valid without a height" do
    @person.height = nil
    expect(@person).to_not be_valid
  end

  it "is not valid without a weight" do
    @person.weight = nil
    expect(@person).to_not be_valid
  end

  it "is not valid without a dob" do
    @person.dob = nil
    expect(@person).to_not be_valid
  end

  it "is not valid without a hair color" do
    @person.hair = nil
    expect(@person).to_not be_valid
  end

  it "is not valid without a skin tone" do
    @person.skin = nil
    expect(@person).to_not be_valid
  end

  it "is not valid without an eye color" do
    @person.eye = nil
    expect(@person).to_not be_valid
  end

  it "is not valid without a gender" do
    @person.gender = nil
    expect(@person).to_not be_valid
  end
end
