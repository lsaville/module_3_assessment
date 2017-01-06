class Api::V1::ItemsController < ActionController::Base
  def index
    render json: Item.all
  end

  def show
  end
end
