Rails.application.routes.draw do
  resources :surveys do 
    collection do
      get :pdf
    end
  end
end
