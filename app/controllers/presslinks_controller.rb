# frozen_string_literal: true

class PresslinksController < ApplicationController
  def index
    @presslinks = Presslink.by_subsite(@subsite.id).order('date_of_press DESC')
  end
end
