class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_a_ride
    user = User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return 1
    elsif user.tickets < attraction.tickets
      return 2
    elsif user.height < attraction.min_height
      return 3
    else
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    end
  end

end
