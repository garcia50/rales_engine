Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :invoices do
        get '/find', to: 'find#show'
      end
    end
  end
end
