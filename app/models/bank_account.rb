# == Schema Information
#
# Table name: bank_accounts
#
#  id                :integer          not null, primary key
#  name              :string
#  institution       :string
#  account_type      :string
#  account_klass     :string
#  account_number    :string
#  spreadsheet_index :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class BankAccount < ApplicationRecord
end
