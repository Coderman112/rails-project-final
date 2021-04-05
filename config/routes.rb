Rails.application.routes.draw do
  resources :users, except: [:show, :index, :new, :create, :destroy, :patch, :put] do
    resources(:games, except: [:show, :edit, :update, :destroy, :put])
  end

  resources(:games, except: [:put, :edit, :patch, :destroy, :update]) do
    resources :ratings, only: [:new, :create]
  end

  resources :ratings, only: [:new, :create, :index, :update]

  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get "/auth/facebook", to: "sessions#create_with_fb"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
