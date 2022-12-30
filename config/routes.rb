Rails.application.routes.draw do
  post 'county_budgets/:countyId/:fiscalYearId', to: "county_budgets#create"
  resources :county_budgets
  resources :revenue_sources
  resources :fiscal_years
  resources :counties
  # mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  #   sessions:  'overrides/sessions'
  # }
  mount_devise_token_auth_for 'User', at: 'auth'
end
