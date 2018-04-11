class RideController < ApplicationController

def rideit
  @ride = Ride.new(:user_id => current_user.id, :attraction_id => params[:attraction_id])
  @attraction = Attraction.find(@ride.attraction_id)
  if @ride.take_a_ride == 1
    not_tall_enough
    not_enough_tickets
    redirect_to "/attractions/#{@ride.attraction_id}"
  elsif @ride.take_a_ride == 2
    not_enough_tickets
    redirect_to "/attractions/#{@ride.attraction_id}"
  elsif @ride.take_a_ride == 3
    not_tall_enough
    redirect_to "/attractions/#{@ride.attraction_id}"
  else
    @ride.take_a_ride
    flash[:message] = "Thanks for riding the #{@attraction.name}!"
    redirect_to user_path(@ride.user_id)
  end
end

private

  def not_tall_enough
    flash[:message] = "You are not tall enough to ride the #{@attraction.name}"
  end

  def not_enough_tickets
    flash[:message2] = "You do not have enough tickets to ride the #{@attraction.name}"
  end
end
