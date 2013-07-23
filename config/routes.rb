DyneMp::Application.routes.draw do

  root 'wx_mp_users#index'

  mount Ckeditor::Engine => "/ckeditor"
  # mount ExceptionLogger::Engine => "/exception_logger"
  # resources :logged_exceptions

  resources :sessions, :only => [:new, :create, :destroy, :secret]
  get 'sign_in' => 'sessions#new', :as => :sign_in
  get 'sign_out' => 'sessions#destroy', :as => :sign_out
  get 'secret' => 'sessions#secret'

  resources :activity_prizes, :activity_notices
  
  resources :activity_consumes do
    member do
      post :used
    end
  end

  resources :wx_relationships

  resources :questions do
    resources :answers
  end
  resources :answers

  resources :website_menus, :websites

  resources :vip_privileges, :vip_cards
  
  resources :vip_users do
    member do
      post :freeze
      post :normal
    end
  end

  resources :materials

  resources :activity_properties, :activity_types
  resources :activities do
    member do
      post :stop
      post :delete
    end
  end

  resources :districts, :cities, :provinces

  resources :supplier_categories, :suppliers

  resources :wx_mp_users, :wx_users
end
