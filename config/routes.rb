Rails.application.routes.draw do

devise_for :users
# deviseは先頭に記述しておいたほうがよい。エラーの原因になることがある
root to: 'homes#top'
get 'homes/about'

resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
resources :users, only: [:index, :show, :edit, :update]

end