FactoryBot.define do
  factory :admin, class: User do
    sequence :email do |n|
      "admin#{n}@ait.asia"
    end
    password {"password"}
    password_confirmation {"password"}
    roles { [Role.find(1)] }
  end

  factory :user, class: User do
    sequence :email do |n|
      "chashier#{n}@ait.asia"
    end
    password {"password"}
    password_confirmation {"password"}
    roles { [Role.find(3)] }
  end
end
