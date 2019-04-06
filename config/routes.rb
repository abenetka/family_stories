Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :families do
        get '/:id/stories', to: 'stories#index'
        post '/:id/stories', to: 'stories#create'
        get "/:id/recipes", to: 'recipes#index'
        get "/:id/photos", to: 'photos#index'
      end

      resources :families, only: [:index, :show]
    end
  end
end
