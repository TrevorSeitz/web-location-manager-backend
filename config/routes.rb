Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'places#index'

  scope :api do
    # resources :places, only: [:index, :new, :create]
    resources :places, :photos
  end

end
