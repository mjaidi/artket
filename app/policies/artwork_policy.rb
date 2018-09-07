class ArtworkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
     true
  end

  def edit?
    record.gallery.user == user
  end

  def update?
    record.gallery.user == user
  end

  def create?
    record.gallery.user == user
  end
end
