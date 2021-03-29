class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :city, :address_line
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase_user = PurchaseUser.create(user_id: current_user.id, item_id: params[:item_id])
    Destination.create(postal_code: postal_code, prefecture_id: prefecture, city: city, address_line: address_line, building: building, purchase_user_id: purchase_user)
  end
end