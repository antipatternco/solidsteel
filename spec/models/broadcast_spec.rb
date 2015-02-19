require 'rails_helper'

RSpec.describe Broadcast, :type => :model do

  it "should have a factory" do
    expect(FactoryGirl.build(:broadcast)).to be_valid
  end

  it "won't save without a session name" do
    expect(Broadcast.new(broadcast_date: Date.parse("16/02/2015 15:00"))).not_to be_valid
  end

  it "won't save without a broadcast date" do
    expect(Broadcast.new(session_name: "Foo")).not_to be_valid
  end

  it { should have_many :mixes }

  it "returns latest broadcast" do
    dayBeforeYesterdayBroadcast = FactoryGirl.create(:broadcast)
    yesterdayBroadcast = FactoryGirl.create(:broadcast)
    todayBroadcast = FactoryGirl.create(:broadcast)

    expect(Broadcast.get_latest).to eq(todayBroadcast)
  end
end
