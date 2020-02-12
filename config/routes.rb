Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :users, only: [:show]
  resources :posts do
    resources :participates, only: [:create, :destroy]
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    #omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get "sign_up", to: "users/registrations#new" # 新規登録ページ
    get "edit", to: "users/registrations#edit" # プロフィール編集ページ
    get "login", to: "users/sessions#new" # ログインページ
    get "logout", to: "users/sessions#destroy" # ログアウト
    get "users/:id/password_edit", to: "users/passwords#edit" # パスワード変更ページ
  end
end
