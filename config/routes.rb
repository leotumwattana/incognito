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

  scope :api, defaults: { format: :json} do
    # resources :users, except: ['new', 'edit']
    resources :events, except: ['edit'] do
      resources :messages #except: ['edit', 'update']
    end
  end
end
