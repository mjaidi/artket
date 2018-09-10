class ExhibitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
     true
  end

  def user_exhibitions?
    true
  end

  def user_exhibition?
    record.gallery.user == user
  end

  def create?
    record.gallery.user == user
  end

  def update?
    record.gallery.user == user
  end

  def add_artwork?
    record.gallery.user == user
  end
end
