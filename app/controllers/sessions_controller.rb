# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def new
    @nofilters = true
    super
  end
end
