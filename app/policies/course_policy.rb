class CoursePolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope = Course.where(user: @user)
      scope
    end
  end

  def show?
    has_user?
  end

  alias_method :edit?, :show?
  alias_method :new?, :show?
  alias_method :create?, :show?
  alias_method :update?, :show?
  alias_method :destroy?, :show?
end
