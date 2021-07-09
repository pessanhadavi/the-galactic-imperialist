# Uploading Planets
system "clear"
puts "Analysing orbits within a massive Jabba-like range..."
sleep(3)
puts "Uploading planets' information to the database..."
sleep(1)
puts ""
i = 1

until Planet.count == 60 do
  planet = SwapiService::Load.get_data(i, "planets")

  if planet
    Planet.create(
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
