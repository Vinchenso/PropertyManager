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

require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
