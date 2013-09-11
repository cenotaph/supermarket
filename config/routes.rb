Aim::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :spaces do
    # resources :build, controller: 'spaces/build'
    get :autocomplete_space_business_name, :on => :collection
    get :select_existing, :on => :member
    get :grant_access, :on => :member
    get :finish, :on => :collection
  end
  
  match '/support' => "funders#index", :via => :get
  match '/search' => 'search#index', :via => :post
  
  # devise_for :users, ActiveAdmin::Devise.config.merge({ :controllers => ActiveAdmin::Devise.config[:controllers].merge(:registrations => 'registrations', :passwords => 'devise/passwords', :sessions => 'sessions') }).merge(:path => '/') do
  devise_for :users, :controllers => {:registrations => 'registrations', :passwords => 'devise/passwords', :sessions => 'sessions'} do
    resources :spaces do
      get :request_access
    end
  end

  # ActiveAdmin.routes(self)
  themes_for_rails

  
  root 'application#frontpage'
  get '/apply/2014/:space_id', to: 'applications#new', :year => 2014
  get '/admin', to: 'admin/dashboard#index'
  resources :pages
  resources :posts
  resources :applications

  
  namespace :admin do
    resources :applications do
      member do
        post :comment
      end
    end
    resources :dashboard
    resources :pages
    resources :posts
    resources :users
    resources :menus
    resources :spaces
    resources :search
  end
  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
