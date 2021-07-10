# Auxiliary methods for People and Pilots uploading
def find_planet(homeworld_api)
  planet_i = homeworld_api[/(\d+)/]
  planet = SwapiService::Load.get_data(planet_i, "planets")
  Planet.find_by name: planet['name']
end

def find_race(species_api)
  case species_api.length
  when 0
    Race.find_by kind: "Human"
  when 1
    race_i = species_api.first[/(\d+)/]
    race = SwapiService::Load.get_data(race_i, "species")
    Race.find_by kind: race['name']
  else
    race = species_api.map do |api_address|
      race_i = api_address[/(\d+)/]
      SwapiService::Load.get_data(race_i, "species")['name']
    end

    Race.create!(
      kind: race.join('-')
    )
  end
end

def is_pilot?(starships_api)
  starships_api.length > 0
end

def pilot_license_registration(starships_api, person)
  starcrafts = starships_api.map do |starship|
    starcraft_i = starship[/(\d+)/]
    SwapiService::Load.get_data(starcraft_i, "starships")
  end

  starcrafts.each do |starcraft|
    pilot_starcraft = Starcraft.find_by name: starcraft['name']
    pilot = Pilot.new
    pilot.person = person
    pilot.starcraft = pilot_starcraft
    pilot.save!
  end
end
