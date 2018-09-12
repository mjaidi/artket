class GalleryLikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  
  def create?
    user.gallerist == false
  end

  def destroy?
    user.gallerist == false
    record.user == user
  end
end
