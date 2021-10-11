Rails.application.routes.draw do


resources :questions do
  resources :answers, only: %i[create]
end
get '/questions', to: 'questions#create'
get  '/questions', to: 'questions#index'
get  '/questions/new', to: 'questions#new'
root 'pages#index'

end
