# Uploading Starcrafts
system "clear"
puts "Checking starships licenses information..."
sleep(2)
puts ""
i = 1

until Starcraft.count == 36 do
  starcraft = SwapiService::Load.get_data(i, "starships")
  if starcraft
    Starcraft.create(
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
