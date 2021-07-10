require 'rails_helper'

describe AkababService::Load do
  it "only returns a parsed response if its status is OK" do
    parsed_response = AkababService::Load.get_data(2)
    expect(parsed_response).not_to be_nil
  end

  it "returns nil if the server status is 404" do
    parsed_response = AkababService::Load.get_data(17)
    expect(parsed_response).to be_nil
  end
end
