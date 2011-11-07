AiBrandawareness::Application.routes.draw do
  resources :brands
  root :to => 'brands#new'
end
