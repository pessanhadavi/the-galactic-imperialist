module AkababService
  class Load
    def self.get_data(i)
      url = "https://akabab.github.io/starwars-api/api/id/#{i}.json"
      response = HTTParty.get(url)
      response.parsed_response['image'] if response.code == 200
    end
  end
end
