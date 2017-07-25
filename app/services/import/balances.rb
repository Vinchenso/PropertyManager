# frozen_string_literal: true
require 'google_drive'

module Import
  class Balances
    def initialize(auth_file:, spreadsheet_title:, worksheet_title:, num_of_rows:)
      @auth_file = auth_file
      @spreadsheet_title = spreadsheet_title
      @worksheet_title = worksheet_title
      @num_of_rows = num_of_rows
      @data

      session = connect_to_data_source
      import_data(session)
    end

    attr_reader :data

    private

    def connect_to_data_source
      GoogleDrive::Session.from_service_account_key(@auth_file)
    end

    def import_data(session)
      spreadsheet = session.file_by_title @spreadsheet_title
      ws = spreadsheet.worksheet_by_title @worksheet_title
      @data = ws.list.take(@num_of_rows)
    end
  end
end
