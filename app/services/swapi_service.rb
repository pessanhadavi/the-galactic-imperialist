require 'open-uri'
module SwapiService
  class Load
    def self.get_planet(i)
      url = "https://swapi.dev/api/planets/#{i}"
      response = HTTParty.get(url)
    end

    def self.get_species(i)
      url = "https://swapi.dev/api/species/#{i}"
      response = HTTParty.get(url)
    end

    def self.get_person(i)
      url = "https://swapi.dev/api/people/#{i}"
      response = HTTParty.get(url)
    end
  end
end