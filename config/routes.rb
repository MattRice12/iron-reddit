Rails.application.routes.draw do
  resources :comments
  resources :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :downvotes
  resources :upvotes
  resources :links do
    post 'upvote' => "links#upvote", on: :member
    post 'downvote' => "links#downvote", on: :member
  end

  root 'links#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
