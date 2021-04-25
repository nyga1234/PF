Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update, :follower, :followed] do
    resource :relationships, only: [:create, :destroy]
      get :follower, :followed
    end
  resources :figures, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :figure_comments, only: [:create, :destroy]
    get :search, on: :collection
  end
end
