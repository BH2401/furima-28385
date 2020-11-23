class ItemPurchase

  include ActiveModel::Model
  attr_accessor :card_information, :month, :year, :security_code, :post_code, :prefecture_id, :city, :area, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city
    validates :area
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, area: area, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end