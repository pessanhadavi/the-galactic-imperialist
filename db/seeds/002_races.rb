# Uploading Races
system "clear"
puts "Uploading species' information to the database..."
sleep(2)
puts ""
i = 1

until Race.count == 37 do
  race = SwapiService::Load.get_data(i, "species")

  if race
    Race.create(
      kind: race['name']
    )
    printf("\rProgress: [%-37s]", "=" * (i))
  end

  i += 1
end

print "\nSubtracting species extinguished by the Sith Lords..."
sleep(3)
print "And Luke..."
sleep(3)
puts "\nUploaded information of #{Race.count} species!"
sleep(3)
