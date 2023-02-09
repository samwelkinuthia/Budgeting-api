Rails.application.routes.draw do
  get 'reports', to: 'reports#index'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'usertypes', to: 'users#types'
  put 'users/:id', to: 'users#update'
  post 'county_budgets/:countyId/:fiscalYearId', to: "county_budgets#create"
  resources :revenue_sources
  resources :fiscal_years
  resources :counties do
    resources :county_budgets
    resources :departments do
      post 'import', to: 'projects#import'
      resources :projects
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions:  'overrides/sessions',
  }
  # mount_devise_token_auth_for 'User', at: 'auth'
end
