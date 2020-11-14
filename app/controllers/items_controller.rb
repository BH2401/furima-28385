class ItemsController < ApplicationController
  # before_action :authenticate_user!
  def index
    
  end

  private

  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
