class CoursePolicy < ApplicationPolicy
  def show?
    has_user?
  end

  alias_method :edit?, :show?
  alias_method :new?, :show?
  alias_method :create?, :show?
  alias_method :update?, :show?
  alias_method :destroy?, :show?
end
