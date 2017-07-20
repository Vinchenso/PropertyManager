# == Schema Information
#
# Table name: bank_accounts
#
#  id             :integer          not null, primary key
#  name           :string
#  institution    :string
#  type           :string
#  class          :string
#  zapier_index   :integer
#  account_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class BankAccount < ApplicationRecord
  has_many :account_balances
end
