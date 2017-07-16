# == Schema Information
#
# Table name: agents
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agent < ApplicationRecord
  has_many :tenants
  validates :name, presence: true
end
