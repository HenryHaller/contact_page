# frozen_string_literal: true

# This is the unique identifier fo the list we want to append to
IDLIST = '5cadedda0084f103c4043c94'
KEY = ENV['TRELLO_KEY']
TOKEN = ENV['TRELLO_TOKEN']

module Trello
  extend ActiveSupport::Concern
  included do
    def post_lead
      name = @lead.company
      desc = "#{@lead.introduction}\n#{@lead.first_name} #{@lead.last_name}\n#{@lead.email}"
      params = { key: KEY, token: TOKEN, idList: IDLIST, name: name, desc: desc }
      HTTP.post('https://api.trello.com/1/cards?' + params.to_query)
    end
  end
end
