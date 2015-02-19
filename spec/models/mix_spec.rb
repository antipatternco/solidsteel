require 'rails_helper'

RSpec.describe Mix, :type => :model do

  it "should have a factory" do
    expect(FactoryGirl.build(:mix)).to be_valid
  end

  it "won't save without a URL" do
    expect(Mix.new(name: "Foo")).not_to be_valid
  end

  it { should belong_to :broadcast }
end
