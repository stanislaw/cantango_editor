Rails.application.routes.draw do

  resources :bones do
    collection do
      post :update
    end
  end
  devise_for :users

  get "main/index"

  mount CantangoEditor::Engine => "/cantango_editor"
  
  root :to => "main#index"
end
