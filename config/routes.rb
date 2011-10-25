CantangoEditor::Engine.routes.draw do
  resources :permissions do
    collection do
      get :new_target
      get :preview_raw
      post :update
    end
  end
end
