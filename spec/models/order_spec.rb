require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '配送先情報の保存' do
    before do
      @order = FactoryBot.build(:order)
    end

    it '郵便番号・都道府県・市区町村・番地・電話番号が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'postal_cordに半角ハイフンがないと保存できないこと' do
      @order.postal_cord = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal cord is invalid")
    end
    it 'prefectureが空だと保存できないこと' do
      @order.prefecture_id = '1'
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'address_lineが空だと保存できないこと' do
      @order.address_line = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address line can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @order.building = ''
      expect(@order).to be_valid
    end
    it 'phone_numberが11桁以下だと保存できること' do
      @order.phone_number = '1'
      expect(@order).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが数字以外だと保存できないこと' do
      @order.phone_number = 'a'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is not a number")
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @order.phone_number = '090123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
