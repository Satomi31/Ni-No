class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :phone_number

  validates :customer_id, presence: true
  validates :phone_number_id, presence: true

end
