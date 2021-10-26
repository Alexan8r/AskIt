# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :tags, only: :index
  end

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resources :users, only: %i[new create destroy edit update]

    resources :tags, only: :create

    resource :session, only: %i[new create destroy]

    resources :questions do
      resources :answers, except: %i[new show]
      resources :comments, only: %i[create destroy]
    end

    resources :answers, except: %i[new show] do
      resources :comments, only: %i[create destroy]
    end

    namespace :admin do
      resources :users, only: %i[index create edit update destroy]
    end

    root 'pages#index'
  end
end
