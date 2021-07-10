require 'rails_helper'

RSpec.describe Person, :type => :model do
  planet = Planet.create name:"Anyone"
  race = Race.create kind:"Any"

  subject { described_class.create(
      name: "Anything",
      height: "175",
      weight: "77",
      dob: "Unknown",
      hair: "Black",
      skin: "Dark",
      eye: "Blue",
      gender: "Male",
      picture_url: "http:/random.url.jpg",
      planet_id: planet.id,
      race_id: race.id
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a height" do
    subject.height = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a weight" do
    subject.weight = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a dob" do
    subject.dob = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a hair color" do
    subject.hair = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a skin tone" do
    subject.skin = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an eye color" do
    subject.eye = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a gender" do
    subject.gender = nil
    expect(subject).to_not be_valid
  end
end
