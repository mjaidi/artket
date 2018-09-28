class ArtworkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def get_subcategories?
    true
  end

  def show?
     record.published
  end

  def edit?
    user.gallerist == true
    record.gallery.user == user
  end

  def update?
    user.gallerist == true
    record.gallery.user == user
  end

  def create?
    user.gallerist == true
    record.gallery.user == user
  end

  def destroy?
    user.gallerist == true
    record.gallery.user == user
  end
end
