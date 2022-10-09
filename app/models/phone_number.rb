class PhoneNumber < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :contracts, dependent: :destroy

  validates :telephone_number, presence: true, uniqueness: true
  validates :sale_status, presence: true

  enum sale_status: { no_contract: 0, under_contract: 1, number_freeze: 2}
end
