# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  date       :date
#  amount     :integer
#  tenant_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_payments_on_tenant_id  (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (tenant_id => tenants.id)
#

class Payment < ApplicationRecord
  belongs_to :tenant
  validates :amount, numericality: true
  validates :date, :amount, :tenant_id, presence: true
end
