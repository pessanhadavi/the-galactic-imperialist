# Cleaning database
def cleaning_database
  system "clear"
  puts "Cleaning up database..."
  sleep(2)
  Pilot.destroy_all
  Person.destroy_all
  Planet.destroy_all
  Race.destroy_all
  Starcraft.destroy_all
end

# Uploading Planets
def upload_planets
  system "clear"
  puts "Analysing orbits within a massive Jabba-like range..."
  sleep(3)
  puts "Uploading planets' information to the database..."
  sleep(1)
  puts ""
  i = 1

  until Planet.count == 60 do
    planet = SwapiService::Load.get_planet(i)

    if planet
      Planet.create!(
        name: planet['name']
      )
      printf("\rProgress: [%-30s]", "=" * (i/2))
    end

    i += 1
  end

  puts "\nSubtracting planets destroyed by the deathstar..."
  sleep(3)
  puts "Uploaded information of #{Planet.count} planets!"
  sleep(3)
end

# Uploading Races
def upload_races
  system "clear"
  puts "Uploading species' information to the database..."
  sleep(2)
  puts ""
  i = 1

  until Race.count == 37 do
    race = SwapiService::Load.get_species(i)

    if race
      Race.create!(
        kind: race['name']
      )
      printf("\rProgress: [%-18s]", "=" * (i/2))
    end

    i += 1
  end

  print "\nSubtracting species extinguished by the Sith Lords..."
  sleep(3)
  print "And Luke..."
  sleep(3)
  puts "\nUploaded information of #{Race.count} species!"
  sleep(3)
end

# Uploading Starcrafts
def upload_starcrafts
  system "clear"
  puts "Checking starships licenses information..."
  sleep(2)
  puts ""
  i = 1

  until Starcraft.count == 36 do
    starcraft = SwapiService::Load.get_starcraft(i)
    if starcraft
      Starcraft.create!(
        name: starcraft['name']
      )
      printf("\rProgress: [%-37s]", "=" * (i/2))
    end

    i += 1
  end

  print "\nWait..."
  sleep(3)
  print "Ford is not a starship!"
  sleep(3)
  puts "\nUploaded information of #{Starcraft.count} starships!"
  sleep(3)
end

# Uploading People and Pilots
def upload_people_and_pilots
  system "clear"
  puts "Uploading people information to the database..."
  sleep(2)
  puts ""
  i = 1

  until Person.count == 82 do
    person_api = SwapiService::Load.get_person(i)
    if person_api
      person_planet = find_planet(person_api)
      person_race = find_race(person_api)

      person = Person.new(
        name: person_api['name'],
        height: person_api['height'],
        weight: person_api['mass'],
        dob: person_api['birth_year']
      )
      person.planet = person_planet
      person.race = person_race
      person.save

      pilot_license_registration(person_api, person) if is_pilot?(person_api)
      printf("\rProgress: [%-41s]", "=" * (i/2))
    end

    i += 1
  end

  print "\nSubtracting Jar Jar Binks..."
  sleep(3)
  print "Kidding..."
  sleep(3)
  puts "\nUploaded information of #{Person.count} people!"
end

# Auxiliary methods for People and Pilots uploading
def find_planet(person_api)
  planet_i = person_api['homeworld'][/(\d+)/]
  planet = SwapiService::Load.get_planet(planet_i)
  Planet.find_by name: planet['name']
end

def find_race(person_api)
  case person_api['species'].length
  when 0
    Race.first
  when 1
    race_i = person_api['species'].first[/(\d+)/]
    race = SwapiService::Load.get_species(race_i)
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
    SwapiService::Load.get_starcraft(starcraft_i)
  end

  starcrafts.each do |starcraft|
    pilot_starcraft = Starcraft.find_by name: starcraft['name']
    pilot = Pilot.new
    pilot.person = person
    pilot.starcraft = pilot_starcraft
    pilot.save
  end
end

# Calling main methods
cleaning_database
upload_planets
upload_races
upload_starcrafts
upload_people_and_pilots
