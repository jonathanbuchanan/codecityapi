Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :courses, only: [:index]
    post 'enroll', on: :member
    post 'disenroll', on: :member
    post 'authenticate', on: :collection
  end

  resources :courses do
    resources :users, only: [:index]
    resources :lessons do
      resources :exercises
    end
  end
end
