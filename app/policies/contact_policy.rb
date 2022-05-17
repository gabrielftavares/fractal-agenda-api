class ContactPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def update?
    record.user == user
  end

  def create?
    !user.nil?
  end

  def destroy?
    record.user == user
  end
end
