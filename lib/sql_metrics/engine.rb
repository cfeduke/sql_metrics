module SqlMetrics
  class Engine < Rails::Engine
    config.app_middleware.insert_after "ActionDispatch::Callbacks", "SqlMetrics::MuteMiddleware"
    config.sql_metrics = SqlMetrics
  end
end