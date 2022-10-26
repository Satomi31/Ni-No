class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :contracts, dependent: :destroy

  validates :company_name, presence: true
  validates :email, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :password, presence: true, on: :create

  def self.guest
    find_or_create_by!(company_name: "guestuser" , post_code: "0000000", address: "guest", telephone_number: "0000000000", last_name: "guest", first_name: "guest", email: "guest@example.com") do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.email = "guest@example.com"
    end
  end

end
