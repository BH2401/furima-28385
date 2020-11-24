class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:index, :create]

  def index
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)

    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:post_code, :prefecture_id, :city, :area, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def set_purchase
    # @purchase = Purchase.find(params[:item_id])
    @item = Item.find(params[:item_id])
  end
end
