class Ability
  include CanCan::Ability

  def initialize(user)

      # user ||= User.new # guest user (not logged in)
      unless user.nil?
        if user.has_role? :god
          can :manage, :all
        elsif user.has_role? :staff
          can :manage, [Space, Page, Comment]
        elsif user.has_role? :exhibitor
          cannot :manage, ActiveAdmin::Page
          can :manage, Space, :id => Space.with_role(:exhibitor, user).map(&:id)
        else
          cannot :manage, ActiveAdmin::Page
          can :read, :all
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
  end
end
