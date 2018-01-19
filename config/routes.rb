Rails.application.routes.draw do


  root "home#index"

  get 'cities/:state', to: 'application#cities'

  post '/users/:id/follow' => "followings#follow"
  post '/users/:id/unfollow' => "followings#unfollow"



  # Clearance Default Routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :index, :show, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :events
    resources :messages
  end

  resources  :organizatons do
    resources :events do
      resources :badges, only: [:new, :create, :delete]
    end
    resources :messages
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
