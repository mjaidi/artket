class ArtistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def user_artists?
    true
  end
end
