require 'open-uri'
module SwapiService
  class Load
    def self.get_planets(i)
      url = "https://swapi.dev/api/planets/#{i}"
      response = open(url).read
      parsed_response = JSON.parse(response)
    end

    def self.get_species(i)
      url = "https://swapi.dev/api/species/#{i}"
      response = open(url).read
      parsed_response = JSON.parse(response)
    end

    def self.get_people(i)
      url = "https://swapi.dev/api/people/#{i}"
      response = open(url).read
      parsed_response = JSON.parse(response)
    end
  end
end