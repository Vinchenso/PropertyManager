# == Schema Information
#
# Table name: account_balances
#
#  id              :integer          not null, primary key
#  uploadedTime    :time
#  uploadedDate    :date
#  amount          :decimal(, )
#  bank_account_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_account_balances_on_bank_account_id  (bank_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (bank_account_id => bank_accounts.id)
#

class AccountBalance < ApplicationRecord
  belongs_to :bank_account
end
