# frozen_string_literal: true

class PressreleasesController < ApplicationController
  def index
    @pressreleases = Pressrelease.all
  end
end
