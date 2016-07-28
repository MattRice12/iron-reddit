Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :votes
  resources :links do
    post 'vote' => "links#vote", on: :member
  end

  root 'links#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
