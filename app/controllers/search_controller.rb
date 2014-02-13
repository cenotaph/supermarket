class SearchController < ApplicationController

  def create
    # check for country
    country = Country.find_country_by_name(params[:searchterm])
    unless country.nil?
      countrycode = country.alpha2.downcase
    end
    
    @hits = []
    # @hits += Page.by_subsite(@subsite.id).includes(:translations).advanced_search(params[:searchterm])
    @hits += Post.by_subsite(@subsite.id).includes(:translations).advanced_search(params[:searchterm]).published
    
    @hits += Application.fuzzy_search(params[:searchterm]).delete_if{|x| !x.approved?}.map(&:space)
    @hits += Space.fuzzy_search(params[:searchterm]).delete_if {|x| x.applications.approved.empty? } 
    @hits += Space.where(["lower(country) = ? OR lower(visiting_country) = ?", countrycode, countrycode]).delete_if {|x| x.applications.approved.empty? } unless countrycode.nil?

    @hits.uniq!
  end
  
  def aimsearch
    @spaces =  Space.fuzzy_search(params[:search_term]).delete_if {|x| !x.approved }
    country = Country.find_by_name(params[:search_term])
    unless country.nil?
      @spaces += Space.where("country = ? OR visiting_country = ?", country.first, country.first )
    end
    session[:filter_scope] ||= Hash.new
    session[:filter_scope]["search_term"] = params[:search_term]
    render :template => 'spaces/map'
  end
  
end
