FactoryBot.define do
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
    roles { [Role.find(3)] }
  end
end
