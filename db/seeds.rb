# Cleaning database
puts "Cleaning up database..."
sleep(1)
# Planet.destroy_all
Race.destroy_all

# # Uploading planets
# puts "Analysing orbits within a massive Jabba-like range..."
# sleep(2)
# puts "Uploading planets' information to the database..."
# puts ""

# 60.times do |i|
#   planet = SwapiService::Load.get_planets(i+1)

#   Planet.create!(
#     name: planet['name']
#   )

#   printf("\rProgress: [%-30s]", "=" * (i/2))
#   sleep(0.5)
# end

# puts "\nSubtracting planets destroyed by the deathstar..."
# sleep(5)
# puts "Uploaded information of #{Planet.count} planets!"

# Uploading Races
37.times do |i|
  race = SwapiService::Load.get_species(i+1)

  Race.create!(
    kind: race['name']
  )

  printf("\rProgress: [%-18s]", "=" * (i/2))
  sleep(0.5)
end

print "\nSubtracting species extinguished by the Sith Lords..."
sleep(5)
print "And Luke..."
sleep(3)
puts "\nUploaded information of #{Race.count} species!"

# Person.create!(
#   name: person['name'],
#   height: person['height'],
#   weight: person['weight'],
#   dob: person['dob']
# )

