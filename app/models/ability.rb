class Ability
  include CanCan::Ability

  def initialize(user)
    can :search, Hospital

    if user.nil?
      can :create, User
      can :read, Hospital
    else
      if user.role? :admin
        can :manage, :all
        can :read, :all_suggestions
      elsif user.role? :normal
        can :search, Hospital
        can :read, Hospital
        can :create, HospitalSuggestion
      end
    end
  end
end

    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

