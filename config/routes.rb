Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :boards,
    except: %i[destroy] do
      resources :todos

  end

  root "boards#index"
end
