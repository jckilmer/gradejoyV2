class AssignmentPolicy < ApplicationPolicy
  def new?
    has_user?
  end

  alias_method :show?, :new?
  alias_method :create?, :new?
  alias_method :update?, :new?
  alias_method :destroy?, :new?
end
