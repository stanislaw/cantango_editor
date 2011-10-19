CantangoEditor::Engine.routes.draw do
  resources :permissions do
    collection do
      get :by_models_index
      get :by_groups_index
    end
  end
end
