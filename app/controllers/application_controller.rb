# frozen_string_literal: true

# main application controller. Also contains frontpage
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ThemesForRails::ActionController
  # include Recaptcha::ClientHelper
  protect_from_forgery with: :null_session
  before_action :get_site
  before_action :get_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  theme :get_site

  rescue_from Wicked::Wizard::InvalidStepError do |exception|
    redirect_to view_application_path(params[:id])
  end

  before_action do
    resource = controller_path.singularize.tr('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def default_url_options
    { protocol: :https }
  end
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.has_role?(:staff) || resource.has_role?(:god)
        '/admin'
      else
        '/'
      end
  end

  def after_sign_out_path_for(_resource)
    '/'
  end

  def frontpage
    last_revealed = Year.where(reveal_decisions: true).order(year: :desc).first.year
    if @site == 'supermarket2014'
      @front_carousel = Frontcarousel.by_subsite(@subsite).published.order('RANDOM()').limit(8)
      if Time.now.year == last_revealed
        @random_exhibitors = Application.includes(%i[year applicationwebimages]).approved.where(year_id: Year.find_by(year: Time.now.year).id).where("applicationwebimages.id is not null and applicationwebimages.imagefile not LIKE '%pdf' and applicationwebimages.imagefile not LIKE '%tiff'").order('RANDOM()').limit(4)
      else
        @last_year = last_revealed
        @random_exhibitors = Application.includes(%i[year applicationwebimages]).approved.where(year_id: Year.find_by(year: last_revealed).id).where("applicationwebimages.id is not null and applicationwebimages.imagefile not LIKE '%pdf' and applicationwebimages.imagefile not LIKE '%tiff'").order('RANDOM()').limit(4)
      end
      @posts = Post.by_subsite(@subsite).published.order('published_at DESC').limit(3)
      @video = Video.published.order('created_at DESC').first
      @social_media = Cash.where(source: 'instagram').order(issued_at: :desc).limit(5)
      @tweets = Cash.where(source: 'twitter').order(issued_at: :desc).limit(5)
    elsif @site == 'aim'
      render file: 'static/index.html', layout: false
      # redirect_to map_spaces_path
    end
  end

  def get_from_filter_or
    out = []
    my_scope ||= {}
    session[:filter_scope].each do |f|
      if f.first == 'search'
        session[:filter_scope]['search'].uniq!
        f.last.uniq.each do |a|
          case a['search_type']
          when 'activities'
            out +=  Space.fuzzy_search(a['search_term']).to_a.delete_if { |x| !x.approved }
          when 'name'
            out +=  Space.fuzzy_search(a['search_term']).to_a.delete_if { |x| !x.approved }
          when 'location'
            out = Country.find_by_name(a['search_term'])
            unless country.nil?
              out += Space.where('country = ? OR visiting_country = ?', country.first, country.first).to_a
            end
          else
            out += Space.fuzzy_search(a['search_term']).to_a.delete_if { |x| !x.approved }
          end
        end
      else
        session[:filter_scope].delete(f.first) if f.last.blank?

        my_scope['by_' + f.first] = f.last
        my_scope.each do |ms|
          out << Space.send(ms.first, ms.last)
        end
      end
    end

    out.flatten.uniq
  end

  # def render(*args)
  #   if @site == 'aim'
  #     unless @nofilters == true
  #       @filters_businesstype = Businesstype.all
  #       @filters_organisationtype = Organisationtype.all
  #       @tree = Space.approved.to_a.delete_if { |x| x.country.blank? && x.visiting_country.blank? }.group_by { |x| Country[(x.visiting_country.blank? ? x.country.downcase : x.visiting_country.downcase)].region }
  #       @tree.each do |region|
  #         @tree[region.first] = region.last.group_by { |x| Country[(x.visiting_country.blank? ? x.country.downcase : x.visiting_country.downcase)].subregion }
  #         @tree[region.first].each do |subregion|
  #           @tree[region.first][subregion.first] = subregion.last.group_by { |x| x.country.downcase }
  #         end
  #       end
  #     end
  #   end
  #   super
  # end

  def get_locale
    session[:locale] = params[:locale] if params[:locale]

    if session[:locale].blank?
      available = %w[en et ru]
      I18n.locale = http_accept_language.compatible_language_from(available)
    else
      I18n.locale = session[:locale]
    end
  end

  def get_site
    @site = request.host =~ /artistrunmap/ || request.host =~ /artistsinitiatives/ ? 'aim' : 'supermarket2014'

    @subsite = Subsite.where(name: @site).first
    unless @site == 'aim'
      @promoted_posts = Post.by_subsite(@subsite.id).published.promoted
      @promoted_posts += Page.includes(:subsites).by_subsite(@subsite.id).published.promoted
      @promoted_posts.compact!
      if @background_image.nil?
        @background_image = Background.published.order('RANDOM()')
      end
      @site_year = Year.all.sort_by(&:year).reverse.first
    end

    if @site == 'aim' && request.path =~ %r{^/spaces}
      authenticate_or_request_with_http_basic('Work in progress') do |username, password|
        username == 'trouble' && password == 'desire'
      end
    end

    if Rails.env.staging?
      authenticate_or_request_with_http_basic('Work in progress') do |username, password|
        username == 'trouble' && password == 'desire'
      end
    end

    @site
  end

  protected

  # def devise_parameter_sanitizer
  #   if resource_class == User
  #     User::ParameterSanitizer.new(User, :user, params)
  #   else
  #     super
  #   end
  # end
  #

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_token, :remember_created_at, :sign_in_count) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:display_name, :photo, :email, :password, :password_confirmation, :current_password) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :display_name, :password_confirmation) }
  end
end
