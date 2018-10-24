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
    roles { [Role.find(1)] }
  end

  factory :user, class: User do
    sequence :id do |n|
      n + 20
    end
    sequence :email do |n|
      "customer#{n}@ait.asia"
    end
    password {"password"}
    password_confirmation {"password"}
  end
end
