Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'feeds#home'

  resources :feeds do
    collection do
      post :confirm
    end
  end

  resources :feeds do
    resources :comments
  end

  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:index, :show]
  resources :favorites, only: [:create, :show, :destroy]
end
