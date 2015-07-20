class AssignmentPolicy < ApplicationPolicy
  def new?
    has_user?
  end

  alias_method :create?, :show?
  alias_method :update?, :show?
  alias_method :destroy?, :show?
end
