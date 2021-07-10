require 'rails_helper'
require_relative '../../db/seeds/aux_methods/people_and_pilots.rb'

describe "Seeds/aux_methods: people_and_pilots" do
  fixtures :planets, :races, :starcrafts, :people
  
  binding.pry
  
  describe "#find_planet" do

    it "returns the right planet instance" do
      tatooine = planets(:tatooine)
      planet_found = find_planet("https://swapi.dev/api/planets/1")
      expect(planet_found.name).to eq(tatooine.name)
    end
  end

  describe "#find_race" do

    it "returns the right race instances" do
      human = races(:human)
      droid = races(:droid)
      droid_wookie = races(:droid_wookie)
      human_found = find_race([])
      droid_found = find_race(["https://swapi.dev/api/species/2/"])
      droid_w_found = find_race(["https://swapi.dev/api/species/2/", "https://swapi.dev/api/species/3/"])

      expect(human_found.kind).to eq(human.kind)
      expect(droid_found.kind).to eq(droid.kind)
      expect(droid_w_found.kind).to eq(droid_wookie.kind)
    end
  end

  describe "#is_pilot?" do
    it "returns true if the person pilots any starship and false if they don't" do
      starships = is_pilot?([])
      starships_1 = is_pilot?(["https://swapi.dev/api/starships/12/", "https://swapi.dev/api/starships/22/"])

      expect(starships).to eq(false)
      expect(starships_1).to eq(true)
    end
  end

  describe "#pilot_license_registration" do
    it "creates pilot instances" do
      starships_api = ["https://swapi.dev/api/starships/12/", "https://swapi.dev/api/starships/22/"]
      person = people(:michael)

      pilot_license_registration(starships_api, person)
      expect(person.starcrafts.length > 0).to eq(true)
    end
  end
end
