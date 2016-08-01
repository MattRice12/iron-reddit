Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'

  post '/sign_up' => 'clearance/users#new', as: 'sign_up'

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]

  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, controller: 'clearance/users', only: Clearance.configuration.user_actions do
    resource :password, controller: 'clearance/passwords', only: [:create, :edit, :update]
  end

  resources :comments do
    post 'comment_upvote' => "comment#comment_upvote", on: :member
    post 'comment_downvote' => "comment#comment_downvote", on: :member
  end

  resources :users,
  controller: 'clearance/users' do
    post 'upvote' => "links#upvote", on: :member
    post 'downvote' => "links#downvote", on: :member
    post 'comment_upvote' => "comments#comment_upvote"
    post 'comment_downvote' => "comments#comment_downvote"
  end

  resources :links do
    post 'upvote' => "links#upvote", on: :member
    post 'downvote' => "links#downvote", on: :member
  end

  resources :boards, path: '/r/', param: :name
  resources :downvotes
  resources :upvotes
  resources :comment_downvotes
  resources :comment_upvotes

  root 'links#index'
end
