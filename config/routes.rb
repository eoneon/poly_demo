Rails.application.routes.draw do
  resources :elements
  resources :sub_elements

  root to: 'elements#index'
end
