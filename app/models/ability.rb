class Ability
  include CanCan::Ability

  # This Ability class gets instantiated and use dautomattically by the CanCanCan jem.
  # There is an assumption that you ahve method in the controller to get the
  # current user and the method name is 'current_user'
  # give a guest user that won't be nill if someone is not signed
  # ability = Ability.new(current_user)
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities


    # This Ability class gets instantiated and use dautomattically by the CanCanCan jem.
    # There is an assumption that you ahve method in the controller to get the
    # current user and the method name is 'current_user'
    # give a guest user that won't be nill if someone is not signed
    user ||= User.new


    # this user can manage all the different actions of each question
    # can :manage, Question do |question|
    #   user == question.user || user.admin?
    # end

      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end

      can :manage, Question do |question|
        user == question.user
      end

      can :manage, Answer do |answer|

        # can :manage, Answer do |answer|
        # this enforces that the logged in user must be either the owner of the
        # answer or the owner for the question that the answer references.
        user == answer.user || user == answer.question.user
      end




  end
end
