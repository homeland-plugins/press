Homeland::Press::Engine.routes.draw do
  resources :posts do
    collection do
      get :upcoming
      post :preview
    end
    member do
      put :publish
    end
  end
  namespace :admin do
    resources :posts
  end
end
