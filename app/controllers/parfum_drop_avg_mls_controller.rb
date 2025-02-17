class ParfumDropAvgMlsController < ActionController::Base
  before_action :ensure_current_user
  def update
    ml = params[:parfum_drop_avg_ml][:ml]
    @updated = ParfumDropAvgMl.first.update(ml: ml)
  end

end