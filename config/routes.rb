Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "user/sessions" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'pages#home'

  get 'about' => 'pages#about', as: :about

  get '/auth/:provider/callback' => 'evernote_auth#callback'

  namespace :user do
    resources :account, only: [:show]
    resources :dashboard, only: [:show]
  end

  resources :user, only: [] do
    resources :kindle_books, only: [:show]
    resources :kindle_raw_clippings, except: [:edit, :update]
    resources :text_export, only: [:index]
  end

end
