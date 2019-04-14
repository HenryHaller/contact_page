class LeadsController < ApplicationController
  include Trello
  include Slack
  def home
    @lead = Lead.new
  end

  def lead
    @lead = Lead.new(lead_params)
    if @lead.valid?
      post_lead
      notify_slack
      render :success
    else
      render :home
    end
  end

  def success; end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :company, :introduction, :email)
  end
end
