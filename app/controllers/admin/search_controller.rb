# frozen_string_literal: true

class Admin::SearchController < Admin::BaseController
  def create
    @hits = []
    @hits += User.fuzzy_search(params[:searchterm])
    @hits += Application.fuzzy_search(params[:searchterm])
    @hits += Space.fuzzy_search(params[:searchterm])
  end
end
