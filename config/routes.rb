Local::Application.routes.draw do



  root 'cities#index'

  resources :cities, path: "/", only: [:index] do
    resources :places, only: [:index, :show], path: "salony-fryzjerskie"
  end

  namespace :admin do
    resources :cities do
      member do
        patch :disable
        patch :enable
      end
    end
    resources :places do
      member do
        patch :disable
        patch :enable
      end
    end
  end

end
