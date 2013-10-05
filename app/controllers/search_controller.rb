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
  
end
