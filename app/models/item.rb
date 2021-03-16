class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :Prefecture
  belongs_to :delivery_day

  with_options presence:true do
  validates :name, :description, :price
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id, :status_id, :delivery_fee_id,
            :prefecture_id, :delivery_day_id
  end

end
