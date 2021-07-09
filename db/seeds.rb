# Cleaning database
system "clear"
puts "Cleaning up database..."
sleep(2)
Pilot.destroy_all
Person.destroy_all
Planet.destroy_all
Race.destroy_all
Starcraft.destroy_all

Dir[Rails.root.join('db/seeds/*.rb')].sort.each { |file| require file }
