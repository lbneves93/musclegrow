# frozen_string_literal: true

class Ability
  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

  include CanCan::Ability

  def initialize(user)
    admin_access if user.admin?
    athlete_access(user) if user.athlete?
  end

  def admin_access
    can :manage, :all
  end

  def athlete_access(user)
    can :manage, TrainingPlan, user: { id: user.id }
    can :read, Exercise
  end
end
