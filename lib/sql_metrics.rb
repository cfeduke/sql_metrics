require "mongo_mapper"
require "sql_metrics/metric"
require "active_support/notifications"

MongoMapper.database = "sql_metrics-#{Rails.env}"

ActiveSupport::Notifications.subscribe /^sql\./ do |*args|
  SqlMetrics::Metric.store!(args)
end

module SqlMetrics
  
end