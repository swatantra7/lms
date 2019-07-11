Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'librarians/books#index'
    end
  end

  root to: 'librarians/books#index'

  namespace :librarians do

    resources :books
    resources :book_sanctions, only: [:index, :new, :create]

  end

end
