class Package < ApplicationRecord
  belongs_to :truck, optional: true

  validates_associated :truck
end
