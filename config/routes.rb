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
  get 'calendars' => 'calendars#index'



  scope :api do
    resources :users, defaults: { format: :json}

    resources :events do
      resources :messages
    end
  end
end
