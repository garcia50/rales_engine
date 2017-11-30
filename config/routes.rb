Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :merchants do
        get "/:id/items",    to: 'items#index'
        get "/:id/invoices", to: 'invoices#index'
      end

      namespace :customers do
        get "/:id/invoices",     to: 'invoices#index'
        get "/:id/transactions", to: 'transactions#index'
      end

      namespace :transactions do
        get '/:id/invoice', to: 'invoices#index'
      end

      namespace :invoices do
        get "/find",              to: "find#show"
        get "/find_all",          to: "find#index"
        get "random",             to: "random#show"
        get "/:id/invoice_items", to: 'invoice_items#index'
        get "/:id/transactions",  to: 'transactions#index'
        get "/:id/items",         to: 'items#index'
        get "/:id/customer",      to: 'customers#index'
        get "/:id/merchant",      to: 'merchants#index'
      end

      namespace :items do
        get "/find",     to: "find#show"
        get "/find_all", to: "find#index"
        get "/random",   to: "random#show"
      end

      namespace :invoice_items do
        get "/find",     to: "find#show"
        get "/find_all", to: "find#index"
        get "/random",   to: "random#show"
      end

      resources :invoices,      only: [:index, :show]
      resources :merchants,     only: [:index, :show]
      resources :items,         only: [:index, :show]
      resources :transactions,  only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :customers,     only: [:index, :show]
    end
  end
end
