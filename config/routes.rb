Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    #omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get "users/:id", :to => "users/registrations#show"
    get "sign_up", :to => "users/registrations#new"
    get "users/:id/edit", :to => "users/registrations#edit"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get "users/:id/password_edit", :to => "users/passwords#edit"
  end
  root to: 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
