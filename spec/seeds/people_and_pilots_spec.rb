require 'rails_helper'
require_relative '../../db/seeds/aux_methods/people_and_pilots.rb'

describe "Seeds/aux_methods: people_and_pilots" do
  describe "#find_planet" do
    planet = Planet.create name: "Tatooine"

    it "returns the right planet instance" do
      planet_found = find_planet("https://swapi.dev/api/planets/1")
      expect(planet_found.name).to eq(planet.name)
    end
  end

  describe "#find_race" do
    race = Race.create kind: "Human"
    race_2 = Race.create kind: "Droid"
    race_3 = Race.create kind: "Droid-Wookie"

    it "returns the right race instances" do
      race_found = find_race([])
      race_2_found = find_race(["https://swapi.dev/api/species/2/"])
      race_3_found = find_race(["https://swapi.dev/api/species/2/", "https://swapi.dev/api/species/3/"])

      expect(race_found.kind).to eq(race.kind)
      expect(race_2_found.kind).to eq(race_2.kind)
      expect(race_3_found.kind).to eq(race_3.kind)
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
end