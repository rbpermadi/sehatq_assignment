DeviseTokenAuth.setup do |config|
  config.change_headers_on_each_request = false
  config.enable_standard_devise_support = true
  config.default_confirm_success_url=true
end