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
    record.user == user
  end

  def update?
    record.user == user
  end
end
