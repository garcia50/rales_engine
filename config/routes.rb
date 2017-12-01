Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :merchants do
        get "/find",                               to: "find#show"
        get "/find_all",                           to: "find#index"
        get "/revenue",                            to: "revenue#show"
        get '/most_revenue',                       to: 'most_revenue#index'
        get "/:id/items",                          to: 'items#index'
        get "/:id/invoices",                       to: 'invoices#index'
        get "/:id/revenue",                        to: 'revenue#index'
        get "/most_items",                         to: 'most_items#index'
        get "/:id/favorite_customer",              to: 'customers#show'
        get ':id/customers_with_pending_invoices', to: 'customers#index'
      end

      namespace :customers do
        get "/find",                  to: "find#show"
        get "/find_all",              to: "find#index"
        get "/:id/invoices",          to: 'invoices#index'
        get "/:id/transactions",      to: 'transactions#index'
        get "/:id/favorite_merchant", to: 'favorite_merchant#show'
      end

      namespace :transactions do
        get "/find",        to: "find#show"
        get "/find_all",    to: "find#index"
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
        get "/find",              to: "find#show"
        get "/find_all",          to: "find#index"
        get "/random",            to: "random#show"
        get "/most_items",        to: "most_quantity#index"
        get "/most_revenue",      to: "most_revenue#index"
        get "/:id/invoice_items", to: 'invoice_items#index'
        get "/:id/merchant",      to: 'merchants#show'
        get "/:id/best_day",      to: 'best_day#show'
      end

      namespace :invoice_items do
        get "/find",        to: "find#show"
        get "/find_all",    to: "find#index"
        get "/random",      to: "random#show"
        get "/:id/invoice", to: 'invoices#show'
        get "/:id/item",    to: 'items#show'
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
