class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:index]

  def index

  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.create(purchase_params)
  end

  private

  def purchase_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_purchase
    # @purchase = Purchase.find(params[:item_id])
    @purchase = Item.find(params[:item_id])
  end
end
