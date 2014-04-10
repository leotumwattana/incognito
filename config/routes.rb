Incognito::Application.routes.draw do

  root 'users#index'


  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  get 'reset/:code' => 'password#edit', as: :reset
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'


  scope :api do
    resources :users, except: ['new', 'edit']
  end

end
