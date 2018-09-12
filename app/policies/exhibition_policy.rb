class ExhibitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
     record.published
  end

  def user_exhibitions?
    user.gallerist == true
    true
  end

  def user_exhibition?
   user.gallerist == true
   record.gallery.user == user
  end

  def create?
    user.gallerist == true
    record.gallery.user == user
  end

  def update?
    user.gallerist == true
    record.gallery.user == user
  end

  def add_artwork?
    user.gallerist == true
    record.gallery.user == user
  end

  def remove_artwork?
    user.gallerist == true
    record.gallery.user == user
  end
end
