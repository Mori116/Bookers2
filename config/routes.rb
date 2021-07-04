Rails.application.routes.draw do

devise_for :users
# deviseは先頭に記述しておいたほうがよい。エラーの原因になることがある

root to: 'homes#top'
get 'home/about' => "homes#about", as: 'homes_about'

resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  # いいね、コメント機能
end

resources :users, only: [:index, :show, :edit, :update] do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  # フォロー/フォロワー機能
  get "search", to: "users#search"
  # 指定日の投稿数検索
end

get '/search', to: 'search#search'
# Book,Userの検索

resources :messages, only: [:create]
resources :rooms, only: [:create, :show]
# DM機能

resources :groups do
  get 'join' => 'groups#join'
  # get 'join_check' => 'groups#join_check'
end
# get 'create_group', to: 'groups#create_group'　→ newアクションで利用可能
# グループ機能とグループ参加機能

resources :orders, only: [:index, :new, :create, :show] do
	collection do
		get 'confirm'
		get 'complete'
	end
end

end