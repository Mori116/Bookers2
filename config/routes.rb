Rails.application.routes.draw do

devise_for :users
# deviseは先頭に記述しておいたほうがよい。エラーの原因になることがある

root to: 'homes#top'
get 'home/about' => "homes#about", as: 'homes_about'

resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
end

resources :users, only: [:index, :show, :edit, :update] do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
end

get '/search', to: 'search#search'

resources :messages, only: [:create]
resources :rooms, only: [:create, :show]

end