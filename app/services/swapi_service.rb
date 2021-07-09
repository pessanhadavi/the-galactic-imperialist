module SwapiService
  class Load
    def self.get_data(i, entity)
      url = "https://swapi.dev/api/#{entity}/#{i}"
      response = HTTParty.get(url)
      response.parsed_response if response.code == 200
    end
  end
end
