class Car < ActiveRecord::Base
  validates_presence_of :manufacturer, :model, :rent_price, :state
  validates :model, :numericality => { :only_integer => true, :less_than_or_equal_to => Time.now.year }
  validates :state, :inclusion => { :in => %w( rented available maintenance insuring licensing ) }

  def self.available_cars
    self.where("cars.state = 'available'")
  end
  def self.cars_in_maintenance
    self.where("cars.state = 'maintenance'")
  end
  def self.cars_insuring
    self.where("cars.state = 'insuring'")
  end
  def self.cars_licensing
    self.where("cars.state = 'licensing'")
  end
end
