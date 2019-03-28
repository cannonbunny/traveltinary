Rails.application.routes.draw do

  devise_for :users
  resources :places do
    resources :reviews
    member do
      put "upvote", to: "places#upvote"
      put "downvote", to: "places#downvote"
    end
  end
  root 'places#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
