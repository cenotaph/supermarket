Aim::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :spaces do
    # resources :build, controller: 'spaces/build'
    get :autocomplete_space_business_name, :on => :collection
    get :select_existing, :on => :member
    get :grant_access, :on => :member
    get :finish, :on => :collection
  end
  
  devise_for :users, ActiveAdmin::Devise.config.merge({ :controllers => ActiveAdmin::Devise.config[:controllers].merge(:registrations => 'registrations', :passwords => 'devise/passwords', :sessions => 'sessions') }).merge(:path => '/') do
      
    resources :spaces do
      get :request_access
    end
  end

  ActiveAdmin.routes(self)
  themes_for_rails

  
  root 'application#frontpage'
  get '/apply/2014/:space_id', to: 'applications#new', :year => 2014

  resources :pages
  resources :applications

  
  namespace :admin do
    resources :sites
  end
  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
