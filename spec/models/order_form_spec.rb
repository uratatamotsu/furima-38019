require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品の購入' do
    
    context '購入できる時' do
      it 'user_id, item_id, post_code, delivery_area_id, city, address, tell, tokenがあれば購入できる' do
        expect(@order_form).to be_valid
      end
    end

    context '購入出来ない時' do
      it '郵便番号が無ければ購入出来ない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が(---)では購入出来ない' do
        @order_form.delivery_area_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '市区町村が無ければ購入出来ない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が無ければ購入出来ない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が無ければ購入出来ない' do
        @order_form.tell = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tokenが無ければ購入出来ない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」でなければ購入出来ない' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号は、半角文字列でなければ購入出来ない' do
        @order_form.post_code = '１２３-４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '電話番号は、10桁以上11桁以内でなければ購入出来ない' do
        @order_form.tell = '0901234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tell is invalid")
      end
      it '電話番号は、半角数値でなければ購入出来ない' do
        @order_form.tell = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tell is invalid")
      end
      
    end
  end
end
