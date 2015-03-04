Rails.application.routes.draw do
  resource :user_session
  root to: 'user_sessions#new'
end
