class Api::V1::ItemsController < ActionController::Base
  def index
    render json: Item.all
  end

  def show
    render json: Item.find_by(params[:id])
  end
end
