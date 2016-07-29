Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :comments do
    post 'comment_upvote' => "comment#comment_upvote", on: :member
    post 'comment_downvote' => "comment#comment_downvote", on: :member
  end
  resources :users do
    post 'upvote' => "links#upvote", on: :member
    post 'downvote' => "links#downvote", on: :member
    post 'comment_upvote' => "comments#comment_upvote"
    post 'comment_downvote' => "comments#comment_downvote"
  end

  resources :links do
    post 'upvote' => "links#upvote", on: :member
    post 'downvote' => "links#downvote", on: :member
  end

  resources :boards
  resources :downvotes
  resources :upvotes
  resources :comment_downvotes
  resources :comment_upvotes

  root 'boards#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
