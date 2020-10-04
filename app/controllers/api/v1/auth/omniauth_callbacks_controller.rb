module Api
  module V1
    module Auth
      class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
        def redirect_callbacks 
          devise_mapping = [request.env['omniauth.params']['namespace_name'],
                            request.env['omniauth.params']['resource_class'].underscore.gsub('/', '_')].compact.join('_')
          redirect_route = "#{request.protocol}#{request.host_with_port}/#{Devise.mappings[devise_mapping.to_sym].fullpath}/#{params[:provider]}/callback"

          # preserve omniauth info for success route. ignore 'extra' in twitter
          # auth response to avoid CookieOverflow.
          session['dta.omniauth.auth'] = request.env['omniauth.auth'].except('extra')
          session['dta.omniauth.params'] = request.env['omniauth.params']
          super
        end
      end
    end
  end
end
