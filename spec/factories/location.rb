require 'factory_girl'

FactoryGirl.define do
  sequence :location_name do |n|
    "location#{n}"
  end
end

FactoryGirl.define do
  factory :location do |s|
    s.name { FactoryGirl.generate(:location_name) } 
    s.capacity { Random.rand(100..10000) }
    s.coordinates { [ Random.rand(1..10),Random.rand(1..10) ] }
  end
end
