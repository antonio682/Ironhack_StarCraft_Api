Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            resources :players do
                resources :matches
                get "/matches/:faction" => 'matches#show'
            end
        end
    end
end
