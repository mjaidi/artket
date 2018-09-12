class GalleryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
     true
  end

  def contact?
    true
  end

   def user_gallery?
    user.gallerist == true
    record.user == user
  end

  def update?
    user.gallerist == true
    record.user == user
  end
end
