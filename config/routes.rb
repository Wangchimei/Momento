Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'feeds#index'

  resources :feeds do
    collection do
      post :confirm
    end
  end

  devise_for :users
end
