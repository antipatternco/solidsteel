require 'rails_helper'

RSpec.describe Mix, :type => :model do
  it "won't save without a URL" do
    expect(Mix.new(name: "Foo")).not_to be_valid
  end

  it "returns latest mix" do
    todayMix = Mix.create!(name: "Foo", url: "http://foo", broadcast_date: Date.parse("18/02/2015 15:00"))
    yesterdayMix = Mix.create!(name: "Bar", url: "http://bar", broadcast_date: Date.parse("17/02/2015 15:00"))
    dayBeforeYesterdayMix = Mix.create!(name: "FooBar", url: "http://foobar", broadcast_date: Date.parse("16/02/2015 15:00"))

    expect(Mix.get_latest).to eq(todayMix)
  end
end
