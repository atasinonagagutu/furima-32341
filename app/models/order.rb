class Order
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :city, :address_line, :token, :user_id, :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase_user = PurchaseUser.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_cord: postal_cord, prefecture_id: prefecture_id, city: city, address_line: address_line,
                       building: building, phone_number: phone_number, purchase_user_id: purchase_user.id)
  end
end
