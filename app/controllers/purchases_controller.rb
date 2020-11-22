class PurchasesController < ApplicationController

  def index
  end

  def create
    @purchase = Purchase.create(purchase_params)
    redirect_to item_purchases_path

  end

  private

  def purchase_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, :price).merge(user_id: current_user.id)
  end
end
