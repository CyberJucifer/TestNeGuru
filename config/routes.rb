Rails.application.routes.draw do

  devise_for :users, path: :negurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "users/sessions"}

  root 'tests#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end

  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end

end
