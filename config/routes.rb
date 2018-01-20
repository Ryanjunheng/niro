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
    resources :events do
      resources :event_messages
      resources :badges
      resources :participations
    end
    resources :chats
    resources :user_messages
    resources :testimonials, only:[:index, :show, :create, :edit, :update, :destroy]
  end

  resources  :organizations do
    resources :events do
      resources :badges
      resources :event_messages
      resources :participations
    end
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/users/:user_id/events/:event_id/participations/:id/complete" => "participations#complete", as: :complete_mission
  post "/users/:user_id/events/:event_id/participations/:id/fail" => "participations#fail", as: :fail_mission
  post "/organizations/:id/verify" => "organizations#verify", as: "verify_org"
  post "/users/:id/verify" => "users#verify", as: "verify_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
