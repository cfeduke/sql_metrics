class SqlMetricsController < ApplicationController
  def index
    @metrics = SqlMetrics::Metric.all
  end
  
  def destroy
    @metric = SqlMetrics::Metric.find(params[:id])
    @metric.destroy
    redirect_to sql_metrics_url
  end
end