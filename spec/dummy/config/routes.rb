Rails.application.routes.draw do

  get "main/index"

  mount CantangoEditor::Engine => "/cantango_editor"
  
  root :to => "main#index"
end
