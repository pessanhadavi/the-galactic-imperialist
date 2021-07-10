require 'rails_helper'

RSpec.describe Race, :type => :model do
  subject { described_class.new kind: "Any" }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with no kind" do
    subject.kind = nil
    expect(subject).to_not be_valid
  end
end