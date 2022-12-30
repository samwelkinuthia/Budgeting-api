Rails.application.routes.draw do
  resources :fiscal_years
  resources :counties
  # mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  #   sessions:  'overrides/sessions'
  # }
  mount_devise_token_auth_for 'User', at: 'auth'
end
