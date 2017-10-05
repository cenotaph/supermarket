Aim::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :spaces do
    # resources :build, controller: 'spaces/build'
    get :request_access
    get :autocomplete_space_business_name, :on => :collection
    get :select_existing, :on => :member
    get :grant_access, :on => :member
    get :finish, :on => :collection
    get :browse, :on => :collection
    get :clear_filters, :on => :collection
    get :map, :on => :collection
    get :interested_2016, on: :member
  end
    # 
  # resources :users do
  #   get :my_organisations, :on => :collection
  # end
  match '/preview/:id' => 'attendees#preview', via: :get
  match '/support' => "funders#index", :via => :get
  match '/support/:id/' => "funders#index" , via: :get
  match '/search' => 'search#create', :via => :post
  match '/pnp/new/:year_id' => "pnps#new", via: :get
  match '/aiming/search' => 'search#aimsearch', via: :post
  match '/aiming/unsearch/:search_type/:search_term' => 'search#unsearch', via: :get
  match '/tv' => 'videos#index', via: :get
  match '/tv/:year' => 'videos#index', via: :get
  get '/auth/failure' => 'sessions#failure'
  get '/admin/attendees/:year' => 'admin/attendees#year'
  get '/performance/:year' => 'performanceapplications#new', year: :year
  match 'auth/:provider/callback' => 'authentications#create', :via => :get
  match '/oauth/authenticate' => 'authentications#create', :via => :get
  resources :authentications
  resources :attendees
  resources :pnps
  # devise_for :users, ActiveAdmin::Devise.config.merge({ :controllers => ActiveAdmin::Devise.config[:controllers].merge(:registrations => 'registrations', :passwords => 'devise/passwords', :sessions => 'sessions') }).merge(:path => '/') do
  devise_for :users, :controllers => {:registrations => 'registrations', :passwords => 'devise/passwords', :sessions => 'sessions'} do
    resources :spaces do
      get :request_access
    end
  end

  # ActiveAdmin.routes(self)
  themes_for_rails

  get '/user', to: 'users#profile'
  root 'application#frontpage'
  get '/apply/2018/:space_id', to: 'applications#new', :year => 2018
  get '/apply/2018', to: 'applications#applylanding'
  get '/invited', to: 'applications#invited'
  post '/invited', to: 'applications#check_invited'
  get '/invited/2018/:space_id', to: 'applications#allow_late', :year => 2018
  get '/admin', to: 'admin/dashboard#index', as: :admin_dashboard
  get '/exhibitors/:year', to: 'exhibitors#year'
  get '/pnp', to: 'pnps#index'
  get '/press', to: 'pressreleases#index'
  get '/browse', to: "spaces#browse"
  get '/filter_by/:filter_type/:value', to: "spaces#add_to_scope"
  get '/initiatives/:id', to: "spaces#aim_profile", as: 'initiatives'
  get '/exhibitor/:id', to: "spaces#show_history", as: 'supermarket_history'
  get '/exhibitor/:space/:year', to: "exhibitors#show", as: 'exhibitor_year'

  resources :pages
  resources :performanceapplications
  resources :posts
  resources :applications do
    collection do
      get :interested_2016
    end
    member do
      get :terms
      get :notify_of_decision
      post :accept_terms
    end
  end
  resources :pressreleases
  resources :presslinks
  
  namespace :admin do
    resources :activities
    resources :applications do
      member do
        post :comment
        get :toggle_late
        
      end
    end
    resources :pnps
    resources :attendees do
      member do
        get :checkin
        get :toggle_vip
      end
      collection do
        get :import
        post :process_import
        get :checklist
      end
    end
    resources :backgrounds
    resources :businesstypes

    resources :dashboard
    resources :exhibitionspacetypes
    resources :frontcarousels
    resources :funders
    resources :fundertypes
    resources :internallinks
    resources :organisationtypes
    resources :pages
    resources :performanceapplications do
      member do
        post :comment
      end
    end
    resources :posts
    resources :presslinks
    resources :pressreleases
    resources :users do
      get :autocomplete_user_email, :on => :collection
      collection do
        get :autocomplete_user_display_name
        post :filter_name
      end
    end
    resources :menus do
      collection do 
        post :sort
      end
      member do
        get :reorder
      end
    end
    resources :spaces do
      member do
        post :comment

        post :approve
        post :unapprove
        get :space_application
      end
      collection do
        get :denied
        post :filter_name
      end
    end
    resources :search do
      post :aimsearch
    end
    resources :subsites
    resources :videos
    resources :years
  end
  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
