require "mongo_mapper"
require "active_support/notifications"
require "sql_metrics/engine"
require "sql_metrics/mute_middleware"

MongoMapper.database = "sql_metrics-#{Rails.env}"

ActiveSupport::Notifications.subscribe /^sql\./ do |*args|
  SqlMetrics::Metric.store!(args) unless SqlMetrics.mute?
end

module SqlMetrics
  
end