class Package < ApplicationRecord
  belongs_to :truck, optional: true
end
