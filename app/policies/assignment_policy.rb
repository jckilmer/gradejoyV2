class AssignmentPolicy < ApplicationPolicy
  def new?
    has_user?
  end

  def create?
    [
      has_user?
      has_user_relation?(:course)
    ]
  end

  alias_method :show?, :new?
  alias_method :update?, :create?
  alias_method :destroy?, :create?
end
