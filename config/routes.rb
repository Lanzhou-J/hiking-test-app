Rails.application.routes.draw do
  resources :trails, only: %i[index create destroy update]
end
