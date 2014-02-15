Local::Application.routes.draw do



  root 'cities#index'

  resources :cities, path: "/", only: [:index] do
    resources :places, only: [:index, :show], path: "salony-fryzjerskie"
  end

  namespace :admin do
    resources :cities
    resources :places
  end

end
