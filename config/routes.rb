Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  root 'site#index'
  get 'dashboard', to: 'dashboard#index', as: :dashboard_index_path

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        confirmations:      'devise_token_auth/confirmations',
        passwords:          'devise_token_auth/passwords',
        omniauth_callbacks: 'api/v1/auth/omniauth_callbacks',
        registrations:      'api/v1/auth/registrations',
        sessions:           'api/v1/auth/sessions',
        token_validations:  'devise_token_auth/token_validations'
      }
      resources :specialities, only: %i[index show]
      resources :medical_facilities, only: %i[index show], path: 'medical-facilities'
      resources :hcfs, only: %i[index show]
      resources :hcps, only: %i[index show]
      resources :schedules, path: 'schedules', only: [] do
        get '' => 'schedules#index', on: :collection
        get 'date' => 'schedules#date', on: :collection
        get ':id' => 'schedules#show', on: :collection
      end
      resources :consultations, only: %i[index show create]
    end
  end

  # devise_for :users, :path_prefix => 'api/v1'
end
