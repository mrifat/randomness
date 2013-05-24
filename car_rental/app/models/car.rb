class Car < ActiveRecord::Base
  validates_presence_of :type, :model, :rent_price, :state
  validates :model, :numericality => { :only_integer => true, :less_than_or_equal_to => Time.now.year }
  validates :state, :inclusion => { :in => %w( rented available maintenance insuring licensing ) }
end
