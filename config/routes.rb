Incognito::Application.routes.draw do

  root 'events#index'

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  get 'reset/:code' => 'password#edit', as: :reset
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  #register
  get 'registration' => 'registration#new'
  post 'registration' => 'registration#create'

  #calendar
  get 'calendars' => 'calendars#show'

  # get 'calendars' => 'calendars#index'

  # get 'messages' => 'messages#index'

  get 'summary' => 'summary#show'

  scope :api, defaults: { format: :json} do

    resources :users do
      resources :events, only: [ 'index', 'create', 'destroy', 'show']
    end

    resources :events  do
      resources :messages, only: [ 'index', 'create' ]
    end
  end
end
