# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Property < ApplicationRecord
  has_one :tenant
  has_many :payments, through: :tenant
  has_one :agent, through: :tenant

validates :name, presence: true
end
