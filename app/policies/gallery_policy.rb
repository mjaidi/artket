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
end
