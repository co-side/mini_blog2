Rails.application.routes.draw do
  # HACK: registrationsコントローラのcancelとdestroyは利用していない
  devise_for :user, only: %i[sessions registrations]
  resources :tweets, except: %i[edit update index] do
    member do
      post :like
      delete :unlike
    end
  end
  resources :users, only: :show do
    member do
      post :follow
      delete :unfollow
    end
  end
  root 'tweets#index'
end
