class Api::V1::ItemsController < ActionController::Base
  def index
    render json: Item.all
  end
end
