# Cleaning database
puts "Cleaning up database..."
sleep(1)
# Planet.destroy_all
# Race.destroy_all
Person.destroy_all

# # Uploading planets
# puts "Analysing orbits within a massive Jabba-like range..."
# sleep(2)
# puts "Uploading planets' information to the database..."
# puts ""

# 60.times do |i|
#   planet = SwapiService::Load.get_planet(i+1)

#   Planet.create!(
#     name: planet['name']
#   )

#   printf("\rProgress: [%-30s]", "=" * (i/2))
#   sleep(0.5)
# end

# puts "\nSubtracting planets destroyed by the deathstar..."
# sleep(5)
# puts "Uploaded information of #{Planet.count} planets!"

# # Uploading Races
# puts "Uploading species' information to the database..."
# sleep(1)
# puts ""

# 37.times do |i|
#   race = SwapiService::Load.get_species(i+1)

#   Race.create!(
#     kind: race['name']
#   )

#   printf("\rProgress: [%-18s]", "=" * (i/2))
#   sleep(0.5)
# end

# print "\nSubtracting species extinguished by the Sith Lords..."
# sleep(5)
# print "And Luke..."
# sleep(3)
# puts "\nUploaded information of #{Race.count} species!"

# Uploading People
puts "Uploading people information to the database..."
sleep(1)
puts ""
83.times do |i|
  person = SwapiService::Load.get_person(i + 1)
  unless person['detail']
    planet_i = person['homeworld'][/(\d+)/]
    planet = SwapiService::Load.get_planet(planet_i)
    person_planet = Planet.find_by name: planet['name']
    case person['species'].length
    when 0
      person_race = Race.first
    when 1
      race_i = person['species'].first[/(\d+)/]
      race = SwapiService::Load.get_species(race_i)
      person_race = Race.find_by kind: race['name']
    else
      race = person['species'].join('-')
      person_race = Race.create!(
      kind: race
      )
    end

    new_person = Person.new(
      name: person['name'],
      height: person['height'],
      weight: person['mass'],
      dob: person['birth_year']
    )
    new_person.planet = person_planet
    new_person.race = person_race
    new_person.save
  
    printf("\rProgress: [%-41s]", "=" * (i/2))
  end
end

print "\nSubtracting Jar Jar Binks..."
sleep(3)
print "Kidding..."
sleep(3)
puts "\nUploaded information of #{Person.count} people!"
