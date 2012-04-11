require 'factory_girl'

FactoryGirl.define do
  sequence :ship_name do |n|
    "ship#{n}"
  end
end

FactoryGirl.define do
  factory :ship do |s|
    s.name { FactoryGirl.generate(:ship_name) } 
    s.capacity { Random.rand(100..10000) }
  end
end
