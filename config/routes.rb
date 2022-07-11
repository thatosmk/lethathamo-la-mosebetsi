Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :boards,
    except: %i[destroy] do
      resources :lists,
        shallow: true do
          resources :tasks, path: 'cards', shallow: true
      end
  end

  root "boards#index"
end
