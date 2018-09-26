class ArtistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def user_artists?
    user.gallerist == true
  end

  def create?
    user.gallerist == true
    record.user == user
  end

  def update?
    user.gallerist == true
    record.user == user
  end

  def destroy?
    user.gallerist == true
    record.user == user
  end
end
