class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ThemesForRails::ActionController 
  protect_from_forgery with: :exception
  before_filter :get_site
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
        admin_dashboard_path
      else
        '/'
      end
  end
  
  def after_sign_out_path_for(resource)
    '/'
  end
    
  def frontpage
    @front_carousel = Frontcarousel.by_subsite(@subsite).published.random(8)
  end
  
  def get_site
    @site = request.host =~ /^aim/ ? 'aim' : 'supermarket2014'
    if @site == 'aim'
      @tree = Space.approved.delete_if{|x| x.country.blank? }.group_by{|x| Country[x.country].region}
      @tree.each do |region|
        @tree[region.first] = region.last.group_by{|x| Country[x.country].subregion}
        @tree[region.first].each do |subregion|
          @tree[region.first][subregion.first] = subregion.last.group_by{|x| x.country}
        end
      end
    end
    @subsite = Subsite.where(:name => @site).first
    @promoted_posts = Post.by_subsite(@subsite.id).published.promoted
    @promoted_posts += Page.by_subsite(@subsite.id).published.promoted
    @promoted_posts.compact!
    @allfunders = Fundertype.all.delete_if{|x| x.funders.empty? }
    @site
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_token, :remember_created_at, :sign_in_count) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :display_name, :password_confirmation) }
  end
  
end
