Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'places#index'
  post 'uploader/image', to: 'uploader#image'
  # patch 'api/places/:id', to: 'places#update'

  scope :api do
    # resources :places, only: [:index, :new, :create]
    resources :places, :images
  end

end
