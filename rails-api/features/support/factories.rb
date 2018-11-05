FactoryBot.define do
  factory :admin_role, class: Role do
    id { 1 }
    name { "admin" }
  end

  factory :shop_owner_role, class: Role do
    id { 2 }
    name { "shop_owner" }
  end

  factory :ordinary_role, class: Role do
    id { 3 }
    name { "ordinary" }
  end

  factory :admin, class: User do
    sequence :id do |n|
      n + 10
    end
    sequence :email do |n|
      "admin#{n}@ait.asia"
    end
    password {"password"}
    password_confirmation {"password"}
    roles { [Role.find(3), Role.find(1)] }
  end

  factory :shop_owner, class: User do
    sequence :id do |n|
      n + 20
    end
    sequence :email do |n|
      "shop_owner#{n}@ait.asia"
    end
    password {"password"}
    password_confirmation {"password"}
    roles { [Role.find(3), Role.find(2)] }
  end

  factory :user, class: User do
    sequence :id do |n|
      n + 30
    end
    sequence :email do |n|
      "customer#{n}@ait.asia"
    end
    password {"password"}
    password_confirmation {"password"}
  end

  factory :shop, class: Shop do
    sequence :name do |n|
      "shop#{n}"
    end
    location {"location"}
    description {"description"}
  end

  factory :meal, class: Meal do
    sequence :name do |n|
      "mock_meal#{n}"
    end
    meal_type {"meal_type"}
    description {"description"}
    price {40.22}
  end

  factory :order, class: Order do
    user {User.all.first}
    meal {Meal.all.first}
  end
end
