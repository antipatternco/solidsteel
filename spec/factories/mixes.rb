FactoryGirl.define do
  factory :mix do
  	name "foo"
  	sequence :part do |n|
      n
    end
    broadcast

    factory :mix_with_tracks, :parent => :mix do
      transient do
        tracks_count 5
      end
      after(:create) do |mix, evaluator|
      	create_list(:track, evaluator.tracks_count, mix: mix)
      end
  end

  end
end
