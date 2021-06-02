Rails.application.routes.draw do

  get 'book_comments/create'
  get 'book_comments/destroy'
devise_for :users
# deviseは先頭に記述しておいたほうがよい。エラーの原因になることがある
root to: 'homes#top'
get 'home/about' => "homes#about", as: 'homes_about'

resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
end

resources :users, only: [:index, :show, :edit, :update]

end