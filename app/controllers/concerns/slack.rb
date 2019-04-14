# frozen_string_literal: true

# This is the unique identifier fo the list we want to append to
SLACK_URL = ENV['SLACK_URL']
module Slack
  extend ActiveSupport::Concern
  included do
    def notify_slack
      data = { text: "New Lead: #{@lead.company}" }
      r = HTTP.post(SLACK_URL, json: data)
      if r.status != 200
        Rails.logger.warn(r.status.to_s)
        Rails.logger.warn(r.body.to_s)
      end
      r
    end
  end
end
