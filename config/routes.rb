Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        confirmations:      'devise_token_auth/confirmations',
        passwords:          'devise_token_auth/passwords',
        omniauth_callbacks: 'devise_token_auth/omniauth_callbacks',
        registrations:      'api/v1/auth/registrations',
        sessions:           'api/v1/auth/sessions',
        token_validations:  'devise_token_auth/token_validations'
      }
    end
  end
end
