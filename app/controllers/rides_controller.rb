class RidesController < ApplicationController

  def new
    @ride = Ride.new(user_id: @current_user.id, attraction_id: params[:attraction_id])
    @message = @ride.take_ride
    redirect_to user_path(@current_user), flash: {notice: @message}
  end

end
