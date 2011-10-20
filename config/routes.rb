CantangoEditor::Engine.routes.draw do
  resources :permissions do
    collection do
      get :by_models_index
      get :by_groups_index
      get :new_target
      get :preview_raw
    end
  end
end
