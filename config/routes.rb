Rails.application.routes.draw do

  root to: 'prompts#index'
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/draft", to: "prompts#draft"
end
