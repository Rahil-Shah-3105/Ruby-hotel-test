class Ability
logger           = ActiveSupport::Logger.new(STDOUT)
  include CanCan::Ability

  def initialize(user)
	warn("[DEBUG] >>> Entering initialize(user=#{user})")
    user ||= User.new # guest user (not logged in)

    can :manage, :all if user.admin
    can %i[create index], Contact
    can %i[create read update], Order, user_id: user.id
	warn("[DEBUG] <<< Exiting initialize(user=#{user})")
    can :read, Apartment
  end
end
