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

  def self.good_number_search()
    # 良番を増やす場合はこちらの配列に追記する
    target_number_list = [
      # XXXX
      "0000", "1111", "2222", "3333", "4444", "5555", "6666", "7777", "8888", "9999",
      # XXXY
      "0001", "0002", "0003", "0004", "0005", "0006", "0007", "0008", "0009",
      "1110", "2220", "3330", "4440", "5550", "6660", "7770", "8880", "9990",
      # XXYY
      "0011", "0022", "0033", "0044", "0055", "0066", "0077", "0088", "0099",
      "1100", "2200", "3300", "4400", "5500", "6600", "7700", "8800", "9900",
      # XYYY
      "0111", "0222", "0333", "0444", "0555", "0666", "0777", "0888", "0999",
      "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000",
      # XYXY
      "0101", "0202", "0303", "0404", "0505", "0606", "0707", "0808", "0909",
      "1010", "2020", "3030", "4040", "5050", "6060", "7070", "8080", "9090",
      # 連番
      "0123", "1234"
    ]

    tmp_where = PhoneNumber.where(sale_status: 0)

    target_number_list.each_with_index do |number, index|
      # 1回目はandの条件でwhereを追記
      if index == 0
        tmp_where = tmp_where.where(["telephone_number like ?", "%#{number}"])
      else
        # 2回目移行はorの条件で追記
        tmp_where = tmp_where.or(PhoneNumber.where(sale_status: 0).where(["telephone_number like ?", "%#{number}"]))
      end
    end
    #コントローラーに渡す
    return tmp_where

  end

end
