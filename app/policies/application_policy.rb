class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  private

  def has_user?
    record.user_id == user.id
  end

  def has_user_relation?(relation)
    related_record = record.send(relation)
    if related_record.present?
      related_record.user_id == user.id
    else
      true
    end
  end
end
