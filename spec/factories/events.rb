# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    date_time "2014-04-07 16:47:28"
    complete false
  end
end
