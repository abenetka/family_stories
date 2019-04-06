Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :families do
        get "/:id/recipes", to: 'recipes#index'
      end
      resources :families, only: [:index, :show]
    end
  end
end
