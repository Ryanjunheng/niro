Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  get 'room/show'
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
    resource :rooms, only:[:show]
    resources :user_messages
    resources :testimonials, only:[:index, :show, :create, :edit, :update, :destroy]
  end

  resources  :organizations
    # resources :events, except: [:create] do
    #   resources :badges
    #   resources :event_messages
    #   resources :participations
    # end

  # Organizations related cutom routes to avoid clash with users
  get "/organizations/:id/events/new" => "events#org_new", as: :new_organization_event
  post "/organizations/:id/events" => "events#org_create", as: :create_organization_event
  get "/organizations/:organization_id/events/:id" => "events#org_show", as: :show_organization_event
  post "/organizations/:organization_id/events/:event_id/badges" => "badges#org_create", as: :organization_event_badges
  post "/organizations/:organization_id/events/:event_id/participations" => "participations#org_create", as: :organization_event_participations
  delete "/organizations/:organization_id/events/:event_id/participations" => "participations#org_destroy", as: :organization_event_participation

  post "/organizations/:organization_id/events/:event_id/event_messages" => "event_messages#org_create", as: :organization_event_messages
  put  "/organizations/:organization_id/events/:event_id/event_messages/:id" => "event_messages#org_update", as: :update_organization_event_message
  delete "/organizations/:organization_id/events/:event_id/event_messages/:id" => "event_messages#org_destroy", as: :delete_organization_event_message
  post "/organizations/:id/verify" => "organizations#verify", as: "verify_org"
  # end of organization routes

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post "/users/:user_id/events/:event_id/participations/:id/complete" => "participations#complete", as: :complete_mission
  post "/users/:user_id/events/:event_id/participations/:id/fail" => "participations#fail", as: :fail_mission
  post "/users/:id/verify" => "users#verify", as: "verify_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
