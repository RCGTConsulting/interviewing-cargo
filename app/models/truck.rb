class Truck < ApplicationRecord
  has_many :packages

  validates :cargo_size, comparison: { less_than_or_equal_to: :capacity }

  def load_cargo(package)
    package.update!(truck: self)
  end

  def cargo_size
    packages.sum(&:size)
  end

  private

  def capacity_not_exceeded
    cargo_size <= capacity
  end
end
