# == Schema Information
#
# Table name: tenants
#
#  id          :integer          not null, primary key
#  name        :string
#  agent_id    :integer
#  property_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tenants_on_agent_id     (agent_id)
#  index_tenants_on_property_id  (property_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#  fk_rails_...  (property_id => properties.id)
#

class Tenant < ApplicationRecord
  belongs_to :agent
  belongs_to :property
  has_many :payments


  validates :agent, presence: true
  validates :property , presence: true
  validates :name, presence: true
end
