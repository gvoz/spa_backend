FactoryGirl.define do
  factory :post do
    title 'First post'
    body 'Hello tester!'
    username 'tester'
    date Date.today
  end
end
