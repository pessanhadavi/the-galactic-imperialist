puts "Cleaning up database..."
sleep(1)
Planet.destroy_all
puts "Analysing orbits within a massive Jabba-like range..."
sleep(2)
puts "Uploading planets' information to the database..."
puts ""

60.times do |i|
  planet = SwapiService::Load.get_planets(i+1)

  Planet.create!(
    name: planet['name']
  )

  printf("\rProgress: [%-30s]", "=" * (i/2))
  sleep(0.5)
end

puts "\nSubtracting planets destroyed by the deathstar..."
sleep(5)
puts "Uploaded information of #{Planet.count} planets!"


# Person.create!(
#   name: person['name'],
#   height: person['height'],
#   weight: person['weight'],
#   dob: person['dob']
# )

