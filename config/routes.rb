Rails.application.routes.draw do
  resources :surveys do 
    collection do
      get  :generate
      get  :pdf
    end
  end
end
