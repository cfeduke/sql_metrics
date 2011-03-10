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
  
  mattr_accessor :mute_regexp
  @@mute_regexp = nil
  
  class MuteMiddleware
    def initialize(app)
      @app = app
    end
    
    def call(env)
      if SqlMetrics.mute_regexp && env["PATH_INFO"] =~ SqlMetrics.mute_regexp
        SqlMetrics.mute!{ @app.call(env) }
      else
        @app.call(env)
      end
    end
  end
end