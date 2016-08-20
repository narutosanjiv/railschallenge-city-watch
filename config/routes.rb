Rails.application.routes.draw do
  resources :emergencies, except: [:new, :edit, :delete]
end
