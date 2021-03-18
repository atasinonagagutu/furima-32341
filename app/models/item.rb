class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :Prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image
  validates :price, :numericality => {
    :greater_than_or_equal_to => 300,
    :less_than_or_equal_to => 9999999}

  with_options presence:true do
  validates :name, :description, :price, :image
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id, :status_id, :delivery_fee_id,
            :prefecture_id, :delivery_day_id
  end


end
