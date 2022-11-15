class Truck < ApplicationRecord
  has_many :packages

  def load(package)
    package.update!(truck: self)
  end
end
