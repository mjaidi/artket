class ArtworkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
     true
  end

  def create?
    record.gallery.user == user
  end
end
