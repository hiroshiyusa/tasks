Rails.application.routes.draw do
  resources :tasks do
    resources :comments

  end

  resources :users
end
