class AirplanePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    user.role == "owner"
  end

  def create?
    new?
  end

  def edit?
    record.owner == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
