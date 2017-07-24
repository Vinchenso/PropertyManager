# frozen_string_literal: true
# frozen_string_literal: true
require_relative '../../../app/services/import/balances'

namespace :import do
  desc 'Import balances from Google Spreadsheet into Database'
  task :balances do
    Import::Balances.new(auth_file: "#{Rails.root}/app/services/import/config.json",
                         spreadsheet_title: 'Parkview Properties',
                         worksheet_title: 'Balances',
                         num_of_rows: 15)

  end
end
