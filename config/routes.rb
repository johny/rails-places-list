Local::Application.routes.draw do

  root 'static#index'

  namespace :admin do
    resources :cities
  end

end
