Rails.application.routes.draw do
  resources :monster_attacks
  resources :monster_elements
  resources :attacks
  resources :monsters
  resources :elements
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
