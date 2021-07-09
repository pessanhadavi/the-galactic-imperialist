require_relative 'aux_methods/people_and_pilots.rb'
# Uploading People and Pilots
system "clear"
puts "Uploading people information to the database..."
sleep(2)
puts ""
i = 1

until Person.count == 82 do
  person_api = SwapiService::Load.get_data(i, "people")
  if person_api
    person_planet = find_planet(person_api)
    person_race = find_race(person_api)

    person = Person.new(
      name: person_api['name'],
      height: person_api['height'],
      weight: person_api['mass'],
      dob: person_api['birth_year']
      hair: person_api['hair_color']
      skin: person_api['skin_color']
      eye: person_api['eye_color']
      gender: person_api['gender']
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
