class Api::V1::ItemsController < ActionController::Base
  def index
    render json: Item.all
  end

  def show
    render json: Item.find_by(params[:id])
  end

  def destroy
    item = Item.find_by(params[:id])
    if item.delete
      render nothing: true, status: 204 
    else
      render nothing: true, status: 400
    end
  end
end
