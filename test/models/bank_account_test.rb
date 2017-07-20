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

require 'test_helper'

class BankAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
