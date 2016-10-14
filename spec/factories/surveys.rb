FactoryGirl.define do
  factory :survey do
    date DateTime.current
    sequence(:shift) { |n| "Shift #{n}" }
  end
end
