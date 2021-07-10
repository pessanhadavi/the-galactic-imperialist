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
    @person.save
    expect(@person).to_not be_valid
  end

  it "is not valid without a height" do
    @person.height = nil
    @person.save
    expect(@person).to_not be_valid
  end

  it "is not valid without a weight" do
    @person.weight = nil
    @person.save
    expect(@person).to_not be_valid
  end

  it "is not valid without a dob" do
    @person.dob = nil
    @person.save
    expect(@person).to_not be_valid
  end

  it "is not valid without a hair color" do
    @person.hair = nil
    @person.save
    expect(@person).to_not be_valid
  end

  it "is not valid without a skin tone" do
    @person.skin = nil
    @person.save
    expect(@person).to_not be_valid
  end

  it "is not valid without an eye color" do
    @person.eye = nil
    @person.save
    expect(@person).to_not be_valid
  end

  it "is not valid without a gender" do
    @person.gender = nil
    @person.save
    expect(@person).to_not be_valid
  end
end
