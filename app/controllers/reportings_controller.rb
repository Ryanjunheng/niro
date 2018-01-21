class ReportingsController < ApplicationController

  def user_create
    create_report
  end

  def user_event_create
    create_report
  end

  def org_create
    create_report
  end

  def org_event_create
    create_report
  end

  private

  def reporting_params
    params.require(:reporting).permit(:reported_id, :reported_type, :reporter_id, :comment)
  end

  def create_report
    @reporting = Reporting.new(reporting_params)
    if @reporting.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
      @flash = {error: "there is an error in your reporting, please try again."}
    end
  end

end
