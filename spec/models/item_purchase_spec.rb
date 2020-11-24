require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @seller = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @seller.id)
      @buyer = FactoryBot.create(:user)
      @item_purchase = FactoryBot.build(:item_purchase, user_id: @buyer.id, item_id: @item.id)
      sleep(3)
    end

    context '商品購入ができる時' do
      it 'post_code,prefecture_id,city,area,building_name,phone_numberが存在すれば登録できること' do
        expect(@item_purchase).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @item_purchase.building_name = nil
        expect(@item_purchase).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'post_codeが空だと購入できないこと' do
        @item_purchase.post_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @item_purchase.post_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code Input correctly")
      end

      it 'prefecture_idを選択していないと購入できないこと' do
        @item_purchase.prefecture_id = 0
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空だと購入できないこと' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'areaが空だと購入できないこと' do
        @item_purchase.area = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Area can't be blank")
      end

      it 'phone_numberが空だと購入できないこと' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字以外だと購入できないこと' do
        @item_purchase.phone_number = '090aaaaaaaa'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが11桁より大きいと購入できないこと' do
        @item_purchase.phone_number = '090123456789'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number 11 numbers or less")
      end

    end
  end
end
