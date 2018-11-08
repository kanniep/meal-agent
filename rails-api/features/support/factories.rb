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
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google',
          uid: 12345,
          info: {
            email: "admin#{n}@ait.asia",
            name: "admin#{n}",
            image: "profile-mock.png"
          },
          credentials: {
            token: "token_admin#{n}",
            refresh_token: "another_token_admin#{n}",
            expires_at: 1354920555,
            expires: true
          }
        })
      "admin#{n}@ait.asia"
    end
    image { "profile-mock.png" }
    roles { [Role.find(3), Role.find(1)] }
  end

  factory :shop_owner, class: User do
    sequence :id do |n|
      n + 20
    end
    sequence :email do |n|
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google',
          uid: 12345,
          info: {
            email: "shop_owner#{n}@ait.asia",
            name: "shop_owner#{n}",
            image: "profile-mock.png"
          },
          credentials: {
            token: "token_shop_owner#{n}",
            refresh_token: "another_token_shop_owner#{n}",
            expires_at: 1354920555,
            expires: true
          }
        })
      "shop_owner#{n}@ait.asia"
    end
    image { "profile-mock.png" }
    roles { [Role.find(3), Role.find(2)] }
  end

  factory :user, class: User do
    sequence :id do |n|
      n + 30
    end
    sequence :email do |n|
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google',
          uid: 12345,
          info: {
            email: "customer#{n}@ait.asia",
            name: "customer#{n}",
            image: "profile-mock.png"
          },
          credentials: {
            token: "token_customer#{n}",
            refresh_token: "another_token_customer#{n}",
            expires_at: 1354920555,
            expires: true
          }
        })
      "customer#{n}@ait.asia"
    end
    image { "profile-mock.png" }
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
