# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user_id 1
    app_id 1
    comment_text "MyText"
  end
end
