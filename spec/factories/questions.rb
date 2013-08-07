# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    text "MyString"
    description "MyText"
    position 1
  end
end
