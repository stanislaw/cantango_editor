Rails.application.routes.draw do

  devise_for :users

  get "main/index"

  mount CantangoEditor::Engine => "/cantango_editor"
  
  root :to => "main#index"
end
