class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user
        items = user.items 
        render json: items, status: :ok
      else
        render json: {error: "Not found"}, status: :not_found
      end
    else
      items = Item.all
      render json: items, include: :user
    end
  end

  def show
    item = Item.find_by(id:params[:id])
    if item
      render json: item, status: :ok
    else
      render json: { error: "Not found"}, status: :not_found
    end
      
  end

  def create
    user = User.find_by(id: params[:user_id])
    new_item = user.items.create(item_params)
    render json: new_item, status: :created
  end
  #"name"=>"Garden gnomes", "description"=>"No refunds", "price"=>23,

  private

  def item_params
    params.permit(:name, :description, :price)
  end


end
