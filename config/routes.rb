Rails.application.routes.draw do
  resources :items
  resources :elements
  resources :edition_types, controller: "elements", type: "EditionType"
  resources :medium_types, controller: "elements", type: "MediumType"
  resources :sub_elements
  resources :element_fields
  resources :field_values

  resources :elements do
    collection do
      post :import
    end
  end

  resources :sub_elements do
    collection do
      post :import
    end
  end

  resources :element_fields do
    collection do
      post :import
    end
  end

  resources :field_values do
    collection do
      post :import
    end
  end

  root to: 'elements_path#index'
end
