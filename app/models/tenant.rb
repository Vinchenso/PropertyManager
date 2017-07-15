class Tenant < ApplicationRecord
  belongs_to :agent
  belongs_to :property
  has_many :payments
end
