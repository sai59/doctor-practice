class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    puts user.inspect
    if user.is? 'owner'
      can :manage, :all
    end
    if user.is? 'receptionist'
      can :manage, Appointment
    end
    if user.is? 'customer'
      can :read, Appointment
    end
    if user.is? 'doctor'
      can :read, Appointment
    end
  end
end
