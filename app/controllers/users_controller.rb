class UsersController < InheritedResources::Base
  actions :my_organisations
  before_filter :authenticate_user!
  
  def my_organisations
    @nofilters = 1
  end
end