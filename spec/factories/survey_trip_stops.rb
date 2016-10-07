FactoryGirl.define do
  factory :survey_trip_stop do
    boarded 1
    alighted 1
    miles_from_previous 1.5
    sequence_number 1
    association :survey
  end
end
