class Ride < ActiveRecord::Base
belongs_to :attraction
belongs_to :user

  def take_ride
    #instance of the user & attraction
    user = self.user
    attraction = self.attraction
    if user_has_enough_tickets?(user, attraction) && user_is_tall_enough?(user, attraction)
      start_ride
    elsif !user_is_tall_enough?(user, attraction) && !user_has_enough_tickets?(user, attraction)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !user_has_enough_tickets?(user, attraction)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !user_is_tall_enough?(user, attraction)
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end

  def user_has_enough_tickets?(user, attraction)
    if user.tickets
      user.tickets >= attraction.tickets
    end
  end

  def user_is_tall_enough?(user, attraction)
    if user.height
      user.height >= attraction.min_height
    end
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

end
