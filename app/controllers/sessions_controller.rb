class SessionsController < Devise::SessionsController
  def new
    @nofilters = true
  end 
end