class Contract < ApplicationRecord
  belongs_to :customer
  belongs_to :phone_number

end
