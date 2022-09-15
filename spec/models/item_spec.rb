require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    
  end

  describe '商品の出品' do
    
    context '出品できる時' do
      it 'exhibits_name, exhibits_text, money, category_id, situation_id, shipping_cost_id, delivery_area_id, shipping_days_id, imageがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it 'exhibits_nameが空で出品はできない' do
        @item.exhibits_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Exhibits name can't be blank")
      end
      it 'exhibits_textが空では出品できない' do
        @item.exhibits_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Exhibits text can't be blank")
      end
      it 'moneyが空では出品できない' do
        @item.money = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Money can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'situation_idが空では出品できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it 'shipping_cost_idが空では出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it 'delivery_area_idが空では出品できない' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'shipping_days_idが空では出品できない' do
        @item.shipping_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '価格が300以下では出品できない' do
        @item.money = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Money must be greater than or equal to 300")
      end
      it '価格が9,999,999以上では出品できない' do
        @item.money = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Money must be less than or equal to 9999999")
      end
      
    end




  end
end