module SqlMetrics
  def self.mute!
    Thread.current["sql_metrics.mute"] = true
    yield
  ensure
    Thread.current["sql_metrics.mute"] = false
  end
  
  def self.mute?
    Thread.current["sql_metrics.mute"] || false
  end
end