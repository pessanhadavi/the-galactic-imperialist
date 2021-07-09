# Auxiliary methods for People and Pilots uploading
def find_planet(person_api)
  planet_i = person_api['homeworld'][/(\d+)/]
  planet = SwapiService::Load.get_data(planet_i, "planets")
  Planet.find_by name: planet['name']
end

def find_race(person_api)
  case person_api['species'].length
  when 0
    Race.first
  when 1
    race_i = person_api['species'].first[/(\d+)/]
    race = SwapiService::Load.get_data(race_i, "species")
    Race.find_by kind: race['name']
  else
    race = person_api['species'].join('-')
    Race.create!(
      kind: race
    )
  end
end

def is_pilot?(person_api)
  person_api['starships'].length > 0
end

def pilot_license_registration(person_api, person)
  starcrafts = person_api["starships"].map do |starship|
    starcraft_i = starship[/(\d+)/]
    SwapiService::Load.get_data(starcraft_i, "starships")
  end

  starcrafts.each do |starcraft|
    pilot_starcraft = Starcraft.find_by name: starcraft['name']
    pilot = Pilot.new
    pilot.person = person
    pilot.starcraft = pilot_starcraft
    pilot.save
  end
end
