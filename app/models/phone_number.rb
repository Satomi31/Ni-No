class PhoneNumber < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :contracts, dependent: :destroy

  validates :telephone_number, presence: true, uniqueness: true
  validates :sale_status, presence: true

  enum sale_status: { no_contract: 0, under_contract: 1, number_freeze: 2}

  def self.search(keyword)
    where(["telephone_number like?", "%#{keyword}%"])
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, skip_blanks: true).with_index(2) do |row|
      phone_number = PhoneNumber.new
      phone_number.attributes = row.to_hash.slice(*updatable_attributes)
      phone_number.save
    end
  end

  def self.updatable_attributes
   ["telephone_number", "sale_status"]
  end

end
