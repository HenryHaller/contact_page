# frozen_string_literal: true

# This is the unique identifier fo the list we want to append to
IDLIST = '5cadedda0084f103c4043c94'
KEY = ENV['TRELLO_KEY']
TOKEN = ENV['TRELLO_TOKEN']

module Trello
  extend ActiveSupport::Concern
  included do
    def post_lead(first_name:, last_name:, email:, company:, introduction:)
      name = company
      desc = "#{introduction}\n#{first_name} #{last_name}\n#{email}"
      params = { key: KEY, token: TOKEN, idList: IDLIST, name: name, desc: desc }
      HTTP.post('/1/cards?' + params.to_query)
    end
  end
end
