Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :merchants do
        get "/:id/items", to: 'items#index'
      end

      resources :invoices,        only: [:index, :show]
      resources :merchants,       only: [:index, :show]
      resources :items,           only: [:index, :show]
      resources :transactions,    only: [:index, :show]
      resources :invoice_items,   only: [:index, :show]
      resources :customers,       only: [:index, :show]
    end
  end
end
