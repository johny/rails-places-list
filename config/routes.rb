Local::Application.routes.draw do




  root 'cities#index'

  resources :cities, path: "/", only: [:index] do
    resources :places, only: [:index, :show], path: 'salony'
  end

  resources :places, only: [], path: 'salony' do
    resources :corrections, path: 'poprawki', only: [:new, :create], path_names: {new: 'nowa'}
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

      resources :corrections

    end

    resources :corrections

  end

end
