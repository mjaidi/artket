class ArtistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def user_artists?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end
end
