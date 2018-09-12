class MostDangerousDayController < ApplicationController
  def index
    @presenter = MostDangerousDayPresenter.new(params[:start_date], params[:end_date])
  end
end
