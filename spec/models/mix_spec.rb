require 'rails_helper'

RSpec.describe Mix, :type => :model do

  it "should have a factory" do
    expect(FactoryGirl.build(:mix)).to be_valid
  end

  it "won't save without a name" do
    expect(Mix.new).not_to be_valid
  end

  it { should belong_to :broadcast }
end
