# frozen_string_literal: true

class SearchController < ApplicationController
  def create
    # check for country
    country = Country.find_country_by_name(params[:searchterm])
    countrycode = country.alpha2.downcase unless country.nil?

    @hits = []
    # @hits += Page.by_subsite(@subsite.id).includes(:translations).advanced_search(params[:searchterm])
    @hits += Post.by_subsite(@subsite.id).includes(:translations).advanced_search(params[:searchterm]).published

    @hits += Application.fuzzy_search(params[:searchterm]).to_a.delete_if { |x| !x.approved? }.map(&:space)

    @hits += Space.fuzzy_search(params[:searchterm]).to_a.delete_if { |x| x.applications.approved.empty? }
    @hits += Space.where(['lower(country) = ? OR lower(visiting_country) = ?', countrycode, countrycode]).to_a.delete_if { |x| x.applications.approved.empty? } unless countrycode.nil?

    @hits.uniq!
  end

  def unsearch
    session[:filter_scope]['search'].uniq.each do |search|
      if search['search_type'] == params[:search_type] && search['search_term'] == params[:search_term]
        session[:filter_scope]['search'].delete('search_type' => params[:search_type], 'search_term' => params[:search_term])
      end
    end
    @spaces = get_from_filter_or
    params[:search_term] = nil
    redirect_to '/spaces/map'
  end

  def aimsearch
    if session[:filter_scope].blank?
      @spaces = []
    else
      session[:filter_scope]['search'] ||= []
      session[:filter_scope]['search'] << { 'search_type' => params['search_type'], 'search_term' => params['search_term'] }
      session[:filter_scope]['search'].uniq!
      @spaces = get_from_filter_or

      # process existing filter scope first
    end

    # case params[:search_type]
    # when 'activities'
    #   @spaces +=  Space.fuzzy_search(params[:search_term]).delete_if {|x| !x.approved }
    # when 'name'
    #   @spaces +=  Space.fuzzy_search(params[:search_term]).delete_if {|x| !x.approved }
    # when 'location'
    #   country = Country.find_by_name(params[:search_term])
    #   unless country.nil?
    #     @spaces += Space.where("country = ? OR visiting_country = ?", country.first, country.first )
    #   end
    #
    # else
    #   @spaces +=  Space.fuzzy_search(params[:search_term]).delete_if {|x| !x.approved }
    #
    # end

    render template: 'spaces/map'
  end
end
