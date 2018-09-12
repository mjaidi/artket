class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
     true
  end

  def user_gallery_dashboard?
    user.gallerist == true
  end

  def user_dashboard?
    true
  end
end
