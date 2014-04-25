Rails.application.routes.draw do
  root :to => "sessions#new"
  resources :users
  resources :sessions
  get "/login" => "sessions#new", :as => "login"
  get "/logout" => "sessions#destroy", :as => "logout"

  scope :api do
    scope :v1 do
      resources :auth_tokens, :only => [:create], :controller => "api/v1/auth_tokens"
      get "/users/me" => "api/v1/users#me"
    end
  end
end
