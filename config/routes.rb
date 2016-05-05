Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :companies, only: [:index, :show]
    end
  end
  
  # using params[:a], we can store the url path submitted by the client
  match '*a', :to => 'errors#routing', via: :all
end
