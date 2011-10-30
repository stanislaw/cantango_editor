CantangoEditor::Engine.routes.draw do
  resources :permissions do
    collection do
      get :notes
      get :new_target
      get :new_custom_target
      get :new_category
      get :preview_raw
      post :update
    end
  end
end
