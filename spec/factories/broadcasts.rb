FactoryGirl.define do
  factory :broadcast do
  	session_name "foo"
    sequence :broadcast_date do |n|
      Date.parse("{n}/01/2012 00:00")
    end
    
    factory :broadcast_with_mixes do
      transient do
        mixes_count 5
      end
      after(:create) do |broadcast, evaluator|
        create_list(:mix, evaluator.mixes_count, broadcast: broadcast)
      end
    end

    factory :broadcast_with_mixes_with_tracks do
      transient do
        mixes_count 5
      end
      after(:create) do |broadcast, evaluator|
        create_list(:mix_with_tracks, evaluator.mixes_count, broadcast: broadcast)
      end
    end

  end
end
