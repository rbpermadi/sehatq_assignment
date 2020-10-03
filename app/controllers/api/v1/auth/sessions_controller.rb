module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController
        skip_before_action :verify_authenticity_token

        private 

        def render_create_success
          render_serializable(@resource, ::AuthSerializer, status: 200)
        end

        def render_create_error_bad_credentials
          render_serializable_error(I18n.t('devise_token_auth.sessions.bad_credentials'), status: 401)
        end
      end
    end
  end
end