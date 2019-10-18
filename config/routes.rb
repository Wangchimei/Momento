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

  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show]
end
