Rails.application.routes.draw do
  resources :contacts
  get 'sessions/new'

  get '/', to:'blogs#index'
  resources :blogs do
    collection do
      post :confirm
   end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy]
  get '/sessions',to:'sessions#new'
if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
end
