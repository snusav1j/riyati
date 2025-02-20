class ParfumDropAvgMlsController < ActionController::Base

  def update
    ml = params[:parfum_drop_avg_ml][:ml]
    @updated = ParfumDropAvgMl.first.update(ml: ml)
  end

end