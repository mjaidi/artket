class ArtPhotoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    user.gallerist == true
    record.artwork.gallery.user == user
  end
end
