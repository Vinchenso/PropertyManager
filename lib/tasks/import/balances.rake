# frozen_string_literal: true
require_relative '../../../app/services/import/balances'
#require 'pry'
require 'json'

namespace :import do
  desc 'Import balances from Google Spreadsheet into Database'
  task balances: :environment do
    data = Import::Balances.new(auth_file: "#{Rails.root}/app/services/import/config.json",
                                spreadsheet_title: 'Parkview Properties',
                                worksheet_title: 'Balances',
                                num_of_rows: 15).data
    new_data = data.map(&:to_h)

    new_data.each do |row|
      bank_account = BankAccount.find_by(spreadsheet_index: row['Index'])
      bank_account.nil? ? create_bank_account_and_balance(row) : create_account_balance(row, bank_account.id)
    end

    # {"Account Name"=>"fnb commercial platinum",
    #  "Account #"=>"xxxx5000",
    #  "Institution"=>"First National Bank (South Africa) - Credit Card",
    #  "Type"=>"Credit",
    #  "Class"=>"Liability",
    #  "Date"=>"7/24/2017",
    #  "Latest Balance"=>"$79,664.00",
    #  ""=>"Your current account balances are listed here.",
    #  "max Date"=>"7/24/2017",
    #  "max Time"=>"12:49:21 PM",
    #  "Index"=>"13"}
  end

  def create_account_balance(row, linked_balance_account)
    AccountBalance.create!(
      uploadedTime: row['max Time'].to_time,
      uploadedDate: Date.strptime(row['max Date'], '%m/%d/%Y'),
      amount: row['Latest Balance'].sub('$', '').to_d,
      bank_account_id: linked_balance_account
    )
    puts 'Created an account balance record'
  end

  def create_bank_account_and_balance(row)
    new_bank_account = BankAccount.new(
      name: row['Account Name'],
      institution: row['Institution'],
      account_type: row['Type'],
      account_klass: row['Class'],
      spreadsheet_index: row['Index'],
      account_number: row['Account #']
    )

    puts 'Created an new bank account reference'
    create_account_balance(row, new_bank_account.id) if new_bank_account.save
  end
end
