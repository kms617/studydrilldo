Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false

  config.serve_static_assets  = true
  config.static_cache_control = 'public, max-age=3600'

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false

  config.action_dispatch.show_exceptions = false

  config.action_controller.allow_forgery_protection = false

  config.action_mailer.delivery_method = :test
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
  config.action_mailer.default_options = { from: "test@example.com" }

  config.action_mailer.default_options = {
    from: "test@example.com"
  }

  config.active_support.deprecation = :stderr


  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
end
