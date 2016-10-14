FactoryGirl.define do
  factory :survey_trip_stop do
    sequence(:location) { |n| "Location #{n}" }
    time DateTime.current()
    association :survey
  end
end
