Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :families do
        get '/:id/stories', to: 'stories#index'
        post '/:id/stories', to: 'stories#create'
        get "/:id/recipes", to: 'recipes#index'
        get "/:id/recipes/:id", to: 'recipes#show'
        post "/:id/recipes", to: 'recipes#create'
        delete "/:id/recipes/:id", to: 'recipes#destroy'
        get "/:id/photos", to: 'photos#index'
        get "/:id/family_members", to: 'family_members#index'
      end

      resources :families, only: [:index, :show, :create]
    end
  end
end
