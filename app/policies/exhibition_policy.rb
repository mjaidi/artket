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
end
