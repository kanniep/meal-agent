class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :manage, Order, user_id: user.id
    can :read, Meal
    can :create, Shop

    return unless user.shop_owner?
    can :manage, Shop, user_id: user.id
    can :create, Meal
    can :manage, Meal, shop: { user_id: user.id }

    return unless user.admin?
    can :manage, :all
  end
end
