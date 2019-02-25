Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: [:edit, :update] do
    resources :comments
  end

end
