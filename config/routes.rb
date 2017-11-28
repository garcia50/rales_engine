Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :invoices, only: [:index, :show]
      resources :merchants, only: [:index]
    end
  end
end
