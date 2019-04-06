Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :families do
        get '/:id/stories', to: 'stories#index'
      end  
      resources :families, only: [:index, :show]
    end
  end
end
