Rails.application.routes.draw do
  resources :surveys do 
    collection do
      post :pdf
      get :pdf
    end
  end
end
