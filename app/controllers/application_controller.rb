class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ThemesForRails::ActionController 
  protect_from_forgery with: :null_session
  before_filter :get_site
  before_filter :get_locale
  before_filter :configure_permitted_parameters, if: :devise_controller?
  theme :get_site

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.has_role?(:staff) || resource.has_role?(:god)
        '/admin'
      else
        '/'
      end
  end
  
  def after_sign_out_path_for(resource)
    '/'
  end
    
  def frontpage
    if @site =='supermarket2014'
      @front_carousel = Frontcarousel.by_subsite(@subsite).published.random(8)
      @random_exhibitors =  Application.includes(:applicationwebimages).approved.where(:year_id => Year.find_by(:year => Time.now.year).id).where("applicationwebimages.id is not null and applicationwebimages.imagefile not LIKE '%pdf' and applicationwebimages.imagefile not LIKE '%tiff'" ).random(4)
      @posts = Post.by_subsite(@subsite).published.order('published_at DESC').limit(3)
      @video = Video.published.order('created_at DESC').first
    elsif @site == 'aim'
      redirect_to map_spaces_path
    end
  end
  


  def get_locale 
    if params[:locale]
      session[:locale] = params[:locale]
    end
    
    if session[:locale].blank?
      available  = %w{en et ru}
      I18n.locale = http_accept_language.compatible_language_from(available)
    else
      I18n.locale = session[:locale]
    end
  end
  
  def get_site
    @site = request.host =~ /^aim/ ? 'aim' : 'supermarket2014'
    if @site == 'aim'
      @tree = Space.approved.delete_if{|x| x.country.blank? && x.visiting_country.blank? }.group_by{|x|  Country[(x.visiting_country.blank? ? x.country.downcase : x.visiting_country.downcase)].region}
      @tree.each do |region|
        @tree[region.first] = region.last.group_by{|x| Country[(x.visiting_country.blank? ? x.country.downcase : x.visiting_country.downcase)].subregion}
        @tree[region.first].each do |subregion|
          @tree[region.first][subregion.first] = subregion.last.group_by{|x| x.country.downcase}
        end
      end
    end
    @subsite = Subsite.where(:name => @site).first
    @promoted_posts = Post.by_subsite(@subsite.id).published.promoted
    @promoted_posts += Page.includes(:subsites).by_subsite(@subsite.id).published.promoted
    @promoted_posts.compact!
    if @background_image.nil? 
      @background_image = Background.published.random
    end
    #
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
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_token, :remember_created_at, :sign_in_count) }
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:display_name, :photo, :email, :password, :password_confirmation, :current_password) }    
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :display_name, :password_confirmation) }
  end
  
end
