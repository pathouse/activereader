class UserPolicy < ApplicationPolicy

  def index?
    false
  end

  def show?
    user == record
  end

  def create?
    false
  end

  def new?
    false
  end

  def update?
    user == record
  end

  def edit?
    user == record
  end

  def destroy?
    false
  end
end