Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :families do
        get '/:id/stories', to: 'stories#index'
        get "/:id/recipes", to: 'recipes#index'
        get "/:id/photos", to: 'photos#index'
        get "/:id/family_members", to: 'family_members#index'
      end

      resources :families, only: [:index, :show]
    end
  end
end
