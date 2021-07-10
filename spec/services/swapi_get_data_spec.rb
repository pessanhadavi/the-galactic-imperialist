require 'rails_helper'

describe SwapiService::Load do

  entities = ['planets','starships', 'species', 'people']

  entities.each_with_index do |entity, i|
    it "only returns a parsed response of #{entity} if its status is OK" do
      parsed_response = SwapiService::Load.get_data(i+1, entity)
      expect(parsed_response).not_to be_nil
    end
  end

  it "returns nil if the server status is 404" do
    parsed_people = SwapiService::Load.get_data(17, "people")
    parsed_starship = SwapiService::Load.get_data(1, "starships")

    expect(parsed_people).to be_nil
    expect(parsed_starship).to be_nil
  end
end
