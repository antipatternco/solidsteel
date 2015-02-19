FactoryGirl.define do
  factory :broadcast do
  	session_name "foo"
    sequence :broadcast_date do |n|
      Date.parse("0#{n}/01/2012 00:00")
  	end
  end
end
