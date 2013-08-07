# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app do
    accepted false
    score 1
    reviewer_id 1
    rejected false
  end
end
