class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
    # else
    #   render json: {error: "Not found"}, status: :not_found
    # end
  end

end
