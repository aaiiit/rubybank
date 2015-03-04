Rails.application.routes.draw do
  resources :transactions

  resources :accounts, only: [:show]
  resource :user_session

  get 'login', :controller => 'user_sessions', :action => 'new'  
  get 'logout', :controller => 'user_sessions', :action => 'destroy'  

  root to: 'user_sessions#new'
end
