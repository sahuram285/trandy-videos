Rails.application.routes.draw do

  root 'videos#index'

  get 'dashboard/home'
  get '/my_videos', to: 'videos#my_videos', as: 'my_videos'

  devise_for :users

  resources :videos

end
