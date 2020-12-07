Rails.application.routes.draw do
  resources :candidates
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }  

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :candidates do
    member do
      post "vote"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '*path' => redirect("/")
end
