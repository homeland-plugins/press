Homeland::Press::Engine.routes.draw do
  resources :posts, path: '' do
    collection do
      get :upcoming
      post :preview
    end
  end
end
