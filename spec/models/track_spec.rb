require 'rails_helper'

RSpec.describe Track, :type => :model do
  it "won't save without a title" do
    expect(Track.new(artist: "foo")).not_to be_valid
  end

  it "won't save without a artist" do
    expect(Track.new(title: "foo")).not_to be_valid
  end
end
