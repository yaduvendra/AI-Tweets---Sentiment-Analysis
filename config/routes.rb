AiBrandawareness::Application.routes.draw do

  resources :sentiment_groups
  resources :brands do 
    get 'sentiments', :on => :member, :to => 'sentiments#index', :as => :sentiments
  end

  root :to => 'brands#new'
end
