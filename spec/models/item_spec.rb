require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    context '商品出品ができる時' do
      it 'image,name,description,category_id,condition_id,postage_payer_id,prefecture_id,handling_time_id,priceが存在すれば出品できること' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品ができない時' do
      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では出品できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idを選択していないと出品できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'condition_idを選択していないと出品できないこと' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it 'postage_payer_idを選択していないと出品できないこと' do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer Select')
      end

      it 'prefecture_idを選択していないと出品できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end

      it 'handling_time_idを選択していないと出品できないこと' do
        @item.handling_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Handling time Select')
      end

      it 'priceが空では出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字だと出品できないこと' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end

      it 'priceが¥300未満だと出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが¥9,999,999円を超過すると出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
