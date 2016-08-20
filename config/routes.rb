Rails.application.routes.draw do
  resources :emergencies, param: :code, except: [:new, :edit, :delete]
  resources :responders, param: :name
end
