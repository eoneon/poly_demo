Rails.application.routes.draw do
  resources :elements
  resources :edition_types, controller: "elements", type: "EditionType"
  resources :medium_types, controller: "elements", type: "MediumType"
  resources :sub_elements

  root to: 'elements#index'
end
