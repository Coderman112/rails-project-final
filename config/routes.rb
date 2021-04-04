Rails.application.routes.draw do
  resources :users, except: [:show, :index, :new, :create, :destroy, :patch, :put] do
    resources(:games, except: [:show, :edit, :update, :destroy, :put])
  end

  resources(:games, except: [:put, :edit, :patch, :destroy, :update]) do
    resources :measurements, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
