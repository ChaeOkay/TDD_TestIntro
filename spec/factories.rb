require 'faker'
FactoryGirl.define do
  factory :menu do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    start_at { Time.now }
    end_at {Time.now + 100000}

    factory :menu_with_items do

      ignore do
        menu_item_number 1
      end

      after(:create) do |menu, evaluator|
        FactoryGirl.create_list(:menu_item, evaluator.menu_item_number, menu: menu)
      end
    end
  end

  factory :menu_item do
    name { "Hamburger" }
    description { "very tasty" }
    price { 70.42 }
    menu
  end

end


