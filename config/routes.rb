Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surveys do 
    collection do
      post :PDF
      get :PDF
    end
  end
end
