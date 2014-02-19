Emtrack::Engine.routes.draw do
  resources :clinical_history
  resources :visits do
    resources :history_of_present_illness
  end
end
