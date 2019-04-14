# frozen_string_literal: true

# This is the unique identifier fo the list we want to append to
IDLIST = Settings.id_list
KEY = ENV['TRELLO_KEY']
TOKEN = ENV['TRELLO_TOKEN']

module Trello
  extend ActiveSupport::Concern
  included do
    def post_lead
      name = @lead.company
      desc = "#{@lead.introduction}\n#{@lead.first_name} #{@lead.last_name}\n#{@lead.email}"
      params = { key: KEY, token: TOKEN, idList: IDLIST, name: name, desc: desc }
      r = HTTP.post('https://api.trello.com/1/cards?' + params.to_query)
      if r.status != 200
        Rails.logger.warn(r.status.to_s)
        Rails.logger.warn(r.body.to_s)
      end
      r
    end
  end
end
