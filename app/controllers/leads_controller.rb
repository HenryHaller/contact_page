class LeadsController < ApplicationController
  include Trello
  def home
    @lead = Lead.new
  end

  def lead
    @lead = Lead.new(lead_params)
    if @lead.valid?
      r = post_lead
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
